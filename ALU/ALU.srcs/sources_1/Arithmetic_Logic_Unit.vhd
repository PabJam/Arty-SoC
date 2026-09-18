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

	component muldiv 
		port (
			i_Clk    : in  std_logic;
			i_Rst    : in  std_logic;                    -- active high, synchronous
			i_Start  : in  std_logic;                    -- one cycle pulse
			i_Func3  : in  unsigned(2 downto 0);
			i_A      : in  unsigned(31 downto 0);        -- rs1
			i_B      : in  unsigned(31 downto 0);        -- rs2
			o_Result : out unsigned(31 downto 0);
			o_Done   : out std_logic
		);
	end component;

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
	--
	-- Whole 64 bit words are buffered. decode takes the
	-- whole word with a 1 bit index to pick the lower/upper 32bit instruction
	--
	-- The buffer doubles as a loop cache. A taken backward branch whose target
	-- is still held there needs no refetch at all! decode just moves its read
	-- pointer back.
	constant C_IF_WIDTH : natural := 3;              -- 8 words = 16 instructions
	constant C_IF_DEPTH : natural := 2**C_IF_WIDTH;
	-- imm(31 downto 7) all ones means a backward offset of at most 128 bytes,
	-- which is the most an 8 word buffer could possibly hold
	constant C_IMM_FAR : unsigned(24 downto 0) := (others => '1');

	type t_if_entry is record
		word : std_logic_vector(63 downto 0);
		base_pc : unsigned(31 downto 0);             -- pc of instruction 0 of the word
	end record;
	type t_if_array is array (0 to C_IF_DEPTH - 1) of t_if_entry;

	-- Instruction Fetch Queue
	signal ifq : t_if_array;
	signal ifq_wr : unsigned(C_IF_WIDTH downto 0) := (others => '0'); -- fetch owns
	signal ifq_rd : unsigned(C_IF_WIDTH downto 0) := (others => '0'); -- decode owns
	signal ifq_idx : unsigned(0 downto 0) := (others => '0');         -- decode bit to decide between lower/upper instruction
	signal ifq_empty : std_logic;
	signal ifq_room : std_logic;

	signal pc_fetch : unsigned(31 downto 0) := (others => '0');

	-- set by decode when it rewinds into the ifq buffer. Fetch stops while it is
	-- high, because every instruction the loop needs is already held and any
	-- further fetching would overwrite it.
	signal loop_mode : std_logic := '0';

	-- words pushed since the last flush. Tells the
	-- rewind whether the slot it wants to jump back to has actually been
	-- written yet, which matters for the first iteration of a loop.
	signal ifq_filled : unsigned(C_IF_WIDTH downto 0) := (others => '0');

	-- return address stack
	--
	-- jalr cannot be predicted from the
	-- instruction itself, because its target is in a register. Calls and
	-- returns nest, so the target of a return is almost always the address
	-- pushed by the matching call.
	--
	-- The stack is an array and a pointer. So a wrong prediction can be reversed
	-- and does not destroy the whole stack. For example a forward branch is never 
	-- predicted to be taken so a structure with different return paths:
	-- fib: slti a5, a0, 2
    --      beq  a5, x0, +8     <- forward branch, prediction: not taken
    -- 		ret                 <- fib+8
    -- 		addi sp, sp, -16    <- fib+12, the recursive path
    -- 		...
    -- 		ret                 <- the real return for this path
	-- would always assume the first return is taken and with an array the return address is not lost 
	-- and can be restored when execute signals that the prediction was wrong.
	-- ras_sp is the speculative pointer, ras_sp_commit tracks if execute actually pushed/poped 
	-- an address. A flush restores the speculative from the commit, which undoes every
	-- wrong path push and pop in a single assignment.
	constant C_RAS_WIDTH : natural := 3;
	type t_ras is array (0 to 2**C_RAS_WIDTH - 1) of unsigned(31 downto 0);
	signal ras : t_ras := (others => (others => '0'));
	signal ras_sp : unsigned(C_RAS_WIDTH - 1 downto 0) := (others => '0');
	signal ras_sp_commit : unsigned(C_RAS_WIDTH - 1 downto 0) := (others => '0');
	signal ras_top : unsigned(31 downto 0) := (others => '0'); -- registerd, so the ras does not need to be indexed behind alot of conditional logic
	
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
		-- what the decode stage guessed for this instruction, so execute knows
		-- what it is comparing against. Only ever set for backwards branches (likely loops) and jal.
		predicted_taken : std_logic;
		-- what the return address stack supplied for a jalr. Execute compares
		-- the real rs1 + imm against it and only redirects when they differ.
		pred_addr : unsigned(31 downto 0);
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
		pc => (others => '0'),
		predicted_taken => '0',
		pred_addr => (others => '0')
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

	-- decode stage branch prediction. predict_jump redirects the fetch stage
	-- instruction_jump from execute always overrides it.
	signal predict_jump : std_logic := '0';
	signal predict_addr : unsigned(31 downto 0) := (others => '0');

	signal mem_pending : std_logic := '0';
	signal mem_is_load : std_logic := '0';
	signal load_rd : natural range 0 to 31 := 0;
	signal load_func3 : unsigned(2 downto 0) := (others => '0');
	signal load_addr_lsb : unsigned(1 downto 0) := (others => '0');

	-- multi cycle execute units
	signal exec_pending : std_logic := '0';
	signal exec_start : std_logic := '0';
	signal exec_func3 : unsigned(2 downto 0) := (others => '0');
	signal exec_a : unsigned(31 downto 0) := (others => '0');
	signal exec_b : unsigned(31 downto 0) := (others => '0');
	signal exec_rd : natural range 0 to 31 := 0;
	signal exec_result : unsigned(31 downto 0);
	signal exec_done : std_logic;

begin

	inst_muldiv : muldiv
	port map
	(
		i_Clk => i_Clk,
		i_Rst => not i_Sync_nRst,     -- takes active high reset
		i_Start => exec_start,
		i_Func3 => exec_func3,
		i_A => exec_a,
		i_B => exec_b,
		o_Result => exec_result,
		o_Done => exec_done
	);

	dm_read_data_bytes(0) <= i_DM_Data(7 downto 0);
	dm_read_data_bytes(1) <= i_DM_Data(15 downto 8);
	dm_read_data_bytes(2) <= i_DM_Data(23 downto 16);
	dm_read_data_bytes(3) <= i_DM_Data(31 downto 24);
 
	dm_read_data_2bytes(0) <= i_DM_Data(15 downto 0);
	dm_read_data_2bytes(1) <= i_DM_Data(31 downto 16);

	o_DM_Addr <= dm_addr;
	
	-- same read/write pointer => empty
	-- same read/write pointer with different msb => full
	ifq_empty <= '1' when ifq_wr = ifq_rd else '0';
	-- leave a slot spare so a push that is already committed always has room
	ifq_room <= '1' when (ifq_wr - ifq_rd) < (C_IF_DEPTH - 1) else '0';

	iq_empty <= '1' when iq_wr_ptr = iq_rd_ptr else '0';
	iq_full <= '1' when (iq_wr_ptr(C_IQ_WIDTH) /= iq_rd_ptr(C_IQ_WIDTH)) and 
		(iq_wr_ptr(C_IQ_WIDTH - 1 downto 0) = iq_rd_ptr(C_IQ_WIDTH - 1 downto 0))
		else '0';

	-- fetch stage
	--
	-- fetches two instructions at once and writes them to the ifq 
	Instruction_Fetch_Proc : process(i_Clk)
		variable v_target : unsigned(31 downto 0);
		variable v_next : unsigned(31 downto 0);
	begin
		if rising_edge(i_Clk) then
			if (i_Sync_nRst = '0') then
				pc_fetch <= (others => '0');
				ifq_wr <= (others => '0');
				o_PM_Addr <= (others => '0');
				ifq_filled <= (others => '0');

			elsif ctrl_arithmetic_logic_unit = '1' and i_Take_Ctrl_ALU = '0' then

				-- a correction from execute always beats a guess from decode
				if instruction_jump = '1' or predict_jump = '1' then
					if instruction_jump = '1' then
						v_target := jmp_addr;
					else
						v_target := predict_addr;
					end if;
					-- Everything buffered is on the not taken path so it needs to be flushed.
					-- ifq_filled is cleared so a potential loopback does not target invalid instructions
					pc_fetch <= v_target(31 downto 3) & "000";
					o_PM_Addr <= std_logic_vector(v_target(16 downto 3));
					ifq_wr <= (others => '0');
					ifq_filled <= (others => '0');

				elsif loop_mode = '1' then
					-- the loop is entirely inside the buffer, fetching would only
					-- overwrite instructions decode still needs
					null;

				elsif i_PM_DV = '1' and ifq_room = '1' then
					ifq(to_integer(ifq_wr(C_IF_WIDTH - 1 downto 0))).word <= i_PM_Data;
					ifq(to_integer(ifq_wr(C_IF_WIDTH - 1 downto 0))).base_pc <= pc_fetch;
					ifq_wr <= ifq_wr + 1;
					if ifq_filled < C_IF_DEPTH then
						ifq_filled <= ifq_filled + 1;
					end if;

					v_next := pc_fetch + 8;
					pc_fetch <= v_next;
					o_PM_Addr <= std_logic_vector(v_next(16 downto 3));
				end if;
			end if;
		end if;
	end process;

	-- decode stage
	instruction_Decode_Proc : process (i_Clk)
		variable v_instruction : unsigned(31 downto 0);
		variable v_decoded : t_decoded;
		variable v_immediate_i : signed(11 downto 0);
		variable v_immediate_s : signed(11 downto 0);
		variable v_immediate_b : signed(12 downto 0);
		variable v_immediate_j : signed(20 downto 0);
		variable v_predict : boolean;
		variable v_backward : boolean;
		variable v_is_ret : boolean;
		variable v_target : unsigned(31 downto 0);
		variable v_idx : natural range 0 to 1;
		variable v_ok : boolean;
		variable v_s : signed(9 downto 0);
		variable v_back : natural range 0 to 31;
		variable v_occ : natural range 0 to 2*C_IF_DEPTH;
	begin
		if rising_edge(i_Clk) then
			predict_jump <= '0';

			if (i_Sync_nRst = '0') then
				ifq_rd <= (others => '0');
				ifq_idx <= (others => '0');
				iq_wr_ptr <= (others => '0');
				loop_mode <= '0';

			elsif instruction_jump = '1' then
				-- misprediction, or a jump decode could not predict. Everything
				-- after the branch is wrong, so the decoded queue goes too, and
				-- the return stack winds back to what actually executed.
				ras_sp <= ras_sp_commit;
				ras_top <= ras(to_integer(ras_sp_commit - 1));
				iq_wr_ptr <= (others => '0');
				ifq_rd <= (others => '0');
				ifq_idx <= jmp_addr(2 downto 2);
				loop_mode <= '0';

			elsif predict_jump = '1' then
				-- only the fetch buffer is stale. Instructions already decoded sit
				-- before the branch in program order and stay valid, so the decoded
				-- queue is not flushed here.
				ifq_rd <= (others => '0');
				ifq_idx <= predict_addr(2 downto 2);

			elsif ctrl_arithmetic_logic_unit = '1' and i_Take_Ctrl_ALU = '0' then

				if ifq_empty = '0' and iq_full = '0' then

					v_idx := to_integer(ifq_idx);
					v_instruction := unsigned(ifq(to_integer(ifq_rd(C_IF_WIDTH - 1 downto 0))).word(32*v_idx + 31 downto 32*v_idx));
					v_decoded.pc := ifq(to_integer(ifq_rd(C_IF_WIDTH - 1 downto 0))).base_pc + to_unsigned(4*v_idx, 32);

					if ifq_idx = "1" then
						ifq_idx <= "0";
						ifq_rd <= ifq_rd + 1;
					else
						ifq_idx <= "1";
					end if;

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
					
					-- static branch prediction
					-- A backward conditional branch is essentially always a loop, so
					-- branch predicted. A forward one usually skips an if body, so prediction: branch
					-- not taken, which is what plain sequential fetch already does.
					-- jal is unconditional and can never mispredict.
					-- The target is pc + imm and both are known here.
					v_predict := false;
					v_backward := false;
					v_is_ret := false;
					if v_decoded.opcode = "1100111" and v_decoded.rd = 0
					   and v_decoded.rs1 = 1 then
						-- jalr x0, 0(x1) is the standard return.
						v_is_ret := true;
					end if;

					if v_decoded.opcode = "1101111" and v_decoded.rd = 1 then
						-- a call: push the return address
						ras(to_integer(ras_sp)) <= v_decoded.pc + 4;
						ras_top <= v_decoded.pc + 4;
						ras_sp <= ras_sp + 1;
					elsif v_is_ret then
						-- a return: the entry stays put, only the pointer moves
						ras_sp <= ras_sp - 1;
						ras_top <= ras(to_integer(ras_sp - 2));
					end if;

					if v_is_ret then
						v_decoded.predicted_taken := '1';
						v_decoded.pred_addr := ras_top;
						loop_mode <= '0';
						predict_addr <= ras_top;
						predict_jump <= '1';
					end if;

					if v_decoded.opcode = "1101111" then -- jal
						v_predict := true;
						v_backward := (v_decoded.imm(31) = '1');
					elsif v_decoded.opcode = "1100011" and v_decoded.imm(31) = '1' then -- branch backwards
						v_predict := true;
						v_backward := true;
					end if;

					if v_predict then
						v_target := v_decoded.pc + v_decoded.imm;
						v_decoded.predicted_taken := '1';

						-- loop buffer
						--
						-- Words sit consecutively in the buffer, so the targets
						-- index is just an offset from the current one. With
						--     s = (byte offset of this instruction in its word) + imm
						-- the target word is floor(s/8) words away and the target
						-- instruction is at bit 2 of s mod 8. 
						-- Only meaningful for a backwards target within 128 bytes;
						-- anything further cannot be in an 8 word buffer anyway.
						v_ok := false;
						v_back := 0;
						if v_decoded.imm(31 downto 7) = C_IMM_FAR then -- if the higher bits are all 1 it means the offset is backwards and <= 128byte
							v_s := to_signed(4 * to_integer(ifq_idx), 10) + resize(signed(v_decoded.imm(7 downto 0)), 10);
							-- floor division by 8, so an arithmetic shift
							v_back := to_integer(-shift_right(v_s, 3));
							v_occ := to_integer(ifq_wr - ifq_rd);

							-- the slot must already hold this loop's words, and must
							-- not be the one fetch is about to overwrite
							if v_back >= 1 and (v_occ + v_back) <= (C_IF_DEPTH - 1) and (v_occ + v_back) <= to_integer(ifq_filled) then
								v_ok := true;
							end if;
						end if;

						if v_ok then
							-- rewind: no flush, no refetch, no cost at all
							ifq_rd <= ifq_rd - to_unsigned(v_back, C_IF_WIDTH + 1);
							ifq_idx <= unsigned(std_logic_vector(v_s(2 downto 2)));
							loop_mode <= '1'; -- tells fetch process to stop 
						else
							-- ordinary redirect => flush fetch but not instruction queue
							loop_mode <= '0';
							predict_addr <= v_target;
							predict_jump <= '1';
						end if;
					elsif not v_is_ret then
						v_decoded.predicted_taken := '0';
					end if;

					iq(to_integer(iq_wr_ptr(C_IQ_WIDTH - 1 downto 0))) <= v_decoded;
					iq_wr_ptr <= iq_wr_ptr + 1;

				end if;
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
		variable v_wr_rd : natural range 0 to 31;
		variable v_mem_busy : std_logic;
		variable v_is_mem : boolean;
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
			v_wr_rd := 0;
			v_result := (others => '0');
			exec_start <= '0';
			
			if (i_Sync_nRst = '0') then
				ras_sp_commit <= (others => '0');
				iq_rd_ptr <= (others => '0');
				mem_pending <= '0';
				mem_is_load <= '0';
				exec_pending <= '0';
				ctrl_arithmetic_logic_unit <= '0';
			else
			
				v_mem_busy := mem_pending;

				if mem_pending = '1' and i_DM_DV = '1' then
					v_mem_busy := '0';
					if mem_is_load = '1' then
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
						v_wr_en := true;
						v_wr_rd := load_rd;
					end if;
					mem_pending <= '0';
				end if;

				-- multi cycle execute unit completion
				if exec_pending = '1' and exec_done = '1' then
					v_result := exec_result;
					v_wr_en := true;
					v_wr_rd := exec_rd;
					exec_pending <= '0';
				end if;

				if (mem_pending = '1' and mem_is_load = '1') or exec_pending = '1' then
					-- A pending load blocks everything! Includes the completion cycle, because the
					-- writeback owns the single write port.
					null;

				-- instruction queue flushed after jumped
				elsif instruction_jump = '1' then
					iq_rd_ptr <= (others => '0');

				elsif ctrl_arithmetic_logic_unit = '1' and i_Take_Ctrl_ALU = '0' and iq_empty = '0' then

					v_execute := iq(to_integer(iq_rd_ptr(C_IQ_WIDTH - 1 downto 0)));
					v_is_mem  := (v_execute.opcode = "0000011") or (v_execute.opcode = "0100011");

					if v_is_mem and v_mem_busy = '1' then
						-- A pending store writes no register, so only another
						-- memory op has to wait for it.
						null;
					else
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
								if v_execute.rd = 1 then
									ras_sp_commit <= ras_sp_commit + 1;
								end if;
								
								-- should never be '0' since jal always predicts but to be safe
								if v_execute.predicted_taken = '0' then
									jmp_addr         <= v_execute.pc + v_execute.imm;
									instruction_jump <= '1';
								end if;
	
							when "1100111" =>   -- jalr
								v_result := v_execute.pc + 4;
								v_wr_en  := true;
								v_addr    := v_rs1 + v_execute.imm;
								v_addr(0) := '0';
								if v_execute.rd = 0 and v_execute.rs1 = 1 then
									ras_sp_commit <= ras_sp_commit - 1;
								end if;
								-- the return stack may already have sent fetch to the
								-- right place, in which case there is nothing to correct
								if not (v_execute.predicted_taken = '1' and v_addr = v_execute.pred_addr) then
									jmp_addr         <= v_addr;
									instruction_jump <= '1';
								end if;
	
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
								-- Only redirect when reality disagrees with the prediction
								if v_branch /= (v_execute.predicted_taken = '1') then
									if v_branch then
										jmp_addr <= v_execute.pc + v_execute.imm;
									else
										jmp_addr <= v_execute.pc + 4;
									end if;
									instruction_jump <= '1';
								end if;
	
							when "0000011" =>   -- I-type / loads
								v_addr := v_rs1 + v_execute.imm;
								dm_addr       <= std_logic_vector(v_addr);
								load_addr_lsb <= v_addr(1 downto 0);
								load_rd       <= v_execute.rd;
								load_func3    <= v_execute.func3;
								o_DM_DV       <= '1';
								mem_pending   <= '1';
								mem_is_load   <= '1';
	
							when "0100011" =>   -- S-type / stores
								v_addr  := v_rs1 + v_execute.imm;
								dm_addr <= std_logic_vector(v_addr);
								o_DM_DV <= '1';
								mem_pending <= '1';        
								mem_is_load <= '0';       
								
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
										o_DM_DV     <= '0';
										mem_pending <= '0'; -- malformed store, don't stall
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
								if v_execute.func7 = "0000001" then   -- RV32M
									exec_start <= '1';
									exec_func3 <= v_execute.func3;
									exec_a <= v_rs1;
									exec_b <= v_rs2;
									exec_rd <= v_execute.rd;
									exec_pending <= '1';
								else
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
								end if;
							
							when "1110011" =>   -- I-type / system
								if v_execute.imm(0) = '1' then -- ebreak
									v_return_ctrl := '1';
								end if;
	
							when others =>
								null;
					
						end case;

						v_wr_rd := v_execute.rd;
					end if;
				end if;

				-- single write port!!! lets vivado infere distributed RAM for registers
				-- r0 is not overwritten but just never re assigned
				if v_wr_en and v_wr_rd /= 0 then
					registers(v_wr_rd) <= v_result;
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