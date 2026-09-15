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
-- Address: app_addr counts 16-bit DDR words, one 128-bit beat spans 8 of
-- them (= 16 bytes), so app_addr = byte_addr/2 with the low 3 bits zero.
--
-- TWO SINGLE LINE CACHES
-- ----------------------
-- rd_cache holds one fully valid 16 byte line fetched from DDR.
-- wr_cache holds one partially dirty 16 byte line not yet written to DDR.
-- wr_cache_mask holds DIRTY bits (1 = this byte has been written since the
-- line was allocated). app_wdf_mask is its inverse, MIG uses 1 = do NOT write.
--
-- A read is answered from, in order:
--   1. rd_cache, if it holds the line                             (1 cycle)
--   2. wr_cache, if it holds the line AND all four bytes of the
--      requested word are dirty                                   (1 cycle)
--   3. DDR, with any dirty bytes we still hold for that line
--      overlaid on the returned data before it is cached
-- Case 3 is why a read never has to flush: the merge produces the same result
-- a flush-then-reread would, without the extra DDR write.
--
-- Writes are mirrored into rd_cache whenever rd_cache holds the same line, so
-- rd_cache stays authoritative and case 1 is always safe.
--
-- A write that lands on a different line than wr_cache currently holds evicts
-- it. The eviction needs no pending state: app_addr / app_wdf_data /
-- app_wdf_mask latch their own copies of the outgoing line, so wr_cache can be
-- reallocated to the new line in the very same cycle.
--
-- NOTE: dirty data is lost on reset, and DDR lags the CPU's view until the
-- write line is evicted. 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ddr_port is
	port (
		i_Clk : in std_logic;
		i_Rst : in std_logic; -- active high (ui_clk_sync_rst)

		-- CPU side
		i_Addr : in std_logic_vector(31 downto 0);
		i_Data : in std_logic_vector(31 downto 0);
		i_Wr_En : in std_logic_vector(3 downto 0);
		i_DV : in std_logic;
		o_Data : out std_logic_vector(31 downto 0);
		o_DV : out std_logic;
		o_Error : out std_logic; -- sticky: access before calibration

		-- MIG native user interface
		i_Calib_Done : in std_logic;
		o_app_addr : out std_logic_vector(27 downto 0);
		o_app_cmd : out std_logic_vector(2 downto 0);
		o_app_en : out std_logic;
		i_app_rdy : in std_logic;
		o_app_wdf_data : out std_logic_vector(127 downto 0);
		o_app_wdf_end : out std_logic;
		o_app_wdf_mask : out std_logic_vector(15 downto 0);
		o_app_wdf_wren : out std_logic;
		i_app_wdf_rdy : in std_logic;
		i_app_rd_data : in std_logic_vector(127 downto 0);
		i_app_rd_data_valid : in std_logic
	);
end ddr_port;

architecture Behavioral of ddr_port is

	constant C_CMD_WRITE : std_logic_vector(2 downto 0) := "000";
	constant C_CMD_READ : std_logic_vector(2 downto 0) := "001";
	constant C_NO_DIRTY : std_logic_vector(15 downto 0) := (others => '0');

	type t_state is (S_IDLE, S_WR, S_RD_CMD, S_RD_WAIT);
	signal state : t_state := S_IDLE;

	signal app_addr : std_logic_vector(27 downto 0) := (others => '0');
	signal app_cmd : std_logic_vector(2 downto 0) := (others => '0');
	signal app_en : std_logic := '0';
	signal app_wdf_data : std_logic_vector(127 downto 0) := (others => '0');
	signal app_wdf_end : std_logic := '0';
	signal app_wdf_mask : std_logic_vector(15 downto 0) := (others => '1');
	signal app_wdf_wren : std_logic := '0';

	signal cmd_sent : std_logic := '0';
	signal data_sent : std_logic := '0';

	signal word_sel : unsigned(1 downto 0) := (others => '0'); -- i_Addr(3 downto 2)

	signal rd_cache : std_logic_vector(127 downto 0) := (others => '0');
	signal rd_cache_addr : std_logic_vector(27 downto 0) := (others => '0');
	signal rd_cache_valid : std_logic := '0';

	signal wr_cache : std_logic_vector(127 downto 0) := (others => '0');
	signal wr_cache_addr : std_logic_vector(27 downto 0) := (others => '0');
	signal wr_cache_mask : std_logic_vector(15 downto 0) := (others => '0'); -- 1 = dirty

begin

	o_app_addr <= app_addr;
	o_app_cmd <= app_cmd;
	o_app_en <= app_en;
	o_app_wdf_data <= app_wdf_data;
	o_app_wdf_end <= app_wdf_end;
	o_app_wdf_mask <= app_wdf_mask;
	o_app_wdf_wren <= app_wdf_wren;

	process (i_Clk)
		variable v_addr : std_logic_vector(27 downto 0);
		variable v_word_sel : unsigned(1 downto 0);
		variable v_w : natural range 0 to 3;
		variable v_data : std_logic_vector(127 downto 0);
		variable v_line : std_logic_vector(127 downto 0);
		variable v_dirty : std_logic_vector(15 downto 0); -- 1 = byte written now
		variable v_rd_hit : boolean;
		variable v_wr_hit : boolean;
	begin
		if rising_edge(i_Clk) then
			o_DV <= '0';

			if i_Rst = '1' then
				state <= S_IDLE;
				app_en <= '0';
				app_wdf_wren <= '0';
				app_wdf_end <= '0';
				cmd_sent <= '0';
				data_sent <= '0';
				o_Error <= '0';
				o_Data <= (others => '0');
				rd_cache <= (others => '0');
				rd_cache_addr <= (others => '0');
				rd_cache_valid <= '0';
				wr_cache <= (others => '0');
				wr_cache_addr <= (others => '0');
				wr_cache_mask <= (others => '0');
			else

				case state is

					when S_IDLE =>
						app_en <= '0';
						app_wdf_wren <= '0';
						app_wdf_end <= '0';
						cmd_sent <= '0';
						data_sent <= '0';

						if i_DV = '1' then
							if i_Calib_Done = '0' then
								-- Do not hang the core. Acknowledge immediately,
								-- return zeros, and latch the error so software
								-- can see it in the status register.
								o_Data <= (others => '0');
								o_DV <= '1';
								o_Error <= '1';
							else
								v_addr := '0' & i_Addr(27 downto 4) & "000";
								v_word_sel := unsigned(i_Addr(3 downto 2));
								v_w := to_integer(v_word_sel);
								word_sel <= v_word_sel;

								v_rd_hit := (v_addr = rd_cache_addr) and (rd_cache_valid = '1');
								v_wr_hit := (v_addr = wr_cache_addr);

								if i_Wr_En = "0000" then
									------------------------------------------------
									-- READ
									------------------------------------------------
									if v_rd_hit then
										case v_word_sel is
											when "00" => o_Data <= rd_cache(31 downto 0);
											when "01" => o_Data <= rd_cache(63 downto 32);
											when "10" => o_Data <= rd_cache(95 downto 64);
											when others => o_Data <= rd_cache(127 downto 96);
										end case;
										o_DV <= '1';

									elsif v_wr_hit and wr_cache_mask((v_w*4 + 3) downto (v_w*4)) = "1111" then
										-- every byte of this word is dirty, so the
										-- write line is authoritative for it
										o_Data <= wr_cache(((v_w+1)*32 - 1) downto (v_w*32));
										o_DV <= '1';

									else
										-- go to DDR. Any dirty bytes we hold for this
										-- line get overlaid on the way back, so there
										-- is no need to flush first.
										app_addr <= v_addr;
										app_cmd <= C_CMD_READ;
										app_en <= '1';
										state <= S_RD_CMD;
									end if;

								else
									------------------------------------------------
									-- WRITE
									------------------------------------------------
									v_data := i_Data & i_Data & i_Data & i_Data;
									v_dirty := (others => '0');
									for b in 0 to 3 loop
										if i_Wr_En(b) = '1' then
											v_dirty(4*v_w + b) := '1';
										end if;
									end loop;

									-- keep rd_cache authoritative
									if v_rd_hit then
										for i in 0 to 15 loop
											if v_dirty(i) = '1' then
												rd_cache(((i+1)*8 - 1) downto (i*8)) <= v_data(((i+1)*8 - 1) downto (i*8));
											end if;
										end loop;
									end if;

									wr_cache_addr <= v_addr;
									for i in 0 to 15 loop
										if v_dirty(i) = '1' then
											wr_cache(((i+1)*8 - 1) downto (i*8)) <= v_data(((i+1)*8 - 1) downto (i*8));
										end if;
									end loop;

									if v_wr_hit then
										wr_cache_mask <= wr_cache_mask or v_dirty;
										o_DV <= '1';
									else
										wr_cache_mask <= v_dirty;
										if wr_cache_mask /= C_NO_DIRTY then
											app_addr <= wr_cache_addr;
											app_cmd <= C_CMD_WRITE;
											app_en <= '1';
											app_wdf_data <= wr_cache;
											app_wdf_mask <= not wr_cache_mask;
											app_wdf_wren <= '1';
											app_wdf_end <= '1';
											state <= S_WR;
										else
											-- first write since reset, nothing to evict
											o_DV <= '1';
										end if;
									end if;
								end if;
							end if;
						end if;

					-------------------------------------------------------------
					-- Command port and write data port are independent FIFOs and
					-- may be accepted on different cycles. Track each, hold
					-- whichever is still outstanding.
					-------------------------------------------------------------
					when S_WR =>
						if app_en = '1' and i_app_rdy = '1' then
							cmd_sent <= '1';
							app_en <= '0';
						end if;
						if app_wdf_wren = '1' and i_app_wdf_rdy = '1' then
							data_sent <= '1';
							app_wdf_wren <= '0';
							app_wdf_end <= '0';
						end if;

						if ((cmd_sent = '1') or (app_en = '1' and i_app_rdy = '1')) and
						   ((data_sent = '1') or (app_wdf_wren = '1' and i_app_wdf_rdy = '1')) then
							o_DV <= '1'; -- acknowledge the store
							state <= S_IDLE;
						end if;

					when S_RD_CMD =>
						if app_en = '1' and i_app_rdy = '1' then
							app_en <= '0';
							state <= S_RD_WAIT;
						end if;

					when S_RD_WAIT =>
						if i_app_rd_data_valid = '1' then
							v_line := i_app_rd_data;

							-- overlay the bytes we are still holding dirty for this
							-- line, so the cached copy is up to date without a flush
							if app_addr = wr_cache_addr then
								for i in 0 to 15 loop
									if wr_cache_mask(i) = '1' then
										v_line(((i+1)*8 - 1) downto (i*8)) := wr_cache(((i+1)*8 - 1) downto (i*8));
									end if;
								end loop;
							end if;

							rd_cache <= v_line;
							rd_cache_addr <= app_addr;
							rd_cache_valid <= '1';

							case word_sel is
								when "00" => o_Data <= v_line(31 downto 0);
								when "01" => o_Data <= v_line(63 downto 32);
								when "10" => o_Data <= v_line(95 downto 64);
								when others => o_Data <= v_line(127 downto 96);
							end case;
							o_DV <= '1';
							state <= S_IDLE;
						end if;

				end case;
			end if;
		end if;
	end process;

end Behavioral;
