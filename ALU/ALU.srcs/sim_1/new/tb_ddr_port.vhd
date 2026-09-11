----------------------------------------------------------------------------------
-- tb_ddr_port - drives the CPU side of ddr_port against mig_stub_ui and
--               checks every read against a software reference model.
--
-- Covers sw / sh / sb at every byte offset, all four word lanes of a line,
-- and accesses spread across several lines, with the stub stalling both
-- ready signals independently and injecting refresh windows.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_ddr_port is
end tb_ddr_port;

architecture sim of tb_ddr_port is

	constant C_PERIOD : time := 12.308 ns;   -- ui_clk, 81.25 MHz

	signal clk    : std_logic := '0';
	signal rst    : std_logic := '1';

	signal c_addr  : std_logic_vector(31 downto 0) := (others => '0');
	signal c_data  : std_logic_vector(31 downto 0) := (others => '0');
	signal c_wren  : std_logic_vector(3 downto 0)  := (others => '0');
	signal c_dv    : std_logic := '0';
	signal c_rdata : std_logic_vector(31 downto 0);
	signal c_rdv   : std_logic;
	signal c_err   : std_logic;

	signal calib   : std_logic;
	signal a_addr  : std_logic_vector(27 downto 0);
	signal a_cmd   : std_logic_vector(2 downto 0);
	signal a_en    : std_logic;
	signal a_rdy   : std_logic;
	signal a_wdata : std_logic_vector(127 downto 0);
	signal a_wend  : std_logic;
	signal a_wmask : std_logic_vector(15 downto 0);
	signal a_wren  : std_logic;
	signal a_wrdy  : std_logic;
	signal a_rdata : std_logic_vector(127 downto 0);
	signal a_rdv   : std_logic;

	-- reference model: byte addressable
	type t_ref is array (0 to 4095) of std_logic_vector(7 downto 0);
	shared variable ref : t_ref := (others => (others => '0'));

	signal errors : natural := 0;
	signal checks : natural := 0;

begin

	clk <= not clk after C_PERIOD / 2;

	dut : entity work.ddr_port
		port map (
			i_Clk => clk, i_Rst => rst,
			i_Addr => c_addr, i_Data => c_data, i_Wr_En => c_wren, i_DV => c_dv,
			o_Data => c_rdata, o_DV => c_rdv, o_Error => c_err,
			i_Calib_Done => calib,
			o_app_addr => a_addr, o_app_cmd => a_cmd, o_app_en => a_en, i_app_rdy => a_rdy,
			o_app_wdf_data => a_wdata, o_app_wdf_end => a_wend, o_app_wdf_mask => a_wmask,
			o_app_wdf_wren => a_wren, i_app_wdf_rdy => a_wrdy,
			i_app_rd_data => a_rdata, i_app_rd_data_valid => a_rdv
		);

	mem : entity work.mig_stub_ui
		generic map (G_LINES => 1024, G_CALIB_CYC => 50)
		port map (
			clk => clk, rst => rst, init_calib_complete => calib,
			app_addr => a_addr, app_cmd => a_cmd, app_en => a_en, app_rdy => a_rdy,
			app_wdf_data => a_wdata, app_wdf_end => a_wend, app_wdf_mask => a_wmask,
			app_wdf_wren => a_wren, app_wdf_rdy => a_wrdy,
			app_rd_data => a_rdata, app_rd_data_valid => a_rdv
		);

	stim : process
		variable v_byte : std_logic_vector(7 downto 0);

		procedure cpu_store (addr : natural; data : std_logic_vector(31 downto 0);
		                     wren : std_logic_vector(3 downto 0)) is
		begin
			wait until rising_edge(clk);
			c_addr <= std_logic_vector(to_unsigned(16#40000000# + addr, 32));
			c_data <= data;
			c_wren <= wren;
			c_dv   <= '1';
			wait until rising_edge(clk);
			c_dv   <= '0';
			c_wren <= (others => '0');
			-- update the reference model
			for b in 0 to 3 loop
				if wren(b) = '1' then
					ref((addr / 4) * 4 + b) := data(8*b+7 downto 8*b);
				end if;
			end loop;
			wait until rising_edge(clk) and c_rdv = '1';
		end procedure;

		procedure cpu_load (addr : natural; tag : string) is
			variable exp : std_logic_vector(31 downto 0);
		begin
			wait until rising_edge(clk);
			c_addr <= std_logic_vector(to_unsigned(16#40000000# + addr, 32));
			c_wren <= (others => '0');
			c_dv   <= '1';
			wait until rising_edge(clk);
			c_dv   <= '0';
			wait until rising_edge(clk) and c_rdv = '1';

			for b in 0 to 3 loop
				exp(8*b+7 downto 8*b) := ref((addr / 4) * 4 + b);
			end loop;

			checks <= checks + 1;
			if c_rdata /= exp then
				report "MISMATCH " & tag & " at 0x" &
				       integer'image(addr) & " expected " &
				       integer'image(to_integer(unsigned(exp))) & " got " &
				       integer'image(to_integer(unsigned(c_rdata)))
					severity error;
				errors <= errors + 1;
			end if;
		end procedure;

	begin
		rst <= '1';
		wait for 200 ns;
		rst <= '0';
		wait until calib = '1';
		wait until rising_edge(clk);

		-- 1. all four word lanes of one line
		cpu_store(16#000#, x"DEADBEEF", "1111");
		cpu_store(16#004#, x"CAFEBABE", "1111");
		cpu_store(16#008#, x"12345678", "1111");
		cpu_store(16#00C#, x"A5A5A5A5", "1111");
		for i in 0 to 3 loop
			cpu_load(i*4, "word-lane");
		end loop;

		-- 2. sb at every byte offset within a word, every lane
		for w in 0 to 3 loop
			for b in 0 to 3 loop
				v_byte := std_logic_vector(to_unsigned(16#11# * (b+1) + w, 8));
				cpu_store(16#100# + w*4, v_byte & v_byte & v_byte & v_byte,
				          std_logic_vector(to_unsigned(2**b, 4)));
			end loop;
		end loop;
		for w in 0 to 3 loop
			cpu_load(16#100# + w*4, "sb");
		end loop;

		-- 3. sh, both halves
		cpu_store(16#200#, x"0000BEEF", "0011");
		cpu_store(16#200#, x"DEAD0000", "1100");
		cpu_load (16#200#, "sh");
		cpu_store(16#204#, x"0000F00D", "0011");
		cpu_load (16#204#, "sh-lo-only");

		-- 4. spread across many lines
		for i in 0 to 31 loop
			cpu_store(16#400# + i*16,
			          std_logic_vector(to_unsigned(16#1000# + i, 32)), "1111");
		end loop;
		for i in 0 to 31 loop
			cpu_load(16#400# + i*16, "multi-line");
		end loop;

		-- 5. interleaved read/write to the same line
		for i in 0 to 15 loop
			cpu_store(16#800# + (i mod 4)*4,
			          std_logic_vector(to_unsigned(16#5000# + i, 32)), "1111");
			cpu_load (16#800# + (i mod 4)*4, "interleave");
		end loop;

		wait for 1 us;
		report "checks = " & integer'image(checks) &
		       "   errors = " & integer'image(errors);
		if errors = 0 then
			report "RESULT: PASS" severity note;
		else
			report "RESULT: FAIL" severity error;
		end if;
		std.env.stop;
	end process;

end sim;
