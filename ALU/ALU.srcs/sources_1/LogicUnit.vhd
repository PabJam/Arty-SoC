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
		o_PM_DV : out std_logic;
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

signal ctrl_logic_unit : std_logic := '0';

type t_reg_array is array(natural range 0 to 31) of unsigned(31 downto 0);
signal registers : t_reg_array;

type t_fetch_states is (fetch_state_idle, fetch_state_next, fetch_state_next_2);
signal fetch_state : t_fetch_states := fetch_state_next;

type t_byte_array_32 is array(0 to 3) of std_logic_vector(7 downto 0);
type t_2byte_array_32 is array(0 to 1) of std_logic_vector(15 downto 0);
signal dm_read_data_bytes : t_byte_array_32;
signal dm_read_data_2bytes : t_2byte_array_32;
signal dm_addr : std_logic_vector(31 downto 0);

type t_pm_fetch_array is array(0 to 3) of unsigned(31 downto 0);
type t_2_u32 is array(0 to 1) of unsigned(31 downto 0);
--type t_2_u21 is array(0 to 1) of unsigned(20 downto 0);
--type t_2_u5 is array(0 to 1) of unsigned(4 downto 0) 

signal pc : t_2_u32;
signal jmp_addr : unsigned(31 downto 0);
signal pc_fetch : t_pm_fetch_array;
--signal instruction : t_2_u32;
signal immediate : unsigned(20 downto 0) := (others => '0');
signal rs1 : natural range 0 to 31 := 0;
signal rs2 : natural range 0 to 31 := 0;
signal rd : natural range 0 to 31 := 0;
signal rs1_val : unsigned(31 downto 0) := (others => '0');
signal rs2_val : unsigned(31 downto 0) := (others => '0');
signal opcode : unsigned(6 downto 0) := (others => '0');
signal func3 : unsigned(2 downto 0) := (others => '0');
signal write_operation : std_logic := '0';
signal wait_finish_write_operation : std_logic := '0';
signal latched_immediate : unsigned(20 downto 0) := (others => '0');
signal latched_rs1 : natural range 0 to 31 := 0;
signal latched_rs2 : natural range 0 to 31 := 0;
signal latched_rs1_val : unsigned(31 downto 0) := (others => '0');
signal latched_rs2_val : unsigned(31 downto 0) := (others => '0');
signal latched_rd : natural range 0 to 31 := 0;
signal latched_opcode : unsigned(6 downto 0) := (others => '0');
signal latched_func3 : unsigned(2 downto 0) := (others => '0');
signal instruction_decoded : std_logic;
signal instruction_fetch : t_pm_fetch_array;
signal instruction_jump : std_logic := '0';
signal instruction_ready : std_logic := '0';
signal instruction_loaded : std_logic := '0';
signal instruction_p4_ready : std_logic := '0';
signal wait_instruction_ready : std_logic := '1';
signal instruction_upper : unsigned(0 downto 0) := (others => '0');
signal instruction_multicycle : std_logic := '0';
signal next_instruction : unsigned(31 downto 0) := (others => '0');
signal next_instruction_valid : std_logic := '0';
signal current_pc : unsigned(31 downto 0) := (others => '0');
signal next_pc : unsigned(31 downto 0) := (others => '0');
signal latched_current_pc : unsigned(31 downto 0) := (others => '0');
signal instruction_done : std_logic := '0';
signal instruction_read : std_logic := '0';
signal instruction_jumped : std_logic := '0';
signal latched_instruction_done : std_logic := '0';

attribute mark_debug : string;

attribute mark_debug of ctrl_logic_unit : signal is "true";
attribute mark_debug of instruction_decoded : signal is "true";
attribute mark_debug of instruction_multicycle : signal is "true";
attribute mark_debug of instruction_jump : signal is "true";
attribute mark_debug of opcode : signal is "true";
attribute mark_debug of func3 : signal is "true";
attribute mark_debug of rs1 : signal is "true";
attribute mark_debug of rs1_val : signal is "true";
attribute mark_debug of rs2 : signal is "true";
attribute mark_debug of rs2_val : signal is "true";
attribute mark_debug of immediate : signal is "true";
attribute mark_debug of current_pc : signal is "true";
attribute mark_debug of instruction_done : signal is "true";
attribute mark_debug of o_DM_DV : signal is "true";
attribute mark_debug of o_DM_Wr_En : signal is "true";
attribute mark_debug of write_operation : signal is "true";
attribute mark_debug of wait_finish_write_operation : signal is "true";
attribute mark_debug of instruction_ready : signal is "true";
attribute mark_debug of next_instruction_valid : signal is "true";
attribute mark_debug of latched_instruction_done : signal is "true";


begin


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
		o_PM_DV <= '0';
		if (i_Sync_nRst = '0') then
			pc_fetch(0) <= x"0000000" & "0000";
			pc_fetch(1) <= x"0000000" & "0100";
			pc_fetch(2) <= x"0000000" & "1000";
			pc_fetch(3) <= x"0000000" & "1100";
			pc(0) <= (others => '0');
			pc(1) <= (others => '0');
			instruction_fetch(0) <= (others => '0'); 
			instruction_fetch(1) <= (others => '0'); 
			instruction_fetch(2) <= (others => '0'); 
			instruction_fetch(3) <= (others => '0'); 
			o_PM_Addr <= (others => '0');
			fetch_state <= fetch_state_next;
			instruction_ready <= '0';
		elsif i_Give_Ctrl_Logic_Unit = '1' then
			o_PM_DV <= '1';
		elsif ctrl_logic_unit = '1' and i_Take_Ctrl_Logic_Unit = '0' then
			if (instruction_jump = '1') then
				o_PM_DV <= '1';
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
							o_PM_DV <= '1';
							if wait_instruction_ready = '0' then
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
							if instruction_read = '1' then
								instruction_fetch(0) <= unsigned(i_PM_Data(31 downto 0));
								instruction_fetch(1) <= unsigned(i_PM_Data(63 downto 32));
								pc_fetch(0) <= pc_fetch(2);
								pc_fetch(1) <= pc_fetch(3);
								pc(0) <= pc_fetch(2);
								pc(1) <= pc_fetch(3);
								v_addr_p8 := pc_fetch(2) + 8;
								pc_fetch(2) <= v_addr_p8;
								pc_fetch(3) <= pc_fetch(3) + 8;
								o_PM_DV <= '1';
								o_PM_Addr <= std_logic_vector(v_addr_p8(15 downto 3));
								fetch_state <= fetch_state_next_2;
							else
								instruction_fetch(2) <= unsigned(i_PM_Data(31 downto 0));
								instruction_fetch(3) <= unsigned(i_PM_Data(63 downto 32));
								fetch_state <= fetch_state_idle;
							end if;
						elsif instruction_read = '1' then
							instruction_ready <= '0';
							pc_fetch(0) <= pc_fetch(2);
							pc_fetch(1) <= pc_fetch(3);
							fetch_state <= fetch_state_next;
						else
							fetch_state <= fetch_state_next_2;
						end if;
						
					when fetch_state_idle =>
						instruction_ready <= '1';
						if instruction_read = '1' then 
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
							o_PM_DV <= '1';
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

instruction_Decode_Proc : process (i_Clk)
		variable v_current_instruction : unsigned(31 downto 0) := (others => '0');
begin
	if rising_edge(i_Clk) then
		instruction_read <= '0';
		-- TODO wait_instruction_ready should never be active longer then one cycle as long as instruction multicycle is not active 
		-- because it will always be ready if at least one cycle has passed after the last instruction
		-- but i can't just turn it off because it needs to send the last instruction it already got instead of overwriting it 
		if (i_Sync_nRst = '0') then
			instruction_upper <= (others => '0');
			instruction_decoded <= '0';
			write_operation <= '0';
			wait_finish_write_operation <= '0';
			wait_instruction_ready <= '1';
			next_instruction_valid <= '0';
			latched_instruction_done <= '0';
		elsif ctrl_logic_unit = '1' and i_Take_Ctrl_Logic_Unit = '0' then
			
			if instruction_done = '1' then
				latched_instruction_done <= '1';
			end if;
			
			if (instruction_ready = '1' or next_instruction_valid = '1') and instruction_jump = '0' and instruction_multicycle = '0' and wait_finish_write_operation = '0' then
				wait_instruction_ready <= '0';
				
				if instruction_upper(0) = '0' then
					v_current_instruction := instruction_fetch(0);
					next_instruction <= instruction_fetch(1);
					current_pc <= pc(0);
					next_pc <= pc(1);
					instruction_read <= '1';
					next_instruction_valid <= '1';
				else
					if instruction_jumped = '1' then -- after a jump the next instruction could be on the upper address but we need to turn on instruction_read for the fetch process
						v_current_instruction := instruction_fetch(1);
						current_pc <= pc(1);
						instruction_read <= '1';
						
					else
						v_current_instruction := next_instruction;
						current_pc <= next_pc;
					end if;
					next_instruction_valid <= '0';
				end if;
				
				latched_instruction_done <= '0';
				instruction_jumped <= '0';
				instruction_upper <= not instruction_upper;
				
				opcode <= v_current_instruction(6 downto 0);
				func3 <= v_current_instruction(14 downto 12);
				rs1 <= to_integer(v_current_instruction(19 downto 15));
				rs2 <= to_integer(v_current_instruction(24 downto 20));
				rd <= to_integer(v_current_instruction(11 downto 7));
				rs1_val <= registers(to_integer(v_current_instruction(19 downto 15)));
				rs2_val <= registers(to_integer(v_current_instruction(24 downto 20)));
				instruction_decoded <= '1';
				wait_finish_write_operation <= '0';
				
				case v_current_instruction(6 downto 0) is --opcode
					
					when ("0110111" or "0010111") => -- lui / auipc
						immediate(19 downto 0) <= v_current_instruction(31 downto 12);
						write_operation <= '1';
						
					when "1101111" => -- jal
						immediate(20 downto 0) <= v_current_instruction(31) & v_current_instruction(19 downto 12) & v_current_instruction(20) & v_current_instruction(30 downto 21) & '0';
						write_operation <= '1';
						
					when "1100111" => -- jalr
						immediate(11 downto 0) <= v_current_instruction(31 downto 20);
						if (to_integer(v_current_instruction(19 downto 15)) = rd and write_operation = '1') then -- current read is previous write => wait
							if (instruction_decoded = '1' or instruction_done = '0') and latched_instruction_done = '0' then -- if it didnt decode an operation last cycle and an instruction is done we dont need to wait
								instruction_decoded <= '0';
								wait_finish_write_operation <= '1';
							end if;
						end if;
						write_operation <= '1';
						
					when "1100011" => -- B-type
						immediate(12 downto 0) <= v_current_instruction(31) & v_current_instruction(7) & v_current_instruction(30 downto 25) & v_current_instruction(11 downto 8) & '0';
						if ((to_integer(v_current_instruction(19 downto 15)) = rd or to_integer(v_current_instruction(24 downto 20)) = rd) and write_operation = '1') then -- current read is previous write => wait
							if (instruction_decoded = '1' or instruction_done = '0') and latched_instruction_done = '0' then -- if it didnt decode an operation last cycle and an instruction is done we dont need to wait
								instruction_decoded <= '0';
								wait_finish_write_operation <= '1';
							end if;
						end if;
						write_operation <= '0';
						
					when "0000011" => -- I-type
						immediate(11 downto 0) <= v_current_instruction(31 downto 20);
						if (to_integer(v_current_instruction(19 downto 15)) = rd and write_operation = '1') then -- current read is previous write => wait
							if (instruction_decoded = '1' or instruction_done = '0') and latched_instruction_done = '0' then -- if it didnt decode an operation last cycle and an instruction is done we dont need to wait
								instruction_decoded <= '0';
								wait_finish_write_operation <= '1';
							end if;
						end if;
						write_operation <= '1';
						
					when "0100011" => -- S-type
						immediate(11 downto 0) <= v_current_instruction(31 downto 25) & v_current_instruction(11 downto 7); 
						if ((to_integer(v_current_instruction(19 downto 15)) = rd or to_integer(v_current_instruction(24 downto 20)) = rd) and write_operation = '1') then -- current read is previous write => wait
							if (instruction_decoded = '1' or instruction_done = '0') and latched_instruction_done = '0' then -- if it didnt decode an operation last cycle and an instruction is done we dont need to wait
								instruction_decoded <= '0';
								wait_finish_write_operation <= '1';
							end if;
						end if;
						write_operation <= '0';
					
					when "0010011" => -- I-type
						immediate(11 downto 0) <= v_current_instruction(31 downto 20);
						if (to_integer(v_current_instruction(19 downto 15)) = rd and write_operation = '1') then -- current read is previous write => wait
							if (instruction_decoded = '1' or instruction_done = '0') and latched_instruction_done = '0' then -- if it didnt decode an operation last cycle and an instruction is done we dont need to wait
								instruction_decoded <= '0';
								wait_finish_write_operation <= '1';
							end if;
						end if;
						write_operation <= '1';
					
					when "0110011" => -- R-type
						immediate(6 downto 0) <= v_current_instruction(31 downto 25);
						if ((to_integer(v_current_instruction(19 downto 15)) = rd or to_integer(v_current_instruction(24 downto 20)) = rd) and write_operation = '1') then -- current read is previous write => wait
							if (instruction_decoded = '1' or instruction_done = '0') and latched_instruction_done = '0' then -- if it didnt decode an operation last cycle and an instruction is done we dont need to wait
								instruction_decoded <= '0';
								wait_finish_write_operation <= '1';
							end if;
						end if;
						write_operation <= '1';
					
					when "1110011" => -- I-type
						immediate(11 downto 0) <= v_current_instruction(31 downto 20);
						write_operation <= '0';
					
					when others =>
						write_operation <= '0';
						-- maybe should set instruction decoded to '0' or return control? 
						null;
				end case;
						
			elsif instruction_jump = '1' then
				instruction_upper(0) <= jmp_addr(2);
				instruction_decoded <= '0';
				instruction_jumped <= '1';
			elsif wait_finish_write_operation = '1' then
				rs1_val <= registers(to_integer(v_current_instruction(19 downto 15)));
				rs2_val <= registers(to_integer(v_current_instruction(24 downto 20)));
				
				if instruction_done = '1' then
					instruction_decoded <= '1';
					wait_finish_write_operation <= '0';
				end if;
				
			else -- waiting cause of fetch or multi cycle
				instruction_decoded <= '0';
				if (next_instruction_valid = '0' and instruction_ready = '0') then -- waiting on fetch process
					wait_instruction_ready <= '1';
				end if;
			end if;
		else 
			instruction_decoded <= '0';
		end if; -- reset
	end if; -- clk'rising_edge
end process;

Instructions_Execute_Proc : process (i_Clk)
	variable v_dm_addr : std_logic_vector(31 downto 0) := (others => '0');
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
		instruction_done <= '0';
		v_return_ctrl_logic_unit := '0';
		o_Return_Ctrl_Logic_Unit <= '0';
		instruction_multicycle <= '0';
		
		if instruction_decoded = '1' and instruction_multicycle = '0' and instruction_jump = '0' then
			latched_opcode <= opcode;
			latched_func3 <= func3;
			latched_immediate <= immediate;
			latched_rd <= rd;
			latched_rs2 <= rs2;
			latched_rs1 <= rs1;
			latched_rs1_val <= rs1_val;
			latched_rs2_val <= rs2_val;
			latched_current_pc <= current_pc;
			
			case opcode is --opcode
				
				when "0110111" => -- lui
					registers(rd) <= immediate(19 downto 0) & "000000000000";
					instruction_done <= '1';
				
				when "0010111" => -- auipc
					registers(rd) <= current_pc + (immediate(19 downto 0) & "000000000000");
					instruction_done <= '1';
				
				when "1101111" => -- jal
					registers(rd) <= current_pc + 4;
					jmp_addr <= unsigned(resize(signed(immediate(20 downto 0)), current_pc'length));
					instruction_multicycle <= '1';
				
				when "1100111" => -- jalr
					registers(rd) <= current_pc + 4;
					jmp_addr <= unsigned(resize(signed(immediate(11 downto 0)), current_pc'length));
					instruction_multicycle <= '1';
				
				when "1100011" => -- B-type
					case func3 is -- func3
						
						when "000" => -- beq
							if rs1_val = rs2_val then
								jmp_addr <= unsigned(resize(signed(immediate(12 downto 0)), current_pc'length));
								instruction_multicycle <= '1';
							else
								instruction_done <= '1';
							end if;
							
								
						when "001" => -- bne
							if rs1_val /= rs2_val then
								jmp_addr <= unsigned(resize(signed(immediate(12 downto 0)), current_pc'length));
								instruction_multicycle <= '1';
							else
								instruction_done <= '1';
							end if;
						
						when "100" => -- blt
							if signed(rs1_val) < signed(rs2_val) then
								jmp_addr <= unsigned(resize(signed(immediate(12 downto 0)), current_pc'length));
								instruction_multicycle <= '1';
							else
								instruction_done <= '1';
							end if;
						
						when "101" => -- bge
							if signed(rs1_val) >= signed(rs2_val) then
								jmp_addr <= unsigned(resize(signed(immediate(12 downto 0)), current_pc'length));
								instruction_multicycle <= '1';
							else
								instruction_done <= '1';
							end if;
							
						when "110" => -- bltu
							if unsigned(rs1_val) < unsigned(rs2_val) then
								jmp_addr <= unsigned(resize(signed(immediate(12 downto 0)), current_pc'length));
								instruction_multicycle <= '1';
							else
								instruction_done <= '1';
							end if;
						
						when "111" => -- bgeu
							if unsigned(rs1_val) >= unsigned(rs2_val) then
								jmp_addr <= unsigned(resize(signed(immediate(12 downto 0)), current_pc'length));
								instruction_multicycle <= '1';
							else
								instruction_done <= '1';
							end if;
						
						when others =>
							null;
							instruction_done <= '1';
							
					end case;
				
				--TODO important in memory access all writes must have completed bevore a read access can occur
				when "0000011" => -- I-type
					case func3 is -- func3
						
						when "000" => -- lb
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), dm_addr'length));
							dm_addr <= std_logic_vector(rs1_val + v_immediate);
							o_DM_DV <= '1';
							instruction_multicycle <= '1';
						
						when "001" => -- lh
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), dm_addr'length));
							dm_addr <= std_logic_vector(rs1_val + v_immediate);
							o_DM_DV <= '1';
							instruction_multicycle <= '1';
							
						when "010" => -- lw
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), dm_addr'length));
							dm_addr <= std_logic_vector(rs1_val + v_immediate);
							o_DM_DV <= '1';
							instruction_multicycle <= '1';
						
						when "100" => -- lbu
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), dm_addr'length));
							dm_addr <= std_logic_vector(rs1_val + v_immediate);
							o_DM_DV <= '1';
							instruction_multicycle <= '1';
						
						when "101" => -- lhu
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), dm_addr'length));
							dm_addr <= std_logic_vector(rs1_val + v_immediate);
							o_DM_DV <= '1';
							instruction_multicycle <= '1';
						
						when others =>
							null;
							instruction_done <= '1';
					end case;
					
				when "0100011" => -- S-type
					case func3 is -- func3
						
						when "000" => -- sb
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), dm_addr'length));
							v_dm_addr := std_logic_vector(v_immediate + rs1_val);
							dm_addr <= v_dm_addr;
							v_dm_write_data_bytes(to_integer(unsigned(v_dm_addr(1 downto 0))))(7 downto 0) := std_logic_vector(rs2_val(7 downto 0));  
							o_DM_Data(7 downto 0) <= v_dm_write_data_bytes(0); 
							o_DM_Data(15 downto 8) <= v_dm_write_data_bytes(1); 
							o_DM_Data(23 downto 16) <= v_dm_write_data_bytes(2); 
							o_DM_Data(31 downto 24) <= v_dm_write_data_bytes(3);
							o_DM_Wr_En(to_integer(unsigned(v_dm_addr(1 downto 0)))) <= '1';
							o_DM_DV <= '1';	
							instruction_done <= '1';
							
						when "001" => -- sh
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), dm_addr'length));
							v_dm_addr := std_logic_vector(v_immediate + rs1_val);
							dm_addr <= v_dm_addr;
							v_dm_write_data_2bytes(to_integer(unsigned(v_dm_addr(1 downto 1))))(15 downto 0) := std_logic_vector(rs2_val(15 downto 0));  
							o_DM_Data(15 downto 0) <= v_dm_write_data_2bytes(0);
							o_DM_Data(31 downto 16) <= v_dm_write_data_2bytes(1);
							if (v_dm_addr(1) = '1') then
								o_DM_Wr_En <= "1100";
							else
								o_DM_Wr_En <= "0011";
							end if;
							o_DM_DV <= '1';	
							instruction_done <= '1';
							
						when "010" => -- sw
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), dm_addr'length));
							dm_addr <= std_logic_vector(v_immediate + rs1_val);
							o_DM_Data <= std_logic_vector(rs2_val(31 downto 0));  
							o_DM_Wr_En(3 downto 0) <= "1111";
							o_DM_DV <= '1';	
							instruction_done <= '1';
						
						when others =>
							null;
							instruction_done <= '1';
					end case;
				
				when "0010011" => -- I-type
					case func3 is -- func3
						
						when "000" => -- addi
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), registers(0)'length));
							registers(rd) <= v_immediate + rs1_val;
							instruction_done <= '1';
							
						when "010" => -- slti
							registers(rd)(31 downto 0) <= (others => '0');
							if signed(rs1_val) < signed(immediate(11 downto 0)) then
								registers(rd)(0) <= '1'; 
							end if;
							instruction_done <= '1';
							
						when "011" => -- sltiu
							registers(rd)(31 downto 0) <= (others => '0');
							if rs1_val < immediate(11 downto 0) then
								registers(rd)(0) <= '1'; 
							end if;
							instruction_done <= '1';
							
						when "100" => -- xori
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), registers(0)'length));
							registers(rd) <= rs1_val xor v_immediate;
							instruction_done <= '1';
						
						when "110" => -- ori
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), registers(0)'length));
							registers(rd) <= rs1_val or v_immediate;
							instruction_done <= '1';
						
						when "111" => -- andi
							v_immediate := unsigned(resize(signed(immediate(11 downto 0)), registers(0)'length));
							registers(rd) <= rs1_val and v_immediate;
							instruction_done <= '1';
						
						when "001" => -- slli
							registers(rd)(31 downto 0) <= shift_left(rs1_val, to_integer(immediate(4 downto 0)));
							instruction_done <= '1';
						
						when "101" => -- srli/srai
							if immediate(10) = '0' then -- srli
								registers(rd)(31 downto 0) <= shift_right(rs1_val, to_integer(immediate(4 downto 0)));	
							else	-- srai
								registers(rd)(31 downto 0) <= unsigned(shift_right(signed(rs1_val), to_integer(immediate(4 downto 0))));
							end if;			
							instruction_done <= '1';
							
						when others =>
							null;
							instruction_done <= '1';
					
					end case;
						
				when "0110011" => -- R-type
					case func3 is -- func3
						
						when "000" => -- add/sub
							if immediate(5) = '0' then
								registers(rd) <= rs1_val + rs2_val;
							else
								registers(rd) <= rs1_val - rs2_val;
							end if;
							--b_add <= std_logic_vector(rs2_val);
							
							instruction_done <= '1';
							
						when "001" => -- sll
							registers(rd)(31 downto 0) <= shift_left(rs1_val, to_integer(rs2_val(4 downto 0)));
							instruction_done <= '1';
						
						when "010" => -- slt
							registers(rd)(31 downto 0) <= (others => '0');
							if signed(rs1_val) < signed(rs2_val) then
								registers(rd)(0) <= '1'; 
							end if;
							instruction_done <= '1';
							
						when "011" => -- sltu
							registers(rd)(31 downto 0) <= (others => '0');
							if unsigned(rs1_val) < unsigned(rs2_val) then
								registers(rd)(0) <= '1'; 
							end if;
							instruction_done <= '1';
							
						when "100" => -- xor
							registers(rd) <= rs1_val xor rs2_val;
							instruction_done <= '1';
							
						when "101" => -- srl/sra
							if immediate(5) = '0' then -- srl
								registers(rd)(31 downto 0) <= shift_right(rs1_val, to_integer(rs2_val(4 downto 0)));
							else	-- sra
								registers(rd)(31 downto 0) <= unsigned(shift_right(signed(rs1_val), to_integer(rs2_val(4 downto 0))));	
							end if;
							instruction_done <= '1';
							
						when "110" => -- or
							registers(rd) <= rs1_val or rs2_val;
							instruction_done <= '1';
							
						when "111" => -- and
							registers(rd) <= rs1_val and rs2_val;
							instruction_done <= '1';
							
						when others => 
							null;
							instruction_done <= '1';
						
					end case;
				
				when "1110011" => -- I-type
					if immediate(0) = '1' then -- ebreak;
						v_return_ctrl_logic_unit := '1';
						instruction_done <= '1';
					else -- ecall
						null;
						instruction_done <= '1';
					end if;
				when others => 
					null;
					instruction_done <= '1';
			end case;
		
		elsif instruction_multicycle = '1' then
			
			case latched_opcode is --opcode
				
				when "0110111" => -- lui
					null;
				
				when "0010111" => -- auipc
					null;
				
				when "1101111" => -- jal
					jmp_addr <= jmp_addr + latched_current_pc;
					instruction_jump <= '1';
					instruction_done <= '1';
				
				when "1100111" => -- jalr
					jmp_addr <= jmp_addr + latched_rs1_val;
					-- current_pc(0) has to be 0
					jmp_addr(0) <= '0';
					instruction_jump <= '1';
					instruction_done <= '1';
				
				when "1100011" => -- B-type
					--all B-type jmp instructions are built the same
					jmp_addr <= latched_current_pc + jmp_addr;
					instruction_jump <= '1';
					instruction_done <= '1';
					--case func3 is -- func3
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
					--		--instruction_done <= '1';
					--		
					--end case;
				
				when "0000011" => -- I-type
					case latched_func3 is -- func3
						
						when "000" => -- lb
							if i_DM_DV = '1' then
								registers(latched_rd) <= unsigned(resize(signed(dm_read_data_bytes(to_integer(unsigned(dm_addr(1 downto 0))))), registers(0)'length));
								instruction_done <= '1';
							else
								instruction_multicycle <= '1'; -- wait until load complete
							end if;
						
						when "001" => -- lh
							if i_DM_DV = '1' then
								registers(latched_rd) <= unsigned(resize(signed(dm_read_data_2bytes(to_integer(unsigned(dm_addr(1 downto 1))))), registers(0)'length));
								instruction_done <= '1';
							else
								instruction_multicycle <= '1'; -- wait until load complete
							end if;
							
						when "010" => -- lw
							if i_DM_DV = '1' then
								registers(latched_rd) <= unsigned(i_DM_Data);
								instruction_done <= '1';
							else
								instruction_multicycle <= '1'; -- wait until load complete
							end if;
						
						when "100" => -- lbu
							if i_DM_DV = '1' then
								registers(latched_rd) <= resize(unsigned(dm_read_data_bytes(to_integer(unsigned(dm_addr(1 downto 0))))), registers(0)'length);
								instruction_done <= '1';
							else
								instruction_multicycle <= '1'; -- wait until load complete
							end if;
						
						when "101" => -- lhu
							if i_DM_DV = '1' then
								registers(latched_rd) <= resize(unsigned(dm_read_data_2bytes(to_integer(unsigned(dm_addr(1 downto 1))))), registers(0)'length);
								instruction_done <= '1';
							else
								instruction_multicycle <= '1'; -- wait until load complete
							end if;
						
						when others =>
							null;
							--instruction_done <= '1';
					end case;
					
				when "0100011" => -- S-type
					case latched_func3 is -- func3
						
						when "000" => -- sb
							null;
							
						when "001" => -- sh
							null;
							
						when "010" => -- sw
							null;
						
						when others =>
							null;
							--instruction_done <= '1';
					end case;
				
				when "0010011" => -- I-type
					case latched_func3 is -- func3
						
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
							--instruction_done <= '1';
					
					end case;
						
				when "0110011" => -- R-type
					case latched_func3 is -- func3
						
						when "000" => -- add/sub
							null;
							
						
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
							--instruction_done <= '1';
						
					end case;
				
				when "1110011" => -- I-type
					null;
				when others => 
					null;
					--instruction_done <= '1';
			end case;
		end if; -- instruction_multicycle / instruction_decoded
		
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
