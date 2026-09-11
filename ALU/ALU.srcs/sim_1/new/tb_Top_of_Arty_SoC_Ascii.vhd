----------------------------------------------------------------------------------
-- tb_Top_of_Arty_SoC_Ascii
--
-- Updated for the DDR3-enabled top level:
--   * CLK          -> CLK100MHZ (MIG sys_clk_i) + CLK12MHZ (clk_wiz -> clk_ref_i)
--   * DDR3 physical pins added, connected to the Micron behavioural model
--   * the internal monitor is now clocked on the ALU's own clock (ui_clk,
--     81.25 MHz) instead of the 100 MHz board oscillator
--
-- The DUT is instantiated directly as an entity rather than through a local
-- component declaration, so the port list can never drift out of sync again.
--
-- BEFORE RUNNING
--   1. Add ddr3_model.v and ddr3_model_parameters.vh to the simulation fileset
--      (dir /s /b ddr3_model.v). Check wiredly.v too - MIG's own sim_tb_top.v
--      routes every DQ/DQS bit through WireDelay, and omitting that can make
--      calibration fail in simulation even though the design is correct.
--   2. VERIFY the ddr3_model component declaration below against the port list
--      in your generated ddr3_model.v. It is written for one x16 component.
--   3. Set C_USE_DDR3_MODEL to false when the design is built against
--      mig_stub_behavioural.vhd instead of the real MIG.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;

entity tb_Top_of_Arty_SoC_Ascii is
end tb_Top_of_Arty_SoC_Ascii;

architecture Behavioral of tb_Top_of_Arty_SoC_Ascii is

	-- false when simulating against mig_stub_behavioural.vhd
	constant C_USE_DDR3_MODEL : boolean := true;

	-- Original was 10000 ms. With the real MIG in the design that is not
	-- reachable: 3 ms of DDR3 simulation already costs ~26 minutes of wall
	-- clock, so 10 s would run for weeks. Use the stub for long runs.
	constant C_RUN_TIME : time := 20 ms;

	constant CLK100_PERIOD : time := 10.000 ns;   -- R2  oscillator
	constant CLK12_PERIOD  : time := 83.333 ns;   -- F14 oscillator
	constant BIT_PERIOD    : time := 8.68 us;     -- 115200 baud (unchanged:
	                                              -- this is real-world time, not
	                                              -- clock cycles. But g_CLKS_PER_BIT
	                                              -- in the design must become 705
	                                              -- for 81.25 MHz, not 868.)

	signal pm_bottleneck_flag : std_logic := '0';

	signal SW_tb         : std_logic_vector(3 downto 0) := "0000";
	signal BTN_tb        : std_logic_vector(3 downto 0) := "0000";
	signal CLK100MHZ_tb  : std_logic := '0';
	signal CLK12MHZ_tb   : std_logic := '0';
	signal LED_tb        : std_logic_vector(3 downto 0);
	signal o_Uart_TXD_tb : std_logic;
	signal i_Uart_RXD_tb : std_logic := '1';
	signal led0_r_tb     : std_logic;
	signal led0_g_tb     : std_logic;
	signal led0_b_tb     : std_logic;
	signal led1_r_tb     : std_logic;
	signal led1_g_tb     : std_logic;
	signal led1_b_tb     : std_logic;

	signal ja_tb         : std_logic_vector(7 downto 0) := (others => 'Z');
	signal jb_tb         : std_logic_vector(7 downto 0) := (others => 'Z');
	signal jc_tb         : std_logic_vector(7 downto 0) := (others => 'Z');
	signal jd_tb         : std_logic_vector(7 downto 0) := (others => 'Z');
	signal ck_scl_tb     : std_logic := 'Z';
	signal ck_sda_tb     : std_logic := 'Z';

	-- DDR3 physical interface
	signal ddr3_dq       : std_logic_vector(15 downto 0);
	signal ddr3_dqs_p    : std_logic_vector(1 downto 0);
	signal ddr3_dqs_n    : std_logic_vector(1 downto 0);
	signal ddr3_addr     : std_logic_vector(13 downto 0);
	signal ddr3_ba       : std_logic_vector(2 downto 0);
	signal ddr3_ras_n    : std_logic;
	signal ddr3_cas_n    : std_logic;
	signal ddr3_we_n     : std_logic;
	signal ddr3_reset_n  : std_logic;
	signal ddr3_ck_p     : std_logic_vector(0 downto 0);
	signal ddr3_ck_n     : std_logic_vector(0 downto 0);
	signal ddr3_cke      : std_logic_vector(0 downto 0);
	signal ddr3_cs_n     : std_logic_vector(0 downto 0);
	signal ddr3_dm       : std_logic_vector(1 downto 0);
	signal ddr3_odt      : std_logic_vector(0 downto 0);
	signal ddr3_tdqs_n   : std_logic_vector(1 downto 0);

	shared variable total_bytes : integer := 0;

	-- CHECK THIS AGAINST YOUR GENERATED ddr3_model.v
	component ddr3_model is
		port (
			rst_n   : in    std_logic;
			ck      : in    std_logic;
			ck_n    : in    std_logic;
			cke     : in    std_logic;
			cs_n    : in    std_logic;
			ras_n   : in    std_logic;
			cas_n   : in    std_logic;
			we_n    : in    std_logic;
			dm_tdqs : inout std_logic_vector(1 downto 0);
			ba      : in    std_logic_vector(2 downto 0);
			addr    : in    std_logic_vector(13 downto 0);
			dq      : inout std_logic_vector(15 downto 0);
			dqs     : inout std_logic_vector(1 downto 0);
			dqs_n   : inout std_logic_vector(1 downto 0);
			tdqs_n  : out   std_logic_vector(1 downto 0);
			odt     : in    std_logic
		);
	end component;

begin

	uut : entity work.Top_of_Arty_SoC
		port map (
			SW           => SW_tb,
			BTN          => BTN_tb,
			CLK100MHZ    => CLK100MHZ_tb,
			CLK12MHZ     => CLK12MHZ_tb,
			LED          => LED_tb,
			o_Uart_TXD   => o_Uart_TXD_tb,
			i_Uart_RXD   => i_Uart_RXD_tb,
			led0_r       => led0_r_tb,
			led0_g       => led0_g_tb,
			led0_b       => led0_b_tb,
			led1_r       => led1_r_tb,
			led1_g       => led1_g_tb,
			led1_b       => led1_b_tb,
			ja           => ja_tb,
			jb           => jb_tb,
			jc           => jc_tb,
			jd           => jd_tb,
			ck_scl       => ck_scl_tb,
			ck_sda       => ck_sda_tb,
			ddr3_dq      => ddr3_dq,
			ddr3_dqs_p   => ddr3_dqs_p,
			ddr3_dqs_n   => ddr3_dqs_n,
			ddr3_addr    => ddr3_addr,
			ddr3_ba      => ddr3_ba,
			ddr3_ras_n   => ddr3_ras_n,
			ddr3_cas_n   => ddr3_cas_n,
			ddr3_we_n    => ddr3_we_n,
			ddr3_reset_n => ddr3_reset_n,
			ddr3_ck_p    => ddr3_ck_p,
			ddr3_ck_n    => ddr3_ck_n,
			ddr3_cke     => ddr3_cke,
			ddr3_cs_n    => ddr3_cs_n,
			ddr3_dm      => ddr3_dm,
			ddr3_odt     => ddr3_odt
		);

	gen_sdram : if C_USE_DDR3_MODEL generate
		u_sdram : ddr3_model
			port map (
				rst_n   => ddr3_reset_n,
				ck      => ddr3_ck_p(0),
				ck_n    => ddr3_ck_n(0),
				cke     => ddr3_cke(0),
				cs_n    => ddr3_cs_n(0),
				ras_n   => ddr3_ras_n,
				cas_n   => ddr3_cas_n,
				we_n    => ddr3_we_n,
				dm_tdqs => ddr3_dm,
				ba      => ddr3_ba,
				addr    => ddr3_addr,
				dq      => ddr3_dq,
				dqs     => ddr3_dqs_p,
				dqs_n   => ddr3_dqs_n,
				tdqs_n  => ddr3_tdqs_n,
				odt     => ddr3_odt(0)
			);
	end generate;

	----------------------------------------------------------------------------
	-- board oscillators
	----------------------------------------------------------------------------
	CLK100MHZ_tb <= not CLK100MHZ_tb after CLK100_PERIOD / 2;
	CLK12MHZ_tb  <= not CLK12MHZ_tb  after CLK12_PERIOD  / 2;

	----------------------------------------------------------------------------
	-- fetch bottleneck monitor
	--
	-- Clocked on the ALU's own clock, which is now ui_clk (81.25 MHz), NOT the
	-- 100 MHz board oscillator. Sampling on CLK100MHZ here would miss edges and
	-- produce spurious reports.
	----------------------------------------------------------------------------
	monitor_proc : process
		alias alu_clk is
			<< signal .tb_Top_of_Arty_SoC_Ascii.uut.inst_Arithmetic_Logic_Unit.i_Clk : std_logic >>;
		alias internal_instruction_jump is
			<< signal .tb_Top_of_Arty_SoC_Ascii.uut.inst_Arithmetic_Logic_Unit.instruction_jump : std_logic >>;
		alias internal_instruction_ready is
			<< signal .tb_Top_of_Arty_SoC_Ascii.uut.inst_Arithmetic_Logic_Unit.instruction_ready : std_logic >>;

		variable sig_jump_d1, sig_jump_d2, sig_jump_d3 : std_logic := '0';
		variable sig_ready_d1, sig_ready_d2            : std_logic := '0';
	begin
		wait until rising_edge(alu_clk);

		sig_jump_d3 := sig_jump_d2;
		sig_jump_d2 := sig_jump_d1;
		sig_jump_d1 := internal_instruction_jump;

		sig_ready_d2 := sig_ready_d1;
		sig_ready_d1 := internal_instruction_ready;

		-- ready fell on this cycle AND jump did not rise one cycle prior
		if (sig_ready_d2 = '1' and sig_ready_d1 = '0') and
		   not (sig_jump_d3 = '0' and sig_jump_d2 = '1') then
			pm_bottleneck_flag <= '1';
			report "Violation detected: instruction_ready fell without instruction_jump rising 1 cycle prior!"
				severity error;
		else
			pm_bottleneck_flag <= '0';
		end if;
	end process;

	----------------------------------------------------------------------------
	-- load the program over UART, then press BTN(1) to run it
	----------------------------------------------------------------------------
	stim_proc : process
		type binary_file is file of character;
		file f_input          : binary_file;
		variable current_char : character;
		variable current_byte : std_logic_vector(7 downto 0);
		variable open_status  : file_open_status;

		procedure uart_send_byte (data : in std_logic_vector(7 downto 0)) is
		begin
			i_Uart_RXD_tb <= '0'; wait for BIT_PERIOD;          -- start bit
			for i in 0 to 7 loop
				i_Uart_RXD_tb <= data(i); wait for BIT_PERIOD;  -- 8 data bits
			end loop;
			i_Uart_RXD_tb <= '1'; wait for BIT_PERIOD;          -- stop bit
			wait for BIT_PERIOD;                                -- gap
		end procedure;

	begin
		wait for 200 ns;

		file_open(open_status, f_input, "Fibonacci.bin", READ_MODE);
		assert open_status = OPEN_OK
			report "FATAL: Couldn't open file" severity failure;

		while not endfile(f_input) loop
			read(f_input, current_char);
			current_byte := std_logic_vector(to_unsigned(character'pos(current_char), 8));
			total_bytes  := total_bytes + 1;
			uart_send_byte(current_byte);
		end loop;
		file_close(f_input);

		wait for 50 us;

		report "--- PRESSING BUTTON 1 FOR ASCII DISPLAY ---";
		BTN_tb(1) <= '1';
		wait for 1 ms;                  -- long enough for the debouncer
		BTN_tb(1) <= '0';

		wait for C_RUN_TIME;

		assert false report "ASCII Simulation Finished Successfully" severity failure;
		wait;
	end process;

	----------------------------------------------------------------------------
	-- decode the softcore's serial output to the console
	----------------------------------------------------------------------------
	rx_ascii_print_proc : process
		variable rx_byte      : std_logic_vector(7 downto 0);
		variable rx_char      : character;
		variable current_line : line;
	begin
		while true loop
			wait until falling_edge(o_Uart_TXD_tb);
			wait for BIT_PERIOD / 2;            -- sample middle of start bit

			if o_Uart_TXD_tb = '0' then
				wait for BIT_PERIOD;

				for i in 0 to 7 loop
					rx_byte(i) := o_Uart_TXD_tb;
					wait for BIT_PERIOD;
				end loop;

				rx_char := character'val(to_integer(unsigned(rx_byte)));

				if rx_char = CR then
					if current_line /= null and current_line'length > 0 then
						writeline(output, current_line);
					end if;

				elsif rx_char = LF then
					if current_line /= null and current_line'length > 0 then
						writeline(output, current_line);
					end if;

				else
					write(current_line, rx_char);
				end if;

			end if;
		end loop;
	end process;

end Behavioral;