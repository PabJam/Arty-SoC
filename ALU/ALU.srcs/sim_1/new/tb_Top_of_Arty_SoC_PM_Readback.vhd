library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.textio.all;

entity tb_Top_of_Arty_SoC is
end tb_Top_of_Arty_SoC;

architecture Behavioral of tb_Top_of_Arty_SoC is

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

    -- Types to log sent bytes for validation later
    type byte_array is array (0 to 4095) of std_logic_vector(7 downto 0);
    shared variable bytes_sent   : byte_array;
    shared variable total_bytes  : integer := 0;
	shared variable match_count : integer := 0;

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

    -- reads a binary file and simulates writing it to the fpga over uart
    stim_proc: process
        type binary_file is file of character; 
        file f_input          : binary_file;
        variable current_char : character;
        variable current_byte : std_logic_vector(7 downto 0);
        
        -- Declaring the status variable at the process level (VHDL-93 compatible)
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
        
        report "--- ATTEMPTING TO OPEN BINARY FILE ---";
        
        -- Open the file and capture the status
        file_open(open_status, f_input, "Fibonacci.bin", READ_MODE);
        
        -- Check if it opened successfully
        assert open_status = OPEN_OK
            report "FATAL: Could not open Fibonacci.bin! Make sure it is copied into your ALU.sim/sim_1/behav/xsim/ directory."
            severity failure;
        
        report "--- STARTING BINARY TRANSMISSION ---";
        while not endfile(f_input) loop
            read(f_input, current_char);
            current_byte := std_logic_vector(to_unsigned(character'pos(current_char), 8));
            
            -- store sent bytes, so they can be verified later
            bytes_sent(total_bytes) := current_byte;
            total_bytes := total_bytes + 1;
            
            uart_send_byte(current_byte);
        end loop;
        file_close(f_input);
        report "Transmitted " & integer'image(total_bytes) & " bytes smoothly.";

        -- time to settle/store the final byte
        wait for 50 us; 
        
        -- Simulate pushing BTN(0) to trigger loopback transmission
        report "--- PRESSING BUTTON 0 TO TRANSMIT BACK ---";
        BTN_tb(0) <= '1';
        wait for 1 ms; -- wait for debouncer to register press
        BTN_tb(0) <= '0'; 
        
        for i in 1 to 5000 loop
            wait for 100 us; -- timeout if matchcount never eqauls total_bytes
            exit when match_count = total_bytes;
        end loop;

        -- check and report if all bytes matched
        report "==================================================";
        if match_count = total_bytes then
            report " SUCCESS: ALL " & integer'image(total_bytes) & " BYTES VERIFIED FLAWLESSLY!";
            report "==================================================";
            -- End simulation cleanly without looking like a crash
            assert false report "Simulation Completed Successfully!" severity failure;
        else
            report " FAILURE: Only verified " & integer'image(match_count) & " out of " & integer'image(total_bytes) & " bytes!";
            report "==================================================";
            assert false report "Simulation Failed: Incomplete Loopback Data." severity failure;
        end if;

        wait;
    end process;

    -- recieve bytes and check if they match the sent bytes
    rx_verify_proc: process
        variable rx_byte : std_logic_vector(7 downto 0);
    begin
        while true loop
            wait until falling_edge(o_Uart_TXD_tb);
            wait for BIT_PERIOD / 2; -- sample in middle of start bit
            
            if o_Uart_TXD_tb = '0' then
                wait for BIT_PERIOD; -- skip to first data bit
                
                -- Capture 8 data bits
                for i in 0 to 7 loop
                    rx_byte(i) := o_Uart_TXD_tb;
                    wait for BIT_PERIOD;
                end loop;
                
                -- compare recieved byte against stored byte
                assert rx_byte = bytes_sent(match_count)
                    report "ERROR: Data mismatch! Expected: " & 
                           integer'image(to_integer(unsigned(bytes_sent(match_count)))) & 
                           " Got: " & integer'image(to_integer(unsigned(rx_byte)))
                    severity error;
                
                match_count := match_count + 1;
                report "Verified Byte " & integer'image(match_count) & " of " & integer'image(total_bytes);
            end if;
        end loop;
    end process;

end Behavioral;