library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;

entity tb_Top_of_Arty_SoC_Ascii is

end tb_Top_of_Arty_SoC_Ascii;

architecture Behavioral of tb_Top_of_Arty_SoC_Ascii is

    component Top_of_Arty_SoC is
        Port (
            SW         : in    std_logic_vector (3 downto 0);
            BTN        : in    std_logic_vector (3 downto 0);
            CLK        : in    std_logic;
            LED        : out   std_logic_vector (3 downto 0);
            o_Uart_TXD : out   std_logic;
            i_Uart_RXD : in    std_logic;
            led0_r     : out   std_logic;
            led0_g     : out   std_logic;
            led0_b     : out   std_logic;    
            led1_r     : out   std_logic;
            led1_g     : out   std_logic;
            led1_b     : out   std_logic;
            ja         : inout std_logic_vector(7 downto 0);
            jb         : inout std_logic_vector(7 downto 0);
            jc         : inout std_logic_vector(7 downto 0);
            jd         : inout std_logic_vector(7 downto 0);
            ck_scl     : inout std_logic;
            ck_sda     : inout std_logic
        );
    end component;
	
	signal pm_bottleneck_flag : std_logic := '0';
	
    -- Testbench Signals
    signal SW_tb         : std_logic_vector(3 downto 0) := "0000";
    signal BTN_tb        : std_logic_vector(3 downto 0) := "0000";
    signal CLK_tb        : std_logic := '0';
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

    -- Timing Constants
    constant CLK_PERIOD  : time := 10 ns;     -- 100 MHz
    constant BIT_PERIOD  : time := 8.68 us;   -- 115200 Baud

    shared variable total_bytes : integer := 0;

begin

    uut: Top_of_Arty_SoC
        port map (
            SW => SW_tb, BTN => BTN_tb, CLK => CLK_tb, LED => LED_tb,
            o_Uart_TXD => o_Uart_TXD_tb, i_Uart_RXD => i_Uart_RXD_tb,
            led0_r => led0_r_tb, led0_g => led0_g_tb, led0_b => led0_b_tb,
            led1_r => led1_r_tb, led1_g => led1_g_tb, led1_b => led1_b_tb,
            ja => ja_tb, jb => jb_tb, jc => jc_tb, jd => jd_tb,
            ck_scl => ck_scl_tb, ck_sda => ck_sda_tb
        );

    -- Clock Generator
    clk_process : process
    begin
        while true loop
            CLK_tb <= '0'; wait for CLK_PERIOD / 2;
            CLK_tb <= '1'; wait for CLK_PERIOD / 2;
        end loop;
    end process;

	process(CLK_tb)
		-- Aliases inside the process (where uut is already elaborated)
		alias internal_instruction_jump  is << signal .tb_Top_of_Arty_SoC_Ascii.uut.inst_Arithmetic_Logic_Unit.instruction_jump : std_logic >>;
		alias internal_instruction_ready is << signal .tb_Top_of_Arty_SoC_Ascii.uut.inst_Arithmetic_Logic_Unit.instruction_ready : std_logic >>;
	
		-- Pipeline history variables
		variable sig_jump_d1, sig_jump_d2, sig_jump_d3 : std_logic := '0';
		variable sig_ready_d1, sig_ready_d2           : std_logic := '0';
	begin
		if rising_edge(CLK_tb) then
			-- Pipeline history
			sig_jump_d3 := sig_jump_d2;
			sig_jump_d2 := sig_jump_d1;
			sig_jump_d1 := internal_instruction_jump;
			
			sig_ready_d2 := sig_ready_d1;
			sig_ready_d1 := internal_instruction_ready;
	
			-- Check: ready fell on this cycle AND jump did NOT rise 1 cycle prior
			if (sig_ready_d2 = '1' and sig_ready_d1 = '0') and not (sig_jump_d3 = '0' and sig_jump_d2 = '1') then
				pm_bottleneck_flag <= '1';
				report "Violation detected: instruction_ready fell without instruction_jump rising 1 cycle prior!" severity error;
			else
				pm_bottleneck_flag <= '0';
			end if;
		end if;
	end process;

    -- reads a binary file and simulates writing it to the fpga over uart
    stim_proc: process
        type binary_file is file of character; 
        file f_input          : binary_file;
        variable current_char : character;
        variable current_byte : std_logic_vector(7 downto 0);
        variable open_status  : file_open_status;
        
        procedure uart_send_byte(data : in std_logic_vector(7 downto 0)) is
        begin
            i_Uart_RXD_tb <= '0'; wait for BIT_PERIOD; -- Start Bit
            for i in 0 to 7 loop
                i_Uart_RXD_tb <= data(i); wait for BIT_PERIOD; -- 8 Data Bits
            end loop;
            i_Uart_RXD_tb <= '1'; wait for BIT_PERIOD; -- Stop Bit
            wait for BIT_PERIOD; -- Gap
        end procedure;

    begin		
        wait for 200 ns;	
        
        file_open(open_status, f_input, "Fibonacci.bin", READ_MODE);
        assert open_status = OPEN_OK report "FATAL: Couldn't open file" severity failure;
        
        while not endfile(f_input) loop
            read(f_input, current_char);
            current_byte := std_logic_vector(to_unsigned(character'pos(current_char), 8));
            total_bytes  := total_bytes + 1;
            uart_send_byte(current_byte);
        end loop;
        file_close(f_input);

        wait for 50 us; 
        
        -- Simulate pushing BTN(1) for softcore to start executing
        report "--- PRESSING BUTTON 1 FOR ASCII DISPLAY ---";
        BTN_tb(1) <= '1';
        wait for 1 ms; -- wait long enough for debouncer to register press
        BTN_tb(1) <= '0'; 
        
        -- Hold simulation open long enough to receive the response printouts
        wait for 10000 ms;

        assert false report "ASCII Simulation Finished Successfully" severity failure;
        wait;
    end process;

    -- print the serial output of the softcore to the tcl console
    rx_ascii_print_proc: process
        variable rx_byte   : std_logic_vector(7 downto 0);
        variable rx_char   : character;
        
        variable current_line : line; 
    begin
        while true loop
            wait until falling_edge(o_Uart_TXD_tb);
            wait for BIT_PERIOD / 2; -- sample middle of start bit
            
            if o_Uart_TXD_tb = '0' then
                wait for BIT_PERIOD;
                
                for i in 0 to 7 loop
                    rx_byte(i) := o_Uart_TXD_tb;
                    wait for BIT_PERIOD;
                end loop;
                
               -- convert byte to char
                rx_char := character'val(to_integer(unsigned(rx_byte)));
                
                -- handle '\r'
                if rx_char = CR then
                    -- write current line to console and flush it
                    if current_line /= null and current_line'length > 0 then
                        writeline(output, current_line);
                    end if;
                
				-- handle '\n'
                elsif rx_char = LF then
                    -- if '\r' was missing just write the line to console and flush
					-- otherwise dont do anything
                    if current_line /= null and current_line'length > 0 then
                        writeline(output, current_line);
                    end if;
                    
                else
                    -- all other characters are apended to the current line
                    write(current_line, rx_char);
                end if;
                
            end if;
        end loop;
    end process;

end Behavioral;