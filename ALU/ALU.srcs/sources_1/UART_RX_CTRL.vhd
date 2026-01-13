----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- This file contains the UART Transmitter.  This transmitter is able
-- to transmit 8 bits of serial data, one start bit, one stop bit,
-- and no parity bit.  When transmit is complete o_TX_Done will be
-- driven high for one clock cycle.
--
-- Set Generic g_CLKS_PER_BIT as follows:
-- g_CLKS_PER_BIT = (Frequency of i_Clk)/(Frequency of UART)
-- Example: 100 MHz Clock, 115200 baud UART
-- (100000000)/(115200) = 868
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--TODO change the counter to compare to 0 and set to g_CLKS_PER_BIT and not compare with g_CLKS_PER_BIT 

entity UART_RX_CTRL is
	generic 
	(
		g_CLKS_PER_BIT : integer := 868
	);
	Port
	(
		i_Clk : in std_logic;
		i_RX_Serial : in std_logic;
		o_RX_DV : out std_logic;
		o_RX_Byte : out std_logic_vector(7 downto 0)
	);
end UART_RX_CTRL;

architecture Behavioral of UART_RX_CTRL is

	type t_SM_Main is (s_idle, s_RX_Start_Bit, s_RX_Data_Bits, s_RX_Stop_Bit, s_Cleanup);
	signal r_SM_Main : t_SM_Main := s_idle;
	
	signal r_Clk_Count : integer range 0 to g_CLKS_PER_BIT - 1 := 0;
	signal r_Bit_Index : integer range 0 to 7 := 0; -- 8 Bits Total
	signal r_RX_Byte : std_logic_vector(7 downto 0) := (others => '0');
	signal r_RX_DV : std_logic := '0';

begin

	--Purpose: Control RX state machine
	p_Uart_RX : process (i_Clk)
	begin
		if rising_edge(i_Clk) then
		
			case r_SM_Main is
				when s_idle =>
					r_RX_DV <= '0';
					r_Clk_Count <= 0;
					r_Bit_Index <= 0;
					
					if i_RX_Serial = '0' then	-- Start bit detected
						r_SM_Main <= s_RX_Start_Bit;
					else
						r_SM_Main <= s_idle;
					end if;
				
				when s_RX_Start_Bit =>
					if r_Clk_Count = (g_CLKS_PER_BIT - 1) / 2 then -- Test if line stayed low
						if i_RX_Serial = '0' then
							r_Clk_Count <= 0; -- reset counter since we found the middle
							r_SM_Main <= s_RX_Data_Bits;
						else
							r_SM_Main <= s_idle;
						end if;
					else
						r_Clk_Count <= r_Clk_Count + 1;
						r_SM_Main <= s_RX_Start_Bit;
					end if;
				
				-- wait for g_CLKS_PER_BIT clock cycles to sample serial data
				when s_RX_Data_Bits =>
					if r_Clk_Count < g_CLKS_PER_BIT - 1 then
						r_Clk_Count <= r_Clk_Count + 1;
						r_SM_Main <= s_RX_Data_Bits;
					else
						r_Clk_Count <= 0;
						r_RX_Byte(r_Bit_Index) <= i_RX_Serial;
					
						-- check if we have received all bits
						if r_Bit_Index < 7 then
							r_Bit_Index <= r_Bit_Index + 1;
							r_SM_Main <= s_RX_Data_Bits;
						else
							r_Bit_Index <= 0;
							r_SM_Main <= s_RX_Stop_Bit;
						end if;
					end if;
					
				when s_RX_Stop_Bit =>
					-- wait g_CLKS_PER_BIT - 1 clock cycles for stop bit to finish
					if r_Clk_Count < g_CLKS_PER_BIT - 1 then
						r_Clk_Count <= r_Clk_Count + 1;
						r_SM_Main <= s_RX_Stop_Bit;
					else
						r_RX_DV <= '1';
						r_Clk_Count <= 0;
						r_SM_Main <= s_Cleanup;
					end if;
				
				when s_Cleanup =>
					r_SM_Main <= s_idle;
					r_RX_DV <= '0';
				
				-- should never be reached
				when others =>
					r_SM_Main <= s_idle;
			end case;		
		end if;
	end process p_Uart_RX;
	
	o_RX_DV <= r_RX_DV;
	o_RX_Byte <= r_RX_Byte;
end Behavioral;