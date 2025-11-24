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
		i_DM_DV : in std_logic
	);
end LogicUnit;

architecture Behavioral of LogicUnit is

component Add
	port
	(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		S : out std_logic_vector(31 downto 0)
	);
end component;

component Sub
	port 
	(
		A : in std_logic_vector(31 downto 0);
		B : in std_logic_vector(31 downto 0);
		S : out std_logic_vector(31 downto 0)
	);
end component;

signal ctrl_logic_unit : std_logic := '0';

type t_reg_array is array(0 to 31) of unsigned(31 downto 0);
signal registers : t_reg_array;

type t_fetch_states is (fetch_state_idle, fetch_state_next, fetch_state_next_2);
signal fetch_state : t_fetch_states;

type t_byte_array_32 is array(0 to 3) of std_logic_vector(7 downto 0);
type t_2byte_array_32 is array(0 to 1) of std_logic_vector(15 downto 0);
signal dm_read_data_bytes : t_byte_array_32;
signal dm_read_data_2bytes : t_2byte_array_32;
signal dm_addr : std_logic_vector(31 downto 0);

type t_pm_fetch_array is array(0 to 3) of unsigned(31 downto 0);
type t_2_u32 is array(0 to 1) of unsigned(31 downto 0);

signal pc : t_2_u32;
signal jmp_addr : unsigned(31 downto 0);
signal pc_fetch : t_pm_fetch_array;
--signal instruction : t_2_u32;
signal instruction_fetch : t_pm_fetch_array;
signal instruction_jump : std_logic := '0';
signal instruction_ready : std_logic := '0';
signal instruction_loaded : std_logic := '0';
signal instruction_p4_ready : std_logic := '0';
signal wait_instruction_ready : std_logic := '1';
signal instruction_upper : unsigned(0 downto 0) := (others => '0');
signal instruction_upper_latch : unsigned(0 downto 0) := (others => '0');
signal instruction_multicycle : std_logic := '0';
signal current_instruction : unsigned(31 downto 0) := (others => '0');
signal current_pc : unsigned(31 downto 0) := (others => '0');
signal instruction_valid : std_logic := '0';

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

dm_read_data_bytes(0) <= i_DM_Data(7 downto 0);
dm_read_data_bytes(1) <= i_DM_Data(15 downto 8);
dm_read_data_bytes(2) <= i_DM_Data(23 downto 16);
dm_read_data_bytes(3) <= i_DM_Data(31 downto 24);
 
dm_read_data_2bytes(0) <= i_DM_Data(15 downto 0);
dm_read_data_2bytes(1) <= i_DM_Data(31 downto 16);

o_DM_Addr <= dm_addr;

Instruction_Fetch_Proc : process(i_Clk)
	variable v_addr_p8 : unsigned(31 downto 0);
begin
	if rising_edge(i_Clk) then
		if (i_Sync_nRst = '0') then
			pc_fetch(0) <= x"0000000" & "0000";
			pc_fetch(1) <= x"0000000" & "0100";
			pc_fetch(2) <= x"0000000" & "1000";
			pc_fetch(3) <= x"0000000" & "1100";
			o_PM_Addr <= (others => '0');
			fetch_state <= fetch_state_next;
		elsif ctrl_logic_unit = '1' and i_Take_Ctrl_Logic_Unit = '0' then
			if (instruction_jump = '1') then
				o_PM_Addr <= std_logic_vector(jmp_addr(15 downto 3)); -- jmp_addr(2) decides if lower or upper 32bit 
				pc_fetch(0) <= jmp_addr(31 downto 3) & '0' & jmp_addr(1 downto 0);
				pc_fetch(1) <= jmp_addr(31 downto 3) & '1' & jmp_addr(1 downto 0);
				fetch_state <= fetch_state_next;
				instruction_ready <= '0';
			else
				case fetch_state is 
					when fetch_state_next =>
						instruction_ready <= '0';
						o_PM_Addr <= std_logic_vector(pc_fetch(0)(15 downto 3));
						if i_PM_DV = '1' then
							instruction_fetch(0) <= unsigned(i_PM_Data(31 downto 0));
							instruction_fetch(1) <= unsigned(i_PM_Data(63 downto 32));
							pc(0) <= pc_fetch(0);
							pc(1) <= pc_fetch(1);
							instruction_ready <= '1';
							v_addr_p8 := pc_fetch(0) + 8;
							o_PM_Addr <= std_logic_vector(v_addr_p8(15 downto 3));
							if (instruction_upper = "0") then
								fetch_state <= fetch_state_next_2;
								pc_fetch(2) <= v_addr_p8;
								pc_fetch(3) <= pc_fetch(1) + 8;
							else
								fetch_state <= fetch_state_next;
								pc_fetch(0) <= v_addr_p8;
								pc_fetch(1) <= pc_fetch(1) + 8;
							end if;
						else
							fetch_state <= fetch_state_next;
						end if;
					
					when fetch_state_next_2 =>
						instruction_ready <= '1';
						o_PM_Addr <= std_logic_vector(pc_fetch(2)(15 downto 3));
						if i_PM_DV = '1' then
							if instruction_upper = "0" and instruction_upper_latch = "1" then
								instruction_fetch(0) <= unsigned(i_PM_Data(31 downto 0));
								instruction_fetch(1) <= unsigned(i_PM_Data(63 downto 32));
								pc_fetch(0) <= pc_fetch(2);
								pc_fetch(1) <= pc_fetch(3);
								pc(0) <= pc_fetch(2);
								pc(1) <= pc_fetch(3);
								v_addr_p8 := pc_fetch(2) + 8;
								pc_fetch(2) <= v_addr_p8;
								pc_fetch(3) <= pc_fetch(3) + 8;
								o_PM_Addr <= std_logic_vector(v_addr_p8(15 downto 3));
								fetch_state <= fetch_state_next_2;
							else
								instruction_fetch(2) <= unsigned(i_PM_Data(31 downto 0));
								instruction_fetch(3) <= unsigned(i_PM_Data(63 downto 32));
								fetch_state <= fetch_state_idle;
							end if;
						elsif instruction_upper = "0" and instruction_upper_latch = "1" then
							instruction_ready <= '0';
							pc_fetch(0) <= pc_fetch(2);
							pc_fetch(1) <= pc_fetch(3);
							fetch_state <= fetch_state_next;
						else
							fetch_state <= fetch_state_next_2;
						end if;
						
					when fetch_state_idle =>
						instruction_ready <= '1';
						if instruction_upper = "0" and instruction_upper_latch = "1" then
							pc_fetch(0) <= pc_fetch(2);
							pc_fetch(1) <= pc_fetch(3);
							pc(0) <= pc_fetch(2);
							pc(1) <= pc_fetch(3);
							instruction_fetch(0) <= instruction_fetch(2);
							instruction_fetch(1) <= instruction_fetch(3);
							fetch_state <= fetch_state_next_2;
							v_addr_p8 := pc_fetch(2) + 8;
							pc_fetch(2) <= v_addr_p8;
							pc_fetch(3) <= pc_fetch(3) + 8;
							o_PM_Addr <= std_logic_vector(v_addr_p8(15 downto 3));
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

Instructions_Proc : process (i_Clk)
	variable v_dm_addr : std_logic_vector(31 downto 0) := (others => '0');
	variable v_instruction_done : std_logic := '0';
	--variable v_instruction_new : std_logic := '0';
	variable v_return_ctrl_logic_unit : std_logic := '0';
	variable v_immediate : unsigned(31 downto 0);
	variable v_dm_write_data_bytes : t_byte_array_32;
	variable v_dm_write_data_2bytes : t_2byte_array_32;
begin
	if rising_edge(i_Clk) then
		o_DM_DV <= '0';
		o_DM_Wr_En <= (others => '0');
		--v_instruction_new := '0';
		instruction_jump <= '0';
		v_instruction_done := '0';
		instruction_upper_latch <= instruction_upper;
		v_return_ctrl_logic_unit := '0';
		o_Return_Ctrl_Logic_Unit <= '0';
		instruction_multicycle <= '0';
		instruction_valid <= '0';
		
		if (i_Sync_nRst = '0') then
			instruction_upper <= (others => '0');
			instruction_upper_latch <= (others => '0');
			wait_instruction_ready <= '1';
		elsif ctrl_logic_unit = '1' and i_Take_Ctrl_Logic_Unit = '0' then
		
			if instruction_ready = '1' and wait_instruction_ready = '1' and instruction_jump = '0' then
				current_instruction <= instruction_fetch(to_integer(instruction_upper));
				current_pc <= pc(to_integer(instruction_upper));
				instruction_upper <= not instruction_upper;
				instruction_valid <= '1';
				--v_instruction_new := '1';
				wait_instruction_ready <= '0';
			elsif instruction_jump = '1' then
				instruction_upper(0) <= jmp_addr(2);
			end if;
			
			if instruction_valid = '1' then
				
				case current_instruction(6 downto 0) is --opcode
					
					when "0110111" => -- lui
						registers(to_integer(current_instruction(11 downto 7))) <= current_instruction(31 downto 12) & "000000000000";
						v_instruction_done := '1';
					
					when "0010111" => -- auipc
						registers(to_integer(current_instruction(11 downto 7))) <= current_pc + (current_instruction(31 downto 12) & "000000000000");
						v_instruction_done := '1';
					
					when "1101111" => -- jal
						registers(to_integer(current_instruction(11 downto 7))) <= current_pc + 4;
						jmp_addr <= unsigned(resize(signed(current_instruction(31) & current_instruction(19 downto 12) & current_instruction(20) & current_instruction(30 downto 21) & '0'), current_pc'length));
						instruction_multicycle <= '1';
					
					when "1100111" => -- jalr
						registers(to_integer(current_instruction(11 downto 7))) <= current_pc + 4;
						jmp_addr <= unsigned(resize(signed(current_instruction(31 downto 20)), current_pc'length));
						instruction_multicycle <= '1';
					
					when "1100011" => -- B-type
						case current_instruction(14 downto 12) is -- funct3
							
							when "000" => -- beq
								if registers(to_integer(current_instruction(19 downto 15))) = registers(to_integer(current_instruction(24 downto 20))) then
									jmp_addr <= unsigned(resize(signed(current_instruction(31) & current_instruction(7) & current_instruction(30 downto 25) & current_instruction(11 downto 8) & '0'), current_pc'length));
									instruction_multicycle <= '1';
								else
									v_instruction_done := '1';
								end if;
								
									
							when "001" => -- bne
								if registers(to_integer(current_instruction(19 downto 15))) /= registers(to_integer(current_instruction(24 downto 20))) then
									jmp_addr <= unsigned(resize(signed(current_instruction(31) & current_instruction(7) & current_instruction(30 downto 25) & current_instruction(11 downto 8) & '0'), current_pc'length));
									instruction_multicycle <= '1';
								else
									v_instruction_done := '1';
								end if;
							
							when "100" => -- blt
								if signed(registers(to_integer(current_instruction(19 downto 15)))) < signed(registers(to_integer(current_instruction(24 downto 20)))) then
									jmp_addr <= unsigned(resize(signed(current_instruction(31) & current_instruction(7) & current_instruction(30 downto 25) & current_instruction(11 downto 8) & '0'), current_pc'length));
									instruction_multicycle <= '1';
								else
									v_instruction_done := '1';
								end if;
							
							when "101" => -- bge
								if signed(registers(to_integer(current_instruction(19 downto 15)))) >= signed(registers(to_integer(current_instruction(24 downto 20)))) then
									jmp_addr <= unsigned(resize(signed(current_instruction(31) & current_instruction(7) & current_instruction(30 downto 25) & current_instruction(11 downto 8) & '0'), current_pc'length));
									instruction_multicycle <= '1';
								else
									v_instruction_done := '1';
								end if;
								
							when "110" => -- bltu
								if unsigned(registers(to_integer(current_instruction(19 downto 15)))) < unsigned(registers(to_integer(current_instruction(24 downto 20)))) then
									jmp_addr <= unsigned(resize(signed(current_instruction(31) & current_instruction(7) & current_instruction(30 downto 25) & current_instruction(11 downto 8) & '0'), current_pc'length));
									instruction_multicycle <= '1';
								else
									v_instruction_done := '1';
								end if;
							
							when "111" => -- bgeu
								if unsigned(registers(to_integer(current_instruction(19 downto 15)))) >= unsigned(registers(to_integer(current_instruction(24 downto 20)))) then
									jmp_addr <= unsigned(resize(signed(current_instruction(31) & current_instruction(7) & current_instruction(30 downto 25) & current_instruction(11 downto 8) & '0'), current_pc'length));
									instruction_multicycle <= '1';
								else
									v_instruction_done := '1';
								end if;
							
							when others =>
								null;
								v_instruction_done := '1';
								
						end case;
					
					--TODO important in memory access all writes must have completed bevore a read access can occur
					when "0000011" => -- I-type
						case current_instruction(14 downto 12) is -- funct3
							
							when "000" => -- lb
								v_immediate := unsigned(resize(signed(current_instruction(31 downto 20)), dm_addr'length));
								dm_addr <= std_logic_vector(registers(to_integer(current_instruction(19 downto 15))) + v_immediate);
								o_DM_DV <= '1';
								instruction_multicycle <= '1';
							
							when "001" => -- lh
								v_immediate := unsigned(resize(signed(current_instruction(31 downto 20)), dm_addr'length));
								dm_addr <= std_logic_vector(registers(to_integer(current_instruction(19 downto 15))) + v_immediate);
								o_DM_DV <= '1';
								instruction_multicycle <= '1';
								
							when "010" => -- lw
								v_immediate := unsigned(resize(signed(current_instruction(31 downto 20)), dm_addr'length));
								dm_addr <= std_logic_vector(registers(to_integer(current_instruction(19 downto 15))) + v_immediate);
								o_DM_DV <= '1';
								instruction_multicycle <= '1';
							
							when "100" => -- lbu
								v_immediate := unsigned(resize(signed(current_instruction(31 downto 20)), dm_addr'length));
								dm_addr <= std_logic_vector(registers(to_integer(current_instruction(19 downto 15))) + v_immediate);
								o_DM_DV <= '1';
								instruction_multicycle <= '1';
							
							when "101" => -- lhu
								v_immediate := unsigned(resize(signed(current_instruction(31 downto 20)), dm_addr'length));
								dm_addr <= std_logic_vector(registers(to_integer(current_instruction(19 downto 15))) + v_immediate);
								o_DM_DV <= '1';
								instruction_multicycle <= '1';
							
							when others =>
								null;
								v_instruction_done := '1';
						end case;
						
					when "0100011" => -- S-type
						case current_instruction(14 downto 12) is -- funct3
							
							when "000" => -- sb
								v_immediate(11 downto 0) := current_instruction(31 downto 25) & current_instruction(11 downto 7);
								v_immediate := unsigned(resize(signed(v_immediate(11 downto 0)), dm_addr'length));
								v_dm_addr := std_logic_vector(v_immediate + registers(to_integer(current_instruction(19 downto 15))));
								dm_addr <= v_dm_addr;
								v_dm_write_data_bytes(to_integer(unsigned(v_dm_addr(1 downto 0))))(7 downto 0) := std_logic_vector(registers(to_integer(current_instruction(24 downto 20)))(7 downto 0));  
								o_DM_Data(7 downto 0) <= v_dm_write_data_bytes(0); 
								o_DM_Data(15 downto 8) <= v_dm_write_data_bytes(1); 
								o_DM_Data(23 downto 16) <= v_dm_write_data_bytes(2); 
								o_DM_Data(31 downto 24) <= v_dm_write_data_bytes(3);
								o_DM_Wr_En(to_integer(unsigned(v_dm_addr(1 downto 0)))) <= '1';
								o_DM_DV <= '1';	
								v_instruction_done := '1';
								
							when "001" => -- sh
								v_immediate(11 downto 0) := current_instruction(31 downto 25) & current_instruction(11 downto 7);
								v_immediate := unsigned(resize(signed(v_immediate(11 downto 0)), dm_addr'length));
								v_dm_addr := std_logic_vector(v_immediate + registers(to_integer(current_instruction(19 downto 15))));
								dm_addr <= v_dm_addr;
								v_dm_write_data_2bytes(to_integer(unsigned(v_dm_addr(1 downto 1))))(15 downto 0) := std_logic_vector(registers(to_integer(current_instruction(24 downto 20)))(15 downto 0));  
								o_DM_Data(15 downto 0) <= v_dm_write_data_2bytes(0);
								o_DM_Data(31 downto 16) <= v_dm_write_data_2bytes(1);
								if (v_dm_addr(1) = '1') then
									o_DM_Wr_En <= "1100";
								else
									o_DM_Wr_En <= "0011";
								end if;
								o_DM_DV <= '1';	
								v_instruction_done := '1';
								
							when "010" => -- sw
								v_immediate(11 downto 0) := current_instruction(31 downto 25) & current_instruction(11 downto 7);
								v_immediate := unsigned(resize(signed(v_immediate(11 downto 0)), dm_addr'length));
								v_dm_addr := std_logic_vector(v_immediate + registers(to_integer(current_instruction(19 downto 15))));
								dm_addr <= v_dm_addr;
								o_DM_Data <= std_logic_vector(registers(to_integer(current_instruction(24 downto 20)))(31 downto 0));  
								o_DM_Wr_En(3 downto 0) <= "1111";
								o_DM_DV <= '1';	
								v_instruction_done := '1';
							
							when others =>
								null;
								v_instruction_done := '1';
						end case;
					
					when "0010011" => -- I-type
						case current_instruction(14 downto 12) is -- funct3
							
							when "000" => -- addi
								v_immediate := unsigned(resize(signed(current_instruction(31 downto 20)), registers(0)'length));
								registers(to_integer(current_instruction(11 downto 7))) <= v_immediate + registers(to_integer(current_instruction(19 downto 15)));
								v_instruction_done := '1';
								
							when "010" => -- slti
								registers(to_integer(current_instruction(11 downto 7)))(31 downto 0) <= (others => '0');
								if signed(registers(to_integer(current_instruction(19 downto 15)))) < signed(current_instruction(31 downto 20)) then
									registers(to_integer(current_instruction(11 downto 7)))(0) <= '1'; 
								end if;
								v_instruction_done := '1';
								
							when "011" => -- sltiu
								registers(to_integer(current_instruction(11 downto 7)))(31 downto 0) <= (others => '0');
								if registers(to_integer(current_instruction(19 downto 15))) < current_instruction(31 downto 20) then
									registers(to_integer(current_instruction(11 downto 7)))(0) <= '1'; 
								end if;
								v_instruction_done := '1';
								
							when "100" => -- xori
								v_immediate := unsigned(resize(signed(current_instruction(31 downto 20)), registers(0)'length));
								registers(to_integer(current_instruction(11 downto 7))) <= registers(to_integer(current_instruction(19 downto 15))) xor v_immediate;
								v_instruction_done := '1';
							
							when "110" => -- ori
								v_immediate := unsigned(resize(signed(current_instruction(31 downto 20)), registers(0)'length));
								registers(to_integer(current_instruction(11 downto 7))) <= registers(to_integer(current_instruction(19 downto 15))) or v_immediate;
								v_instruction_done := '1';
							
							when "111" => -- andi
								v_immediate := unsigned(resize(signed(current_instruction(31 downto 20)), registers(0)'length));
								registers(to_integer(current_instruction(11 downto 7))) <= registers(to_integer(current_instruction(19 downto 15))) and v_immediate;
								v_instruction_done := '1';
							
							when "001" => -- slli
								registers(to_integer(current_instruction(11 downto 7)))(31 downto 0) <= shift_left(registers(to_integer(current_instruction(19 downto 15))), to_integer(current_instruction(24 downto 20)));
								v_instruction_done := '1';
							
							when "101" => -- srli/srai
								if current_instruction(30) = '0' then -- srli
									registers(to_integer(current_instruction(11 downto 7)))(31 downto 0) <= shift_right(registers(to_integer(current_instruction(19 downto 15))), to_integer(current_instruction(24 downto 20)));	
								else	-- srai
									registers(to_integer(current_instruction(11 downto 7)))(31 downto 0) <= unsigned(shift_right(signed(registers(to_integer(current_instruction(19 downto 15)))), to_integer(current_instruction(24 downto 20))));
								end if;			
								v_instruction_done := '1';
								
							when others =>
								null;
								v_instruction_done := '1';
						
						end case;
							
					when "0110011" => -- R-type
						case current_instruction(14 downto 12) is -- funct3
							
							when "000" => -- add/sub
								if current_instruction(30) = '0' then --add
									a_add <= std_logic_vector(registers(to_integer(current_instruction(19 downto 15))));
									b_add <= std_logic_vector(registers(to_integer(current_instruction(24 downto 20))));
								else -- sub
									a_sub <= std_logic_vector(registers(to_integer(current_instruction(19 downto 15))));
									b_sub <= std_logic_vector(registers(to_integer(current_instruction(24 downto 20))));
								end if;
								instruction_multicycle <= '1';
								
							when "001" => -- sll
								registers(to_integer(current_instruction(11 downto 7)))(31 downto 0) <= shift_left(registers(to_integer(current_instruction(19 downto 15))), to_integer(registers(to_integer(current_instruction(24 downto 20)))(4 downto 0)));
								v_instruction_done := '1';
							
							when "010" => -- slt
								registers(to_integer(current_instruction(11 downto 7)))(31 downto 0) <= (others => '0');
								if signed(registers(to_integer(current_instruction(19 downto 15)))) < signed(registers(to_integer(current_instruction(24 downto 20)))) then
									registers(to_integer(current_instruction(11 downto 7)))(0) <= '1'; 
								end if;
								v_instruction_done := '1';
								
							when "011" => -- sltu
								registers(to_integer(current_instruction(11 downto 7)))(31 downto 0) <= (others => '0');
								if unsigned(registers(to_integer(current_instruction(19 downto 15)))) < unsigned(registers(to_integer(current_instruction(24 downto 20)))) then
									registers(to_integer(current_instruction(11 downto 7)))(0) <= '1'; 
								end if;
								v_instruction_done := '1';
								
							when "100" => -- xor
								registers(to_integer(current_instruction(11 downto 7))) <= registers(to_integer(current_instruction(19 downto 15))) xor registers(to_integer(current_instruction(24 downto 20)));
								v_instruction_done := '1';
								
							when "101" => -- srl/sra
								if current_instruction(30) = '0' then -- srl
									registers(to_integer(current_instruction(11 downto 7)))(31 downto 0) <= shift_right(registers(to_integer(current_instruction(19 downto 15))), to_integer(registers(to_integer(current_instruction(24 downto 20)))(4 downto 0)));
								else	-- sra
									registers(to_integer(current_instruction(11 downto 7)))(31 downto 0) <= unsigned(shift_right(signed(registers(to_integer(current_instruction(19 downto 15)))), to_integer(registers(to_integer(current_instruction(24 downto 20)))(4 downto 0))));	
								end if;
								v_instruction_done := '1';
								
							when "110" => -- or
								registers(to_integer(current_instruction(11 downto 7))) <= registers(to_integer(current_instruction(19 downto 15))) or registers(to_integer(current_instruction(24 downto 20)));
								v_instruction_done := '1';
								
							when "111" => -- and
								registers(to_integer(current_instruction(11 downto 7))) <= registers(to_integer(current_instruction(19 downto 15))) and registers(to_integer(current_instruction(24 downto 20)));
								v_instruction_done := '1';
								
							when others => 
								null;
								v_instruction_done := '1';
							
						end case;
					
					when "1110011" => -- I-type
						if current_instruction = "00000000000100000000000001110011" then -- ebreak;
							v_return_ctrl_logic_unit := '1';
							v_instruction_done := '1';
						else
							null;
							v_instruction_done := '1';
						end if;
					when others => 
						null;
						v_instruction_done := '1';
				end case;
			end if; -- current_instruction valid
		
			if instruction_multicycle = '1' then
				
				case current_instruction(6 downto 0) is --opcode
					
					when "0110111" => -- lui
						null;
					
					when "0010111" => -- auipc
						null;
					
					when "1101111" => -- jal
						jmp_addr <= jmp_addr + current_pc;
						instruction_jump <= '1';
						v_instruction_done := '1';
					
					when "1100111" => -- jalr
						jmp_addr <= jmp_addr + registers(to_integer(current_instruction(19 downto 15)));
						-- current_pc(0) has to be 0
						jmp_addr(0) <= '0';
						instruction_jump <= '1';
						v_instruction_done := '1';
					
					when "1100011" => -- B-type
						--all B-type jmp instructions are built the same
						jmp_addr <= current_pc + jmp_addr;
						instruction_jump <= '1';
						v_instruction_done := '1';
						--case current_instruction(14 downto 12) is -- funct3
						--	
						--	when "000" => -- beq
						--		null;
						--			
						--	when "001" => -- bne
						--		null;
						--	
						--	when "100" => -- blt
						--		null;
						--	
						--	when "101" => -- bge
						--		null;
						--		
						--	when "110" => -- bltu
						--		null;
						--	
						--	when "111" => -- bgeu
						--		null;
						--	
						--	when others =>
						--		null;
						--		--v_instruction_done := '1';
						--		
						--end case;
					
					--TODO important in memory access all writes must have completed bevore a read access can occur
					when "0000011" => -- I-type
						case current_instruction(14 downto 12) is -- funct3
							
							when "000" => -- lb
								if i_DM_DV = '1' then
									registers(to_integer(current_instruction(11 downto 7))) <= unsigned(resize(signed(dm_read_data_bytes(to_integer(unsigned(dm_addr(1 downto 0))))), registers(0)'length));
									v_instruction_done := '1';
								else
									instruction_multicycle <= '1'; -- wait until load complete
								end if;
							
							when "001" => -- lh
								if i_DM_DV = '1' then
									registers(to_integer(current_instruction(11 downto 7))) <= unsigned(resize(signed(dm_read_data_2bytes(to_integer(unsigned(dm_addr(1 downto 1))))), registers(0)'length));
									v_instruction_done := '1';
								else
									instruction_multicycle <= '1'; -- wait until load complete
								end if;
								
							when "010" => -- lw
								if i_DM_DV = '1' then
									registers(to_integer(current_instruction(11 downto 7))) <= unsigned(i_DM_Data);
									v_instruction_done := '1';
								else
									instruction_multicycle <= '1'; -- wait until load complete
								end if;
							
							when "100" => -- lbu
								if i_DM_DV = '1' then
									registers(to_integer(current_instruction(11 downto 7))) <= resize(unsigned(dm_read_data_bytes(to_integer(unsigned(dm_addr(1 downto 0))))), registers(0)'length);
									v_instruction_done := '1';
								else
									instruction_multicycle <= '1'; -- wait until load complete
								end if;
							
							when "101" => -- lhu
								if i_DM_DV = '1' then
									registers(to_integer(current_instruction(11 downto 7))) <= resize(unsigned(dm_read_data_2bytes(to_integer(unsigned(dm_addr(1 downto 1))))), registers(0)'length);
									v_instruction_done := '1';
								else
									instruction_multicycle <= '1'; -- wait until load complete
								end if;
							
							when others =>
								null;
								--v_instruction_done := '1';
						end case;
						
					when "0100011" => -- S-type
						case current_instruction(14 downto 12) is -- funct3
							
							when "000" => -- sb
								null;
								
							when "001" => -- sh
								null;
								
							when "010" => -- sw
								null;
							
							when others =>
								null;
								--v_instruction_done := '1';
						end case;
					
					when "0010011" => -- I-type
						case current_instruction(14 downto 12) is -- funct3
							
							when "000" => -- addi
								null;
								
							when "010" => -- slti
								null;
								
							when "011" => -- sltiu
								null;
								
							when "100" => -- xori
								null;
							
							when "110" => -- ori
								null;
							
							when "111" => -- andi
								null;
							
							when "001" => -- slli
								null;
							
							when "101" => -- srli/srai
								null;
								
							when others =>
								null;
								--v_instruction_done := '1';
						
						end case;
							
					when "0110011" => -- R-type
						case current_instruction(14 downto 12) is -- funct3
							
							when "000" => -- add/sub
								if current_instruction(30) = '0' then --add
									registers(to_integer(current_instruction(11 downto 7))) <= unsigned(result_add);
								else -- sub
									registers(to_integer(current_instruction(11 downto 7))) <= unsigned(result_sub);
								end if;
								v_instruction_done := '1';
							
							when "001" => -- sll
								null;
							
							when "010" => -- slt
								null;
								
							when "011" => -- sltu
								null;
								
							when "100" => -- xor
								null;
								
							when "101" => -- srl/sra
								null;
								
							when "110" => -- or
								null;
								
							when "111" => -- and
								null;
								
							when others => 
								null;
								--v_instruction_done := '1';
							
						end case;
					
					when "1110011" => -- I-type
						null;
					when others => 
						null;
						--v_instruction_done := '1';
				end case;
			end if; -- instruction_multicycle
		
			if v_instruction_done = '1' then
				wait_instruction_ready <= '1';
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
		
		registers(0) <= (others => '0');
	end if; -- clk'rising_edge
end process;



end Behavioral;
