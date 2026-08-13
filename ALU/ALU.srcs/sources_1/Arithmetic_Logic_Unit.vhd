----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2025 14:33:54
-- Design Name: 
-- Module Name: Arithmetic_Logic_Unit - Behavioral
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

entity Arithmetic_Logic_Unit is
	Port
	(
		i_Clk : in std_logic;
		i_Sync_nRst : in std_logic;
		i_Give_Ctrl_ALU : in std_logic;
		i_Take_Ctrl_ALU : in std_logic;
		o_Return_Ctrl_ALU : out std_logic;
		o_PM_Addr : out std_logic_vector(13 downto 0);
		i_PM_Data : in std_logic_vector(63 downto 0);
		i_PM_DV : in std_logic;
		o_DM_Addr : out std_logic_vector(31 downto 0);
		o_DM_Data : out std_logic_vector(31 downto 0);
		o_DM_Wr_En : out std_logic_vector(3 downto 0);
		o_DM_DV : out std_logic;
		i_DM_Data : in std_logic_vector(31 downto 0);
		i_DM_DV : in std_logic
	);
end Arithmetic_Logic_Unit;

architecture Behavioral of Arithmetic_Logic_Unit is

	-- registers
	type t_reg_array is array(natural range 0 to 31) of unsigned(31 downto 0);
	signal registers : t_reg_array := (others => (others => '0'));

	-- data memory helpers
	type t_byte_array_32 is array(0 to 3) of std_logic_vector(7 downto 0);
	type t_2byte_array_32 is array(0 to 1) of std_logic_vector(15 downto 0);
	signal dm_read_data_bytes : t_byte_array_32;
	signal dm_read_data_2bytes : t_2byte_array_32;
	signal dm_addr : std_logic_vector(31 downto 0);

	-- fetch stage
	type t_fetch_states is (fetch_state_idle, fetch_state_next, fetch_state_next_2);
	signal fetch_state : t_fetch_states := fetch_state_next;

	type t_pm_fetch_array is array(0 to 3) of unsigned(31 downto 0);
	type t_2_u32 is array(0 to 1) of unsigned(31 downto 0);

	signal pc : t_2_u32;
	signal pc_fetch : t_pm_fetch_array;
	signal instruction_fetch : t_pm_fetch_array;
	signal instruction_ready : std_logic := '0';
	signal instruction_read : std_logic := '0';
	
	-- decode stage
	signal instruction_upper : unsigned(0 downto 0) := (others => '0');
	signal next_instruction : unsigned(31 downto 0) := (others => '0');
	signal next_pc : unsigned(31 downto 0) := (others => '0');
	signal next_instruction_valid : std_logic := '0';
	signal instruction_jumped : std_logic := '0';
	
	-- decoded instruction queue
	constant C_IQ_WIDTH : natural := 2;
	constant C_IQ_DEPTH : natural := 2**C_IQ_WIDTH;
	
	type t_decoded is record
		opcode : unsigned(6 downto 0);
		func3 : unsigned(2 downto 0);
		func7 : unsigned(6 downto 0);
		rs1 : natural range 0 to 31;
		rs2 : natural range 0 to 31;
		rd : natural range 0 to 31;
		imm : unsigned(31 downto 0);
		pc : unsigned(31 downto 0);
	end record;
	
	constant C_DECODED_RST : t_decoded := 
	(
		opcode => (others => '0'),
		func3 => (others => '0'),
		func7 => (others => '0'),
		rs1 => 0,
		rs2 => 0,
		rd => 0,
		imm => (others => '0'),
		pc => (others => '0')
	);
	
	-- fifo to queue instructions
	type t_iq_array is array (0 to C_IQ_DEPTH - 1) of t_decoded;
	signal iq : t_iq_array := (others => C_DECODED_RST);
	-- msb is used to track loops so full & empty can be differentiated
	signal iq_wr_ptr : unsigned(C_IQ_WIDTH downto 0) := (others => '0'); 
	signal iq_rd_ptr : unsigned(C_IQ_WIDTH downto 0) := (others => '0');
	signal iq_empty : std_logic;
	signal iq_full : std_logic;
	
	-- execute stage
	signal ctrl_arithmetic_logic_unit : std_logic := '0';
	signal jmp_addr : unsigned(31 downto 0);
	signal instruction_jump : std_logic := '0';

	signal load_pending : std_logic := '0';
	signal load_rd : natural range 0 to 31 := 0;
	signal load_func3 : unsigned(2 downto 0) := (others => '0');
	signal load_addr_lsb : unsigned(1 downto 0) := (others => '0');

begin

	dm_read_data_bytes(0) <= i_DM_Data(7 downto 0);
	dm_read_data_bytes(1) <= i_DM_Data(15 downto 8);
	dm_read_data_bytes(2) <= i_DM_Data(23 downto 16);
	dm_read_data_bytes(3) <= i_DM_Data(31 downto 24);
 
	dm_read_data_2bytes(0) <= i_DM_Data(15 downto 0);
	dm_read_data_2bytes(1) <= i_DM_Data(31 downto 16);

	o_DM_Addr <= dm_addr;
	
	-- same read/write pointer => empty
	-- same read/write pointer with different msb => full
	iq_empty <= '1' when iq_wr_ptr = iq_rd_ptr else '0';
	iq_full <= '1' when (iq_wr_ptr(C_IQ_WIDTH) /= iq_rd_ptr(C_IQ_WIDTH)) and 
		(iq_wr_ptr(C_IQ_WIDTH - 1 downto 0) = iq_rd_ptr(C_IQ_WIDTH - 1 downto 0))
		else '0';

	-- fetch stage
	Instruction_Fetch_Proc : process(i_Clk)
		variable v_addr_p8 : unsigned(31 downto 0);
	begin
		if rising_edge(i_Clk) then
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
			
			elsif ctrl_arithmetic_logic_unit = '1' and i_Take_Ctrl_ALU = '0' then
				
				if (instruction_jump = '1') then
					o_PM_Addr <= std_logic_vector(jmp_addr(16 downto 3)); -- jmp_addr(2) decides if lower or upper 32bit 
					pc_fetch(0) <= jmp_addr(31 downto 3) & '0' & jmp_addr(1 downto 0);
					pc_fetch(1) <= jmp_addr(31 downto 3) & '1' & jmp_addr(1 downto 0);
					fetch_state <= fetch_state_next;
					instruction_ready <= '0';
				else
					case fetch_state is 
						
						when fetch_state_next =>
							instruction_ready <= '0';
							o_PM_Addr <= std_logic_vector(pc_fetch(0)(16 downto 3));
							if i_PM_DV = '1' then
								instruction_fetch(0) <= unsigned(i_PM_Data(31 downto 0));
								instruction_fetch(1) <= unsigned(i_PM_Data(63 downto 32));
								pc(0) <= pc_fetch(0);
								pc(1) <= pc_fetch(1);
								instruction_ready <= '1';
								v_addr_p8 := pc_fetch(0) + 8;
								o_PM_Addr <= std_logic_vector(v_addr_p8(16 downto 3));	
								pc_fetch(2) <= v_addr_p8;
								pc_fetch(3) <= pc_fetch(1) + 8;
								
								fetch_state <= fetch_state_next_2;
							else
								fetch_state <= fetch_state_next;
							end if;
						
						when fetch_state_next_2 =>
							instruction_ready <= '1';
							o_PM_Addr <= std_logic_vector(pc_fetch(2)(16 downto 3));
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
									o_PM_Addr <= std_logic_vector(v_addr_p8(16 downto 3));
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
								v_addr_p8 := pc_fetch(2) + 8;
								pc_fetch(2) <= v_addr_p8;
								pc_fetch(3) <= pc_fetch(3) + 8;
								o_PM_Addr <= std_logic_vector(v_addr_p8(16 downto 3));
								
								fetch_state <= fetch_state_next_2;
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

	-- decode stage
	instruction_Decode_Proc : process (i_Clk)
		variable v_instruction : unsigned(31 downto 0);
		variable v_decoded : t_decoded;
		variable v_take : boolean;
		variable v_from_pm : boolean;
		variable v_immediate_i : signed(11 downto 0);
		variable v_immediate_s : signed(11 downto 0);
		variable v_immediate_b : signed(12 downto 0);
		variable v_immediate_j : signed(20 downto 0);
	begin
		if rising_edge(i_Clk) then
			instruction_read <= '0';
	
			if (i_Sync_nRst = '0') then
				instruction_upper <= (others => '0');
				next_instruction_valid <= '0';
				instruction_jumped <= '0';
				iq_wr_ptr <= (others => '0');
			
			elsif instruction_jump = '1' then -- flush instruction queue fifo
				iq_wr_ptr <= (others => '0');
				next_instruction_valid <= '0';
				instruction_jumped <= '1';
				instruction_upper(0) <= jmp_addr(2); -- jumped to higher or lower instruction of 64bit block
				
			elsif ctrl_arithmetic_logic_unit = '1' and i_Take_Ctrl_ALU = '0' then
				
				-- take a new instruction from programm memory or nex instruction from instruction fetch
				v_from_pm := (instruction_upper(0) = '0') or (instruction_jumped = '1');
				
				if v_from_pm then
					-- instruction is ready from programm memory and 
					-- no instruction was taken on the previous edge. 
					-- on jump to an upper instruction the instruction_ready is still '1'
					-- even though the lower instruction is the previous instruction and 
					-- not the next in a new 64bit block
					v_take := (instruction_ready = '1') and (instruction_read = '0');
				else
					v_take := (next_instruction_valid = '1');
				end if;
				
				if v_take and iq_full = '0' then
				
					-- next instruction is in lower instruction_fetch dont care if previous jump or not
					if instruction_upper(0) = '0' then 
						v_instruction := instruction_fetch(0);
						v_decoded.pc := pc(0);
						next_instruction <= instruction_fetch(1);
						next_pc <= pc(1);
						next_instruction_valid <= '1';
						instruction_read <= '1';
					-- instruction is on upper instruction_fetch and jumped so not already in next_instruction
					elsif instruction_jumped = '1' then
						v_instruction := instruction_fetch(1);
						v_decoded.pc := pc(1);
						next_instruction_valid <= '0';
						instruction_read <= '1';
					-- upper instruction but no jump before so alredy in next_instruction
					else
						v_instruction := next_instruction;
						v_decoded.pc := next_pc;
						next_instruction_valid <= '0';
					end if;
					
					instruction_jumped <= '0';
					instruction_upper <= not instruction_upper;
					
					v_decoded.opcode := v_instruction(6 downto 0);
					v_decoded.func3 := v_instruction(14 downto 12);
					v_decoded.func7 := v_instruction(31 downto 25);
					v_decoded.rs1 := to_integer(v_instruction(19 downto 15));
					v_decoded.rs2 := to_integer(v_instruction(24 downto 20));
					v_decoded.rd := to_integer(v_instruction(11 downto 7));
					
					v_immediate_i := signed(v_instruction(31 downto 20));
					-- unsigned' needed for ambiguity on & operator of unsigned or std_logic_vector
					-- not needed on b/j because v_instruction(31) dictates type as a single bit
					v_immediate_s := signed(unsigned'(v_instruction(31 downto 25) & v_instruction(11 downto 7)));
					v_immediate_b := signed(v_instruction(31) & v_instruction(7) & v_instruction(30 downto 25) & v_instruction(11 downto 8) & '0');
					v_immediate_j := signed(v_instruction(31) & v_instruction(19 downto 12) & v_instruction(20) & v_instruction(30 downto 21) & '0');
					
					case v_decoded.opcode is 
						-- '|' is the logical or and "or" would be bitwise... 
						when "0110111" | "0010111" => -- lui / auipc (U-type) 
							v_decoded.imm := v_instruction(31 downto 12) & x"000";
						-- immediates are *signed* '0' extendet for every instruction!
						when "1101111" => -- jal (J-type)
							v_decoded.imm := unsigned(resize(v_immediate_j, 32));
						when "1100011" => -- branches (B-type)
							v_decoded.imm := unsigned(resize(v_immediate_b, 32));
						when "0100011" => -- stores (S-type)
							v_decoded.imm := unsigned(resize(v_immediate_s, 32));
						when others => -- I-type / R-type (unused)
							v_decoded.imm := unsigned(resize(v_immediate_i, 32));
					end case;
					
					iq(to_integer(iq_wr_ptr(C_IQ_WIDTH - 1 downto 0))) <= v_decoded;
					iq_wr_ptr <= iq_wr_ptr + 1;
					
				end if; -- v_take and iq_full = '0'
			end if; -- reset
		end if; -- clk'rising_edge
	end process;

	-- execute process
	Instructions_Execute_Proc : process (i_Clk)
		variable v_execute : t_decoded;
		variable v_rs1 : unsigned(31 downto 0);
		variable v_rs2 : unsigned(31 downto 0);
		variable v_addr : unsigned(31 downto 0);
		variable v_result : unsigned(31 downto 0);
		variable v_wr_en : boolean;
		variable v_branch : boolean;
		variable v_return_ctrl : std_logic;
		
	begin
		if rising_edge(i_Clk) then
			o_DM_DV <= '0';
			o_DM_Wr_En <= (others => '0');
			instruction_jump <= '0';
			o_Return_Ctrl_ALU <= '0';
			v_return_ctrl := '0';
			v_wr_en := false;
			v_result := (others => '0');
			
			if (i_Sync_nRst = '0') then
				iq_rd_ptr <= (others => '0');
				load_pending <= '0';
				ctrl_arithmetic_logic_unit <= '0';
			else
			
				if load_pending = '1' then -- waiting for data memory data valid signal on load instruction
					if i_DM_DV = '1' then
						case load_func3 is 
							when "000" => -- lb
								v_result := unsigned(resize(signed(dm_read_data_bytes(to_integer(load_addr_lsb))), 32));
							when "001" => -- lh
								v_result := unsigned(resize(signed(dm_read_data_2bytes(to_integer(load_addr_lsb(1 downto 1)))), 32));
							when "010" => -- lw
								v_result := unsigned(i_DM_Data);
							when "100" => -- lbu
								v_result := resize(unsigned(dm_read_data_bytes(to_integer(load_addr_lsb))), 32);
							when "101" => -- lhu
								v_result := resize(unsigned(dm_read_data_2bytes(to_integer(load_addr_lsb(1 downto 1)))), 32);
							when others =>
								null;
						end case;
						if load_rd /= 0 then
							registers(load_rd) <= v_result;
						end if;
						load_pending <= '0';
					end if;
				
				-- instruction queue flushed after jumped
				elsif instruction_jump = '1' then
					iq_rd_ptr <= (others => '0');
					
				-- normal instruction now everything in one clock cycle
				elsif ctrl_arithmetic_logic_unit = '1' and i_Take_Ctrl_ALU = '0' and iq_empty = '0' then 
				
					v_execute := iq(to_integer(iq_rd_ptr(C_IQ_WIDTH - 1 downto 0)));
					v_rs1 := registers(v_execute.rs1);
					v_rs2 := registers(v_execute.rs2);
					iq_rd_ptr <= iq_rd_ptr + 1;
					
					case v_execute.opcode is 
					
						when "0110111" =>   -- lui
							v_result := v_execute.imm;
							v_wr_en  := true;

						when "0010111" =>   -- auipc
							v_result := v_execute.pc + v_execute.imm;
							v_wr_en  := true;

						when "1101111" =>   -- jal
							v_result := v_execute.pc + 4;
							v_wr_en  := true;
							jmp_addr         <= v_execute.pc + v_execute.imm;
							instruction_jump <= '1';

						when "1100111" =>   -- jalr
							v_result := v_execute.pc + 4;
							v_wr_en  := true;
							v_addr    := v_rs1 + v_execute.imm;
							v_addr(0) := '0';
							jmp_addr         <= v_addr;
							instruction_jump <= '1';

						when "1100011" =>   -- B-type / branches
							case v_execute.func3 is
								when "000"  => v_branch := (v_rs1 = v_rs2);                     -- beq
								when "001"  => v_branch := (v_rs1 /= v_rs2);                    -- bne
								when "100"  => v_branch := (signed(v_rs1) <  signed(v_rs2));    -- blt
								when "101"  => v_branch := (signed(v_rs1) >= signed(v_rs2));    -- bge
								when "110"  => v_branch := (v_rs1 <  v_rs2);                    -- bltu
								when "111"  => v_branch := (v_rs1 >= v_rs2);                    -- bgeu
								when others => v_branch := false;
							end case;
							if v_branch then
								jmp_addr         <= v_execute.pc + v_execute.imm;
								instruction_jump <= '1';
							end if;

						when "0000011" =>   -- I-type / loads
							v_addr := v_rs1 + v_execute.imm;
							dm_addr       <= std_logic_vector(v_addr);
							load_addr_lsb <= v_addr(1 downto 0);
							load_rd       <= v_execute.rd;
							load_func3    <= v_execute.func3;
							o_DM_DV       <= '1';
							load_pending  <= '1';

						when "0100011" =>   -- S-type / stores
							v_addr  := v_rs1 + v_execute.imm;
							dm_addr <= std_logic_vector(v_addr);
							o_DM_DV <= '1';
							case v_execute.func3 is
								when "000" =>   -- sb: replicate the byte, pick the lane
									o_DM_Data <= std_logic_vector(v_rs2(7 downto 0)) &
									             std_logic_vector(v_rs2(7 downto 0)) &
									             std_logic_vector(v_rs2(7 downto 0)) &
									             std_logic_vector(v_rs2(7 downto 0));
									o_DM_Wr_En(to_integer(v_addr(1 downto 0))) <= '1';
								when "001" =>   -- sh
									o_DM_Data <= std_logic_vector(v_rs2(15 downto 0)) &
									             std_logic_vector(v_rs2(15 downto 0));
									if v_addr(1) = '1' then
										o_DM_Wr_En <= "1100";
									else
										o_DM_Wr_En <= "0011";
									end if;
								when "010" =>   -- sw
									o_DM_Data  <= std_logic_vector(v_rs2);
									o_DM_Wr_En <= "1111";
								when others =>
									o_DM_DV <= '0';
							end case;

						when "0010011" =>   -- I-type / operation immediate
							case v_execute.func3 is
								when "000" =>   -- addi
									v_result := v_rs1 + v_execute.imm;
								when "010" =>   -- slti
									if signed(v_rs1) < signed(v_execute.imm) then
										v_result := to_unsigned(1, 32);
									else
										v_result := (others => '0');
									end if;
								when "011" =>   -- sltiu (imm is sign extended, compared unsigned)
									if v_rs1 < v_execute.imm then
										v_result := to_unsigned(1, 32);
									else
										v_result := (others => '0');
									end if;
								when "100" =>   -- xori
									v_result := v_rs1 xor v_execute.imm;
								when "110" =>   -- ori
									v_result := v_rs1 or v_execute.imm;
								when "111" =>   -- andi
									v_result := v_rs1 and v_execute.imm;
								when "001" =>   -- slli
									v_result := shift_left(v_rs1, v_execute.rs2);
								when "101" =>   -- srli / srai
									if v_execute.func7(5) = '0' then
										v_result := shift_right(v_rs1, v_execute.rs2);
									else
										v_result := unsigned(shift_right(signed(v_rs1), v_execute.rs2));
									end if;
								when others =>
									null;
							end case;
							v_wr_en := true;

						when "0110011" =>   -- R-type / operation
							case v_execute.func3 is
								when "000" =>   -- add / sub
									if v_execute.func7(5) = '0' then
										v_result := v_rs1 + v_rs2;
									else
										v_result := v_rs1 - v_rs2;
									end if;
								when "001" =>   -- sll
									v_result := shift_left(v_rs1, to_integer(v_rs2(4 downto 0)));
								when "010" =>   -- slt
									if signed(v_rs1) < signed(v_rs2) then
										v_result := to_unsigned(1, 32);
									else
										v_result := (others => '0');
									end if;
								when "011" =>   -- sltu
									if v_rs1 < v_rs2 then
										v_result := to_unsigned(1, 32);
									else
										v_result := (others => '0');
									end if;
								when "100" =>   -- xor
									v_result := v_rs1 xor v_rs2;
								when "101" =>   -- srl / sra
									if v_execute.func7(5) = '0' then
										v_result := shift_right(v_rs1, to_integer(v_rs2(4 downto 0)));
									else
										v_result := unsigned(shift_right(signed(v_rs1), to_integer(v_rs2(4 downto 0))));
									end if;
								when "110" =>   -- or
									v_result := v_rs1 or v_rs2;
								when "111" =>   -- and
									v_result := v_rs1 and v_rs2;
								when others =>
									null;
							end case;
							v_wr_en := true;

						when "1110011" =>   -- I-type / system
							if v_execute.imm(0) = '1' then -- ebreak
								v_return_ctrl := '1';
							end if;

						when others =>
							null;
					
					end case;
				
					-- single write port!!! lets vivado infere distributed RAM for registers
					-- r0 is not overwritten but just never re assigned
					if v_wr_en and v_execute.rd /= 0 then
						registers(v_execute.rd) <= v_result;
					end if;
				end if;
				
				-- control handover
				
				if i_Give_Ctrl_ALU = '1' then
					ctrl_arithmetic_logic_unit <= '1';
				end if;
				if v_return_ctrl = '1' then
					ctrl_arithmetic_logic_unit <= '0';
					o_Return_Ctrl_ALU <= '1';
				end if;
				if i_Take_Ctrl_ALU = '1' then
					ctrl_arithmetic_logic_unit <= '0';
				end if;
				
			end if; -- reset
		end if; -- clk'rising_edge
	end process;

end Behavioral;
