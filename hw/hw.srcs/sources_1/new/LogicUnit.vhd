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
use ieee.numeric_std.all;
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

component Add
	port
	(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		S : out std_logic_vector(31 downto 0); 
	);
end component;

component Sub
	port 
	(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		S : out std_logic_vector(31 downto 0); 
	)
end component;

type t_reg_array is array (0 to 31) of unsigned(31 downto 0);
signal registers : t_reg_array;

type t_fetch_states is ( fetch_state_idle, fetch_state_init, fetch_state_next, fetch_state_jump);
signal fetch_state : t_fetch_states;

signal pc : unsigned(15 downto 0);
signal pc_p4 : unsigned(15 downto 0);
signal pc_p8 : unsigned(15 downto 0);
signal pc_p8_latch : unsigned(15 downto 0);
signal instruction : unsigned(31 downto 0);
signal instruction_p4 : unsigned(31 downto 0);
signal instruction_p8 : unsigned(31 downto 0);
signal instruction_p8_latch : unsigned(31 downto 0);
signal instruction_done : std_logic := '0';
signal instruction_valid : std_logic := '0';
signal instruction_jump : std_logic := '0';
signal instruction_new : std_logic := '0';

signal a_add : std_logic_vector(31 downto 0);
signal b_add : std_logic_vector(31 downto 0);
signal result_add : std_logic_vector(31 downto 0);
signal a_sub : std_logic_vector(31 downto 0);
signal b_sub : std_logic_vector(31 downto 0);
signal result_sub : std_logic_vector(31 downto 0);


begin

inst_add: Add
port map
(
	A => a_add,
	B => b_add,
	S => result_add
);

inst_sub: Sub
port map
(
	A => a_sub,
	B => b_sub,
	S => result_sub
);

Instruction_Fetch : process(i_Clk)
begin
	if rising_edge(i_Clk) then
		if (i_Sync_nRst => '0') then
			pc <= (others => '0');
			pc_p4 <= (others => '0');
			pc_p8 <= (others => '0');
			fetch_state <= fetch_state_init;
			o_PM_Addr <= (others => '0');
		else
			case fetch_state is 
				
				when fetch_state_init =>
					fetch_state <= fetch_state_init;
					o_PM_Addr <= pc_p8(15 downto 2);
					if (i_DM_DV = '1') then
						instruction_p8 <= i_PM_Data;
						if (pc_p8 = x"0008") then
							fetch_state <= fetch_state_idle;
						else
							pc_p8 <= pc_p8 + 4;
						end if;
					end if;
				
				when fetch_state_idle =>
					fetch_state <= fetch_state_idle;
					if (instruction_done = '1' and instruction_jump)
					
				when fetch_state_next =>
				when fetch_state_jump =>
				
				
				
			end case;
		end if;
	end if;
end process;

--TODO how to handle when jumping
Instruction_Pipeline : process(i_Clk)
begin
	if rising_edge(i_Clk) then
		if (pc_p8_latch /= pc_p8) then
			instruction <= instruction_p4;
			instruction_p4 <= instruction_p8_latch;
			pc <= pc_p4;
			pc_p4 <= pc_p8_latch;
		end if;
		pc_p8_latch <= pc_p8;
		instruction_p8_latch <= instruction_p8;
	end if;
end process;


process(i_Clk)
begin
	if rising_edge(i_Clk) then
		if (instruction_valid = '1') then
			instruction_new <= '0';
			instruction_done <= '0';
			
			case instruction(6 downto 0) is --opcode
				
				when "0110011" => -- R-type
					case instruction(14 downto 12) is -- funct3
						
						when "000" => -- add/sub
							if instruction(30) = '0' then --add
								if (instruction_new = '1') then
									a_add <= std_logic_vector(registers(to_integer(instruction(19 downto 15))));
									b_add <= std_logic_vector(registers(to_integer(instruction(24 downto 20))));
								else
									registers(to_integer(instruction(11 downto 7))) <= unsigned(result_add);
									instruction_done <= '1';
								end if;
							else -- sub
								if (instruction_new = '1') then
									a_sub <= std_logic_vector(registers(to_integer(instruction(19 downto 15))));
									b_sub <= std_logic_vector(registers(to_integer(instruction(24 downto 20))));
								else
									registers(to_integer(instruction(11 downto 7))) <= unsigned(result_sub);
									instruction_done <= '1';
								end if;
							end if;
							
						when "001" => -- sll
							registers(to_integer(instruction(11 downto 7)))(31 downto 0) <= shift_left(registers(to_integer(instruction(19 downto 15))), to_integer(registers(to_integer(instruction(24 downto 20)))(4 downto 0)));
							instruction_done <= '1';
						
						when "010" => -- slt
							registers(to_integer(instruction(11 downto 7)))(31 downto 0) <= (others => '0');
							if signed(registers(to_integer(instruction(19 downto 15)))) < signed(registers(to_integer(instruction(24 downto 20)))) then
								registers(to_integer(instruction(11 downto 7)))(0) <= '1'; 
							end if;
							instruction_done <= '1';
							
						when "011" => -- sltu
							registers(to_integer(instruction(11 downto 7)))(31 downto 0) <= (others => '0');
							if unsigned(registers(to_integer(instruction(19 downto 15)))) < unsigned(registers(to_integer(instruction(24 downto 20)))) then
								registers(to_integer(instruction(11 downto 7)))(0) <= '1'; 
							end if;
							instruction_done <= '1';
							
						when "100" => -- xor
							registers(to_integer(instruction(11 downto 7))) <= registers(to_integer(instruction(19 downto 15))) xor registers(to_integer(instruction(24 downto 20)));
							instruction_done <= '1';
							
						when "101" => -- srl/sra
							if instruction(30) = '0' then -- srl
								registers(to_integer(instruction(11 downto 7)))(31 downto 0) <= shift_right(registers(to_integer(instruction(19 downto 15))), to_integer(registers(to_integer(instruction(24 downto 20)))(4 downto 0)));
								instruction_done <= '1';
							else	-- sra
								registers(to_integer(instruction(11 downto 7)))(31 downto 0) <= shift_right(signed(registers(to_integer(instruction(19 downto 15)))), to_integer(registers(to_integer(instruction(24 downto 20)))(4 downto 0)));
								instruction_done <= '1';
							end if;
						
						when "110" => -- or
							registers(to_integer(instruction(11 downto 7))) <= registers(to_integer(instruction(19 downto 15))) or registers(to_integer(instruction(24 downto 20)));
							instruction_done <= '1';
							
						when "111" => -- and
							registers(to_integer(instruction(11 downto 7))) <= registers(to_integer(instruction(19 downto 15))) and registers(to_integer(instruction(24 downto 20)));
							instruction_done <= '1';
							
						when others => 
							null;
							instruction_done <= '1';
						
					end case;
				
				when "0010011" => -- I-type
					case instruction(14 downto 12) is -- funct3
						
						when "000" => -- addi
							registers(to_integer(instruction(11 downto 7))) <= signed(registers(to_integer(instruction(19 downto 15)))) + signed(instruction(31 downto 20));
							instruction_done <= '1';
							
						when "010" => -- slti
							registers(to_integer(instruction(11 downto 7)))(31 downto 0) <= (others => '0');
							if signed(registers(to_integer(instruction(19 downto 15)))) < signed(instruction(31 downto 20)) then
								registers(to_integer(instruction(11 downto 7)))(0) <= '1'; 
							end if;
							instruction_done <= '1';
							
						when "011" => -- sltiu
							registers(to_integer(instruction(11 downto 7)))(31 downto 0) <= (others => '0');
							if registers(to_integer(instruction(19 downto 15))) < instruction(31 downto 20) then
								registers(to_integer(instruction(11 downto 7)))(0) <= '1'; 
							end if;
							instruction_done <= '1';
							
						when "100" => -- xori
							registers(to_integer(instruction(11 downto 7))) <= signed(registers(to_integer(instruction(19 downto 15)))) xor resize(signed(instruction(31 downto 20)), registers(0)'length);
							instruction_done <= '1';
						
						when "110" => --ori
							registers(to_integer(instruction(11 downto 7))) <= signed(registers(to_integer(instruction(19 downto 15)))) or resize(signed(instruction(31 downto 20)), registers(0)'length);
							instruction_done <= '1';
						
						when "111" => --andi
							registers(to_integer(instruction(11 downto 7))) <= signed(registers(to_integer(instruction(19 downto 15)))) and resize(signed(instruction(31 downto 20)), registers(0)'length);
							instruction_done <= '1';
						
						when others =>
							null;
							instruction_done <= '1';
						
				
				when others => 
					null;
					instruction_done <= '1';
			end case;
		end if;
	end if;
end process;
registers(0) <= (others => '0');

end Behavioral;
