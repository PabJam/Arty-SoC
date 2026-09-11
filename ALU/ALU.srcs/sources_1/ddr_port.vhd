----------------------------------------------------------------------------------
-- ddr_port - bridges the softcore's 32-bit memory protocol to the MIG
--            native user interface (128-bit, BL8).
--
-- CPU side matches the existing dm_* protocol:
--   i_DV pulses high for one cycle with i_Addr / i_Data / i_Wr_En valid.
--   o_DV pulses high for one cycle when the access completes.
--   Reads return data on o_Data. WRITES ALSO ACKNOWLEDGE, because DDR can
--   refuse a command for a long time and a fire-and-forget store would be
--   silently dropped.
--
-- One transaction in flight. No reordering questions, no write FIFO that can
-- overflow. Loads already cost 20+ cycles on DDR so the lost pipelining is
-- not where the time goes.
--
-- Address: app_addr counts 16-bit DDR words, one 128-bit beat spans 8 of
-- them (= 16 bytes), so app_addr = byte_addr/2 with the low 3 bits zero.
--
-- Sub-word writes use app_wdf_mask (1 = do NOT write that byte), so sb/sh/sw
-- all work without a read-modify-write.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ddr_port is
	port (
		i_Clk    : in  std_logic;
		i_Rst    : in  std_logic;                       -- active high (ui_clk_sync_rst)

		-- CPU side
		i_Addr   : in  std_logic_vector(31 downto 0);
		i_Data   : in  std_logic_vector(31 downto 0);
		i_Wr_En  : in  std_logic_vector(3 downto 0);
		i_DV     : in  std_logic;
		o_Data   : out std_logic_vector(31 downto 0);
		o_DV     : out std_logic;
		o_Error  : out std_logic;                       -- sticky: access before calibration

		-- MIG native user interface
		i_Calib_Done      : in  std_logic;
		o_app_addr        : out std_logic_vector(27 downto 0);
		o_app_cmd         : out std_logic_vector(2 downto 0);
		o_app_en          : out std_logic;
		i_app_rdy         : in  std_logic;
		o_app_wdf_data    : out std_logic_vector(127 downto 0);
		o_app_wdf_end     : out std_logic;
		o_app_wdf_mask    : out std_logic_vector(15 downto 0);
		o_app_wdf_wren    : out std_logic;
		i_app_wdf_rdy     : in  std_logic;
		i_app_rd_data     : in  std_logic_vector(127 downto 0);
		i_app_rd_data_valid : in std_logic
	);
end ddr_port;

architecture Behavioral of ddr_port is

	constant C_CMD_WRITE : std_logic_vector(2 downto 0) := "000";
	constant C_CMD_READ  : std_logic_vector(2 downto 0) := "001";

	type t_state is (S_IDLE, S_WR, S_RD_CMD, S_RD_WAIT);
	signal state : t_state := S_IDLE;

	signal app_addr     : std_logic_vector(27 downto 0)  := (others => '0');
	signal app_cmd      : std_logic_vector(2 downto 0)   := (others => '0');
	signal app_en       : std_logic := '0';
	signal app_wdf_data : std_logic_vector(127 downto 0) := (others => '0');
	signal app_wdf_end  : std_logic := '0';
	signal app_wdf_mask : std_logic_vector(15 downto 0)  := (others => '1');
	signal app_wdf_wren : std_logic := '0';

	signal cmd_sent  : std_logic := '0';
	signal data_sent : std_logic := '0';

	signal word_sel  : unsigned(1 downto 0) := (others => '0');  -- i_Addr(3 downto 2)

begin

	o_app_addr     <= app_addr;
	o_app_cmd      <= app_cmd;
	o_app_en       <= app_en;
	o_app_wdf_data <= app_wdf_data;
	o_app_wdf_end  <= app_wdf_end;
	o_app_wdf_mask <= app_wdf_mask;
	o_app_wdf_wren <= app_wdf_wren;

	process (i_Clk)
		variable v_mask : std_logic_vector(15 downto 0);
		variable v_w    : natural range 0 to 3;
	begin
		if rising_edge(i_Clk) then
			o_DV <= '0';

			if i_Rst = '1' then
				state        <= S_IDLE;
				app_en       <= '0';
				app_wdf_wren <= '0';
				app_wdf_end  <= '0';
				cmd_sent     <= '0';
				data_sent    <= '0';
				o_Error      <= '0';
				o_Data       <= (others => '0');
			else

				case state is

					when S_IDLE =>
						app_en       <= '0';
						app_wdf_wren <= '0';
						app_wdf_end  <= '0';
						cmd_sent     <= '0';
						data_sent    <= '0';

						if i_DV = '1' then
							if i_Calib_Done = '0' then
								-- Do not hang the core. Acknowledge immediately,
								-- return zeros, and latch the error so software
								-- can see it in the status register.
								o_Data  <= (others => '0');
								o_DV    <= '1';
								o_Error <= '1';
							else
								-- app_addr = byte address / 2, 16-byte aligned
								app_addr <= '0' & i_Addr(27 downto 4) & "000";
								word_sel <= unsigned(i_Addr(3 downto 2));
								v_w      := to_integer(unsigned(i_Addr(3 downto 2)));

								if i_Wr_En = "0000" then
									app_cmd <= C_CMD_READ;
									app_en  <= '1';
									state   <= S_RD_CMD;
								else
									app_cmd <= C_CMD_WRITE;
									app_en  <= '1';

									-- replicate the word into all four lanes;
									-- the mask decides which bytes land
									app_wdf_data <= i_Data & i_Data & i_Data & i_Data;

									v_mask := (others => '1');
									for b in 0 to 3 loop
										if i_Wr_En(b) = '1' then
											v_mask(4*v_w + b) := '0';
										end if;
									end loop;
									app_wdf_mask <= v_mask;

									app_wdf_wren <= '1';
									app_wdf_end  <= '1';
									state        <= S_WR;
								end if;
							end if;
						end if;

					-------------------------------------------------------------
					-- Command port and write-data port are independent FIFOs and
					-- may be accepted on different cycles. Track each, hold
					-- whichever is still outstanding.
					-------------------------------------------------------------
					when S_WR =>
						if app_en = '1' and i_app_rdy = '1' then
							cmd_sent <= '1';
							app_en   <= '0';
						end if;
						if app_wdf_wren = '1' and i_app_wdf_rdy = '1' then
							data_sent    <= '1';
							app_wdf_wren <= '0';
							app_wdf_end  <= '0';
						end if;

						if ((cmd_sent = '1')  or (app_en = '1'       and i_app_rdy = '1')) and
						   ((data_sent = '1') or (app_wdf_wren = '1' and i_app_wdf_rdy = '1')) then
							o_DV  <= '1';          -- acknowledge the store
							state <= S_IDLE;
						end if;

					when S_RD_CMD =>
						if app_en = '1' and i_app_rdy = '1' then
							app_en <= '0';
							state  <= S_RD_WAIT;
						end if;

					when S_RD_WAIT =>
						if i_app_rd_data_valid = '1' then
							case word_sel is
								when "00"   => o_Data <= i_app_rd_data(31  downto 0);
								when "01"   => o_Data <= i_app_rd_data(63  downto 32);
								when "10"   => o_Data <= i_app_rd_data(95  downto 64);
								when others => o_Data <= i_app_rd_data(127 downto 96);
							end case;
							o_DV  <= '1';
							state <= S_IDLE;
						end if;

				end case;
			end if;
		end if;
	end process;

end Behavioral;
