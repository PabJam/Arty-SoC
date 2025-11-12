----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2025 14:33:54
-- Design Name: 
-- Module Name: LogicUnit - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LogicUnit is
	Port
	(
		i_Clk : in std_logic;
		i_Sync_nRst : in std_logic;
		o_PM_Addr : out std_logic_vector(13 downto 0);
		i_PM_Data : in std_logic_vector(31 downto 0);
		i_PM_DV : in std_logic;
		o_DM_Addr : out std_logic_vector(31 downto 0);
		o_DM_Data : out std_logic_vector(31 downto 0);
		o_DM_Wr_En : out std_logic_vector(3 downto 0);
		i_DM_Data : in std_logic_vector(31 downto 0);
		i_DM_DV : in std_logic;
	);
end LogicUnit;

architecture Behavioral of LogicUnit is

begin


end Behavioral;
