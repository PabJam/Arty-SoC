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
		i_Give_Ctrl_Logic_Unit : in std_logic;
		i_Take_Ctrl_Logic_Unit : in std_logic;
		o_Return_Ctrl_Logic_Unit : out std_logic;
		o_PM_Addr : out std_logic_vector(12 downto 0);
		i_PM_Data : in std_logic_vector(63 downto 0);
		i_PM_DV : in std_logic;
		o_DM_Addr : out std_logic_vector(31 downto 0);
		o_DM_Data : out std_logic_vector(31 downto 0);
		o_DM_Wr_En : out std_logic_vector(3 downto 0);
		o_DM_DV : out std_logic;
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

signal ctrl_logic_unit : std_logic := '0';

type t_reg_array is array (0 to 31) of unsigned(31 downto 0);
signal registers : t_reg_array;

type t_fetch_states is (fetch_state_idle, fetch_state_next, fetch_state_next_2);
signal fetch_state : t_fetch_states;

type t_byte_array_32 is array (0 to 3) of std_logic_vector(7 downto 0);
type t_2byte_array_32 is array (0 to 1) of std_logic_vector(15 downto 0);
signal dm_write_data_bytes : t_byte_array_32;
signal dm_write_data_2bytes : t_2byte_array_32;
signal dm_read_data_bytes : t_byte_array_32;
signal dm_read_data_2bytes : t_2byte_array_32;
signal dm_addr : std_logic_vector(31 downto 0);

type t_pm_fetch_array is (0 to 3) of unsigned(31 downto 0);
type t_2_u32 is (0 to 1) of unsigned(31 downto 0);

signal pc : t_2_u32;
signal jmp_addr : unsigned(31 downto 0);
signal pc_fetch : t_pm_fetch_array;
signal instruction : t_2_u32;
signal instruction_fetch : t_pm_fetch_array;
signal instruction_jump : std_logic := '0';
signal instruction_ready : std_logic := '0';
signal instruction_loaded : std_logic := '0';
signal instruction_p4_ready : std_logic := '0';
signal wait_instruction_ready : std_logic := '1';
signal instruction_upper : unsigned(0 downto 0) := '0';
signal instruction_upper_latch : unsigned(0 downto 0) := '0';
signal v_instruction_valid : std_logic := '0';
signal v_instruction_new : std_logic := '0';

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

o_DM_Data(7 downto 0) <= dm_write_data_bytes(0); 
o_DM_Data(15 downto 8) <= dm_write_data_bytes(1); 
o_DM_Data(23 downto 16) <= dm_write_data_bytes(2); 
o_DM_Data(31 downto 24) <= dm_write_data_bytes(3);

o_DM_Data(15 downto 0) <= dm_write_data_2bytes(0);
o_DM_Data(31 downto 16) <= dm_write_data_2bytes(1);

dm_read_data_bytes(0) <= i_DM_Data(7 downto 0);
dm_read_data_bytes(1) <= i_DM_Data(15 downto 8);
dm_read_data_bytes(2) <= i_DM_Data(23 downto 16);
dm_read_data_bytes(3) <= i_DM_Data(31 downto 24);
 
dm_read_data_2bytes(0) <= i_DM_Data(15 downto 0);
dm_read_data_2bytes(1) <= i_DM_Data(31 downto 16);

o_DM_Addr <= dm_addr;

Instruction_Fetch_Proc : process(i_Clk)
begin
	if rising_edge(i_Clk) then
		if (i_Sync_nRst = '0') then
			pc_fetch(0) <= (others => '0') & "0000";
			pc_fetch(1) <= (others => '0') & "0100";
			pc_fetch(2) <= (others => '0') & "1000";
			pc_fetch(3) <= (others => '0') & "1100";
			pc <= (others => '0');
			o_PM_Addr <= (others => '0');
			fetch_state <= fetch_state_next;
		else if ctrl_logic_unit = '1' and i_Take_Ctrl_Logic_Unit = '0' then
			if (instruction_jump = '1') then
				o_PM_Addr <= jmp_addr(15 downto 3); -- jmp_addr(2) decides if lower or upper 32bit 
				pc_fetch(0) <= jmp_addr(31 downto 3) & '0' & jmp_addr(1 downto 0);
				pc_fetch(1) <= jmp_addr(31 downto 3) & '1' & jmp_addr(1 downto 0);
				fetch_state <= fetch_state_next;
				instruction_ready <= '0';
			else
				case fetch_state is 
					when fetch_state_next =>
						instruction_ready <= '0';
						o_PM_Addr <= pc_fetch(0)(15 downto 3);
						if i_PM_DV = '1' then
							instruction_fetch(0) <= i_PM_Data(31 downto 0);
							instruction_fetch(1) <= i_PM_Data(63 downto 32);
							pc(0) <= pc_fetch(0);
							pc(1) <= pc_fetch(1);
							instruction_ready <= '1';
							o_PM_Addr <= std_logic_vector(pc_fetch(0) + 8)(15 downto 3);
							if (instruction_upper = '0') then
								fetch_state <= fetch_state_next_2;
								pc_fetch(2) <= pc_fetch(0) + 8;
								pc_fetch(3) <= pc_fetch(1) + 8;
							else
								fetch_state <= fetch_state_next;
								pc_fetch(0) <= pc_fetch(0) + 8;
								pc_fetch(1) <= pc_fetch(1) + 8;
							end if;
						else
							fetch_state <= fetch_state_next;
						end if;
					
					when fetch_state_next_2 =>
						instruction_ready <= '1';
						o_PM_Addr <= pc_fetch(2)(15 downto 3);
						if i_PM_DV = '1' then
							if instruction_upper = '0' and instruction_upper_latch = '1' then
								instruction_fetch(0) <= i_PM_Data(31 downto 0);
								instruction_fetch(1) <= i_PM_Data(63 downto 32);
								pc_fetch(0) <= pc_fetch(2);
								pc_fetch(1) <= pc_fetch(3);
								pc(0) <= pc_fetch(2);
								pc(1) <= pc_fetch(3);
								pc_fetch(2) <= pc_fetch(2) + 8;
								pc_fetch(3) <= pc_fetch(3) + 8;
								o_PM_Addr <= std_logic_vector(pc_fetch(2) + 8)(15 downto 3);
								fetch_state <= fetch_state_next_2;
							else
								instruction_fetch(2) <= i_PM_Data(31 downto 0);
								instruction_fetch(3) <= i_PM_Data(63 downto 32);
								fetch_state <= fetch_state_idle;
							end if;
						elsif instruction_upper = '0' and instruction_upper_latch = '1' then
							instruction_ready <= '0';
							pc_fetch(0) <= pc_fetch(2);
							pc_fetch(1) <= pc_fetch(3);
							fetch_state <= fetch_state_next;
						else
							fetch_state <= fetch_state_next_2;
						end if;
						
					when fetch_state_idle =>
						instruction_ready <= '1';
						if instruction_upper = '0' and instruction_upper_latch = '1' then
							pc_fetch(0) <= pc_fetch(2);
							pc_fetch(1) <= pc_fetch(3);
							pc(0) <= pc_fetch(2);
							pc(1) <= pc_fetch(3);
							instruction_fetch(0) <= instruction_fetch(2);
							instruction_fetch(1) <= instruction_fetch(3);
							fetch_state <= fetch_state_next_2;
							pc_fetch(2) <= pc_fetch(2) + 8;
							pc_fetch(3) <= pc_fetch(3) + 8;
							o_PM_Addr <= std_logic_vector(pc_fetch(2) + 8)(15 downto 3);
						else
							fetch_state <= fetch_state_idle;
						end if;
					
					when others =>
						null;
						fetch_state <= fetch_state_next;
				end case;
			end if;
		else -- logic unit does not have control
			null; 
		end if;
	end if;
end process;

process(i_Clk)
	variable v_dm_addr : std_logic_vector(31 downto 0);
	variable v_instruction_done : std_logic := '0';
	variable v_instruction_new : std_logic := '0';
	variable v_instruction_jump : std_logic := '0';
	variable v_instruction_valid : std_logic := '0';
	variable v_instruction : unsigned(31 downto 0) := (others => '0');
	variable v_pc : unsigned(31 downto 0) := (others => '0');
	variable v_return_ctrl_logic_unit : std_logic;
	
begin
	if rising_edge(i_Clk) then
		o_DM_DV <= '0';
		o_DM_Wr_En <= (others => '0');
		v_instruction_new <= '0';
		instruction_jump <= '0';
		v_instruction_done <= '0';
		v_instruction_jump <= '0';
		instruction_upper_latch <= instruction_upper;
		v_return_ctrl_logic_unit <= '0';
		o_Return_Ctrl_Logic_Unit <= '0';
		
		if (i_Sync_nRst = '0') then
			instruction_upper <= '0';
			wait_instruction_ready <= '1';
		elsif ctrl_logic_unit = '1' and i_Take_Ctrl_Logic_Unit = '0' then
		
			if instruction_ready = '1' and wait_instruction_ready = '1' and instruction_jump = '0' then
				v_instruction <= instruction(to_integer(instruction_upper));
				v_pc <= pc(to_integer(instruction_upper));
				instruction_upper <= not instruction_upper;
				v_instruction_valid <= '1';
				v_instruction_new <= '1';
				wait_instruction_ready <= '0';
			elsif instruction_jump = '1' then
				instruction_upper <= jmp_addr(2);
			end if;
			
			if (v_instruction_valid = '1') then
				
				case v_instruction(6 downto 0) is --opcode
					
					when "0110111" => -- lui
						registers(to_integer(v_instruction(11 downto 7))) <= v_instruction(31 downto 12) & "000000000000";
						v_instruction_done <= '1';
					
					when "0010111" => -- auipc
						registers(to_integer(v_instruction(11 downto 7))) <= v_pc + v_instruction(31 downto 12) & "000000000000";
						v_instruction_done <= '1';
					
					when "1101111" => -- jal
						registers(to_integer(v_instruction(11 downto 7))) <= pc_p4;
						jmp_addr <= v_pc + resize(signed(v_instruction(31) & v_instruction(19 downto 12) & v_instruction(20) & v_instruction(30 downto 21) & '0'), v_pc'length);
						
						v_instruction_jump <= '1';
						v_instruction_done <= '1';
					
					when "1100111" => -- jalr
						registers(to_integer(v_instruction(11 downto 7))) <= pc_p4;
						jmp_addr <= signed(registers(to_integer(v_instruction(19 downto 15)))) + resize(signed(v_instruction(31 downto 20)), v_pc'length);
						-- v_pc(0) has to be 0
						jmp_addr(0) <= '0';
						v_instruction_jump <= '1';
						v_instruction_done <= '1';
					
					when "1100011" => -- B-type
						case v_instruction(14 downto 12) is -- funct3
							
							when "000" => -- beq
								if registers(to_integer(v_instruction(19 downto 15))) = registers(to_integer(v_instruction(24 downto 20))) then
									jmp_addr <= v_pc + resize(signed(v_instruction(31) & v_instruction(7) & v_instruction(30 downto 25) & v_instruction(11 downto 8) & '0'), v_pc'length);
									v_instruction_jump <= '1';
								end if;
								v_instruction_done <= '1';
									
							when "001" => -- bne
								if registers(to_integer(v_instruction(19 downto 15))) /= registers(to_integer(v_instruction(24 downto 20))) then
									jmp_addr <= v_pc + resize(signed(v_instruction(31) & v_instruction(7) & v_instruction(30 downto 25) & v_instruction(11 downto 8) & '0'), v_pc'length);
									v_instruction_jump <= '1';
								end if;
								v_instruction_done <= '1';
							
							when "100" => -- blt
								if signed(registers(to_integer(v_instruction(19 downto 15)))) < signed(registers(to_integer(v_instruction(24 downto 20)))) then
									jmp_addr <= v_pc + resize(signed(v_instruction(31) & v_instruction(7) & v_instruction(30 downto 25) & v_instruction(11 downto 8) & '0'), v_pc'length);
									v_instruction_jump <= '1';
								end if;
								v_instruction_done <= '1';
							
							when "101" => -- bge
								if signed(registers(to_integer(v_instruction(19 downto 15)))) >= signed(registers(to_integer(v_instruction(24 downto 20)))) then
									jmp_addr <= v_pc + resize(signed(v_instruction(31) & v_instruction(7) & v_instruction(30 downto 25) & v_instruction(11 downto 8) & '0'), v_pc'length);
									v_instruction_jump <= '1';
								end if;
								v_instruction_done <= '1';
								
							when "110" => -- bltu
								if unsigned(registers(to_integer(v_instruction(19 downto 15)))) < unsigned(registers(to_integer(v_instruction(24 downto 20)))) then
									jmp_addr <= v_pc + resize(signed(v_instruction(31) & v_instruction(7) & v_instruction(30 downto 25) & v_instruction(11 downto 8) & '0'), v_pc'length);
									v_instruction_jump <= '1';
								end if;
								v_instruction_done <= '1';
							
							when "111" => -- bgeu
								if unsigned(registers(to_integer(v_instruction(19 downto 15)))) >= unsigned(registers(to_integer(v_instruction(24 downto 20)))) then
									jmp_addr <= v_pc + resize(signed(v_instruction(31) & v_instruction(7) & v_instruction(30 downto 25) & v_instruction(11 downto 8) & '0'), v_pc'length);
									v_instruction_jump <= '1';
								end if;
								v_instruction_done <= '1';
							
							when others =>
								null;
								v_instruction_done <= '1';
								
						end case;
					
					--TODO important in memory access all writes must have completed bevore a read access can occur
					when "0000011" -- I-type
						case v_instruction(14 downto 12) is -- funct3
							when "000" => -- lb
								if v_instruction_new = '1' then
									dm_addr <= std_logic_vector(signed(registers(to_integer(v_instruction(19 downto 15)))) + resize(signed(v_instruction(31 downto 20)), dm_addr'length));
									o_DM_DV <= '1';
								elsif i_DM_DV = '1' then
									registers(to_integer(v_instruction(11 downto 7))) <= resize(signed(dm_read_data_bytes(to_integer(dm_addr(1 downto 0)))), registers(0)'length);
									v_instruction_done <= '1';
								else
									null; -- wait until load complete
								end if;
							
							when "001" => -- lh
								if v_instruction_new = '1' then
									dm_addr <= std_logic_vector(signed(registers(to_integer(v_instruction(19 downto 15)))) + resize(signed(v_instruction(31 downto 20)), dm_addr'length));
									o_DM_DV <= '1';
								elsif i_DM_DV = '1' then
									registers(to_integer(v_instruction(11 downto 7))) <= resize(signed(dm_read_data_2bytes(to_integer(dm_addr(1)))), registers(0)'length);
									v_instruction_done <= '1';
								else
									null; -- wait until load complete
								end if;
								
							when "010" => -- lw
								if v_instruction_new = '1' then
									dm_addr <= std_logic_vector(signed(registers(to_integer(v_instruction(19 downto 15)))) + resize(signed(v_instruction(31 downto 20)), dm_addr'length));
									o_DM_DV <= '1';
								elsif i_DM_DV = '1' then
									registers(to_integer(v_instruction(11 downto 7))) <= unsigned(i_DM_Data);
									v_instruction_done <= '1';
								else
									null; -- wait until load complete
								end if;
							
							when "100" => -- lbu
								if v_instruction_new = '1' then
									dm_addr <= std_logic_vector(signed(registers(to_integer(v_instruction(19 downto 15)))) + resize(signed(v_instruction(31 downto 20)), dm_addr'length));
									o_DM_DV <= '1';
								elsif i_DM_DV = '1' then
									registers(to_integer(v_instruction(11 downto 7))) <= resize(unsigned(dm_read_data_bytes(to_integer(dm_addr(1 downto 0)))), registers(0)'length);
									v_instruction_done <= '1';
								else
									null; -- wait until load complete
								end if;
							
							when "101" => -- lhu
								if v_instruction_new = '1' then
									dm_addr <= std_logic_vector(signed(registers(to_integer(v_instruction(19 downto 15)))) + resize(signed(v_instruction(31 downto 20)), dm_addr'length));
									o_DM_DV <= '1';
								elsif i_DM_DV = '1' then
									registers(to_integer(v_instruction(11 downto 7))) <= resize(unsigned(dm_read_data_2bytes(to_integer(dm_addr(1)))), registers(0)'length);
									v_instruction_done <= '1';
								else
									null; -- wait until load complete
								end if;
							
							when others =>
								null;
								v_instruction_done <= '1';
					
					when "0100011" => -- S-type
						case v_instruction(14 downto 12) is -- funct3
							
							when "000" => -- sb
								v_dm_addr <= std_logic_vector(signed(registers(to_integer(v_instruction(19 downto 15)))) + resize(signed(v_instruction(31 downto 25) & v_instruction(11 downto 7)), dm_addr'length));
								dm_addr <= v_dm_addr;
								dm_write_data_bytes(to_integer(v_dm_addr(1 downto 0)))(7 downto 0) <= registers(to_integer(v_instruction(24 downto 20)))(7 downto 0);  
								o_DM_Wr_En(to_integer(v_dm_addr(1 downto 0))) <= '1';
								o_DM_DV <= '1';	
								v_instruction_done <= '1';
								
							when "001" => -- sh
								v_dm_addr <= std_logic_vector(signed(registers(to_integer(v_instruction(19 downto 15)))) + resize(signed(v_instruction(31 downto 25) & v_instruction(11 downto 7)), dm_addr'length));
								dm_addr <= v_dm_addr;
								dm_write_data_2bytes(to_integer(v_dm_addr(1)))(15 downto 0) <= registers(to_integer(v_instruction(24 downto 20)))(15 downto 0);  
								if (v_dm_addr(1) = '1') then
									o_DM_Wr_En <= "1100";
								else
									o_DM_Wr_En <= "0011";
								end if;
								o_DM_DV <= '1';	
								v_instruction_done <= '1';
								
							when "010" => -- sw
								dm_addr <= std_logic_vector(signed(registers(to_integer(v_instruction(19 downto 15)))) + resize(signed(v_instruction(31 downto 25) & v_instruction(11 downto 7)), dm_addr'length));
								o_DM_Data <= registers(to_integer(v_instruction(24 downto 20)))(31 downto 0);  
								o_DM_Wr_En(3 downto 0) <= "1111";
								o_DM_DV <= '1';	
								v_instruction_done <= '1';
							
							when others =>
								null;
								v_instruction_done <= '1';
					
					when "0010011" => -- I-type
						case v_instruction(14 downto 12) is -- funct3
							
							when "000" => -- addi
								registers(to_integer(v_instruction(11 downto 7))) <= signed(registers(to_integer(v_instruction(19 downto 15)))) + signed(v_instruction(31 downto 20));
								v_instruction_done <= '1';
								
							when "010" => -- slti
								registers(to_integer(v_instruction(11 downto 7)))(31 downto 0) <= (others => '0');
								if signed(registers(to_integer(v_instruction(19 downto 15)))) < signed(v_instruction(31 downto 20)) then
									registers(to_integer(v_instruction(11 downto 7)))(0) <= '1'; 
								end if;
								v_instruction_done <= '1';
								
							when "011" => -- sltiu
								registers(to_integer(v_instruction(11 downto 7)))(31 downto 0) <= (others => '0');
								if registers(to_integer(v_instruction(19 downto 15))) < v_instruction(31 downto 20) then
									registers(to_integer(v_instruction(11 downto 7)))(0) <= '1'; 
								end if;
								v_instruction_done <= '1';
								
							when "100" => -- xori
								registers(to_integer(v_instruction(11 downto 7))) <= signed(registers(to_integer(v_instruction(19 downto 15)))) xor resize(signed(v_instruction(31 downto 20)), registers(0)'length);
								v_instruction_done <= '1';
							
							when "110" => --ori
								registers(to_integer(v_instruction(11 downto 7))) <= signed(registers(to_integer(v_instruction(19 downto 15)))) or resize(signed(v_instruction(31 downto 20)), registers(0)'length);
								v_instruction_done <= '1';
							
							when "111" => --andi
								registers(to_integer(v_instruction(11 downto 7))) <= signed(registers(to_integer(v_instruction(19 downto 15)))) and resize(signed(v_instruction(31 downto 20)), registers(0)'length);
								v_instruction_done <= '1';
							
							when "001" => --slli
								registers(to_integer(v_instruction(11 downto 7)))(31 downto 0) <= shift_left(registers(to_integer(v_instruction(19 downto 15))), to_integer(v_instruction(24 downto 20));
								v_instruction_done <= '1';
							
							when "101" => --srli/srai
								if v_instruction(30) = '0' then -- srli
									registers(to_integer(v_instruction(11 downto 7)))(31 downto 0) <= shift_right(registers(to_integer(v_instruction(19 downto 15))), to_integer(v_instruction(24 downto 20)));	
								else	-- srai
									registers(to_integer(v_instruction(11 downto 7)))(31 downto 0) <= shift_right(signed(registers(to_integer(v_instruction(19 downto 15)))), to_integer(v_instruction(24 downto 20)));
								end if;			
								v_instruction_done <= '1';
								
							when others =>
								null;
								v_instruction_done <= '1';
						
						end case;
							
					when "0110011" => -- R-type
						case v_instruction(14 downto 12) is -- funct3
							
							when "000" => -- add/sub
								if v_instruction(30) = '0' then --add
									if (v_instruction_new = '1') then
										a_add <= std_logic_vector(registers(to_integer(v_instruction(19 downto 15))));
										b_add <= std_logic_vector(registers(to_integer(v_instruction(24 downto 20))));
									else
										registers(to_integer(v_instruction(11 downto 7))) <= unsigned(result_add);
										v_instruction_done <= '1';
									end if;
								else -- sub
									if (v_instruction_new = '1') then
										a_sub <= std_logic_vector(registers(to_integer(v_instruction(19 downto 15))));
										b_sub <= std_logic_vector(registers(to_integer(v_instruction(24 downto 20))));
									else
										registers(to_integer(v_instruction(11 downto 7))) <= unsigned(result_sub);
										v_instruction_done <= '1';
									end if;
								end if;
								
							when "001" => -- sll
								registers(to_integer(v_instruction(11 downto 7)))(31 downto 0) <= shift_left(registers(to_integer(v_instruction(19 downto 15))), to_integer(registers(to_integer(v_instruction(24 downto 20)))(4 downto 0)));
								v_instruction_done <= '1';
							
							when "010" => -- slt
								registers(to_integer(v_instruction(11 downto 7)))(31 downto 0) <= (others => '0');
								if signed(registers(to_integer(v_instruction(19 downto 15)))) < signed(registers(to_integer(v_instruction(24 downto 20)))) then
									registers(to_integer(v_instruction(11 downto 7)))(0) <= '1'; 
								end if;
								v_instruction_done <= '1';
								
							when "011" => -- sltu
								registers(to_integer(v_instruction(11 downto 7)))(31 downto 0) <= (others => '0');
								if unsigned(registers(to_integer(v_instruction(19 downto 15)))) < unsigned(registers(to_integer(v_instruction(24 downto 20)))) then
									registers(to_integer(v_instruction(11 downto 7)))(0) <= '1'; 
								end if;
								v_instruction_done <= '1';
								
							when "100" => -- xor
								registers(to_integer(v_instruction(11 downto 7))) <= registers(to_integer(v_instruction(19 downto 15))) xor registers(to_integer(v_instruction(24 downto 20)));
								v_instruction_done <= '1';
								
							when "101" => -- srl/sra
								if v_instruction(30) = '0' then -- srl
									registers(to_integer(v_instruction(11 downto 7)))(31 downto 0) <= shift_right(registers(to_integer(v_instruction(19 downto 15))), to_integer(registers(to_integer(v_instruction(24 downto 20)))(4 downto 0)));
								else	-- sra
									registers(to_integer(v_instruction(11 downto 7)))(31 downto 0) <= shift_right(signed(registers(to_integer(v_instruction(19 downto 15)))), to_integer(registers(to_integer(v_instruction(24 downto 20)))(4 downto 0)));	
								end if;
								v_instruction_done <= '1';
								
							when "110" => -- or
								registers(to_integer(v_instruction(11 downto 7))) <= registers(to_integer(v_instruction(19 downto 15))) or registers(to_integer(v_instruction(24 downto 20)));
								v_instruction_done <= '1';
								
							when "111" => -- and
								registers(to_integer(v_instruction(11 downto 7))) <= registers(to_integer(v_instruction(19 downto 15))) and registers(to_integer(v_instruction(24 downto 20)));
								v_instruction_done <= '1';
								
							when others => 
								null;
								v_instruction_done <= '1';
							
						end case;
					
					when "1110011" => -- I-type
						if v_instruction = "00000000000100000000000001110011" then -- ebreak;
							v_return_ctrl_logic_unit <= '1';
							v_instruction_done <= '1';
						else
							null;
							v_instruction_done <= '1';
						end if
					when others => 
						null;
						v_instruction_done <= '1';
				end case;
			end if; -- v_instruction valid
			
			if v_instruction_done = '1' then
				v_instruction_valid <= '0';
				wait_instruction_ready <= '1';
				if v_instruction_jump = '1' then
					instruction_jump <= '1';
				end if;	
			end if;
		else
			null; -- Logic Unit does not have control
		end if; -- ctrl_logic_unit
		
		if i_Give_Ctrl_Logic_Unit = '1' then
			ctrl_logic_unit <= '1';
		end if;
		if v_return_ctrl_logic_unit = '1' then
			ctrl_logic_unit <= '0';
			o_Return_Ctrl_Logic_Unit <= '1';
		end if;
		if i_Take_Ctrl_Logic_Unit = '1' then
			ctrl_logic_unit <= '0';
		end if;
		
	end if; -- clk'rising_edge
end process;
registers(0) <= (others => '0');

end Behavioral;
