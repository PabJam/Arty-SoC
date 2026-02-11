----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2026 16:35:17
-- Design Name: 
-- Module Name: I2C_Slave - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity I2C_Slave is
	Port
	(
		i_Clk : in std_logic;
		i_SDA : in std_logic;
		i_SCL : in std_logic;
		o_SDA : out std_logic;
		o_RX_Byte : out std_logic_vector(7 downto 0);
		i_Address : in std_logic_vector(6 downto 0);
		o_RX_DV : out std_logic
	);
end I2C_Slave;

architecture Behavioral of I2C_Slave is
	
	constant ADRESS_FRAME_MAX : natural := 8;
	constant ADRESS_MAX : natural := 6;
	constant DATA_MAX : natural := 7;
	
	type t_I2C_States is (s_idle, s_address, s_ack_adress, s_data_read, s_data_write, s_ack_data);
	signal i2c_state : t_I2C_States := s_idle;
	
	type t_RW is (s_read, s_write);
	signal rw_state : t_RW := s_write;
	
	signal latched_o_sda : std_logic := '1';
	
	signal latched_scl1, latched_scl2 : std_logic;
	signal latched_sda1, latched_sda2 : std_logic;
	
	signal rx_byte : std_logic_vector(DATA_MAX downto 0);
	signal rx_address : std_logic_vector(ADRESS_MAX downto 0);
	
	signal adress_cntr : natural range 0 to ADRESS_MAX := ADRESS_MAX;
	signal adress_frame_cntr : natural range 0 to ADRESS_FRAME_MAX := ADRESS_FRAME_MAX;
	signal data_cntr : natural range 0 to DATA_MAX := DATA_MAX;
	
	attribute MARK_DEBUG : string;

	attribute MARK_DEBUG of rx_address : signal is "TRUE";
	attribute MARK_DEBUG of i2c_state : signal is "TRUE";
	attribute MARK_DEBUG of rw_state : signal is "TRUE";
	
begin

	p_I2C_RX : process(i_Clk)
		variable start : boolean := false;
		variable stop : boolean := false;
	begin
		if rising_edge(i_Clk) then
			start := false;
			stop := false;
			o_RX_DV <= '0';
		
			latched_scl1 <= i_SCL;
			latched_sda1 <= i_SDA;
			latched_scl2 <= latched_scl1;
			latched_sda2 <= latched_sda1;
			
			if (latched_scl1 = '1' and latched_sda1 /= latched_sda2) then
				if (latched_sda1 = '0') then
					start := true;
				else
					stop := true;
				end if;
			end if;
			
			if (start) then
				i2c_state <= s_address;
				adress_cntr <= ADRESS_MAX;
				data_cntr <= DATA_MAX;
			elsif (stop) then
				i2c_state <= s_idle;
				adress_cntr <= ADRESS_MAX;
				data_cntr <= DATA_MAX;
			else
			
				case i2c_state is
				
					when s_idle =>
						i2c_state <= s_idle;
					
					when s_address =>
						i2c_state <= s_address;

						if (latched_scl2 = '0' and latched_scl1 = '1') then -- rising edge
							if (adress_frame_cntr > 1) then
								rx_address(adress_cntr) <= latched_sda1;
								if (adress_cntr > 0) then
									adress_cntr <= adress_cntr - 1;
								else
									adress_cntr <= ADRESS_MAX;
								end if;
							else
								if (latched_sda1 = '1') then
									rw_state <= s_read;
								else
									rw_state <= s_write;
								end if;
							end if;
							adress_frame_cntr <= adress_frame_cntr - 1;
						end if;
						
						if (latched_scl2 = '1' and latched_scl1 = '0' and adress_frame_cntr = 0) then -- check valid
							adress_frame_cntr <= ADRESS_FRAME_MAX;
							if (rx_address = i_Address) then
								latched_o_sda <= '0';
								i2c_state <= s_ack_adress;
							end if;
						end if;
					
					when s_ack_adress =>
						i2c_state <= s_ack_adress;

						if (latched_scl2 = '1' and latched_scl1 = '0') then -- falling edge
							latched_o_sda <= '1';
							if (rw_state = s_read) then
								i2c_state <= s_data_read;
							else	
								i2c_state <= s_data_write;
							end if;
							
						end if;
						
					when s_data_read => 
						null;
					
					when s_data_write =>
						i2c_state <= s_data_write;
						
						if (latched_scl2 = '0' and latched_scl1 = '1') then -- rising edge
							rx_byte(data_cntr) <= latched_sda1;
							if (data_cntr > 0) then
								data_cntr <= data_cntr - 1;
							else 
								data_cntr <= DATA_MAX;
							end if;
						end if;
						
						if (latched_scl2 = '1' and latched_scl1 = '0' and data_cntr = DATA_MAX) then -- falling edge
							latched_o_sda <= '0';
							o_RX_Byte <= rx_byte;
							o_RX_DV <= '1';
							i2c_state <= s_ack_data;
						end if;
					
					when s_ack_data =>
						i2c_state <= s_ack_data;

						if (latched_scl2 = '1' and latched_scl1 = '0') then -- falling edge
							latched_o_sda <= '1';
							i2c_state <= s_idle;
						end if;
					
				end case;
			
			end if;
			
		end if;
	end process;

	o_SDA <= latched_o_sda;

end Behavioral;
