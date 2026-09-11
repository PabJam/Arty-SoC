----------------------------------------------------------------------------------
-- muldiv - RV32M execution unit
--
-- func3 selects, matching the encoding directly (opcode 0110011, func7 0000001):
--   000 MUL     001 MULH    010 MULHSU   011 MULHU
--   100 DIV     101 DIVU    110 REM      111 REMU
--
-- MUL: one 33x33 signed multiply covers all four variants. Extending each
-- operand to 33 bits - sign extended when that operand is signed, zero
-- extended when unsigned - makes MULH / MULHSU / MULHU the same hardware with
-- different extension. Pipelined 3 deep so Vivado can infer pipelined DSP48s.
--
-- DIV: restoring division, one bit per cycle, 32 iterations. Small in LUTs.
--
-- Latency after i_Start is taken: 3 cycles for MUL, 34 for DIV.
-- o_Done pulses for one cycle with o_Result valid.
--
-- The spec corners are the easy part to get wrong, so they are explicit below:
--   divide by zero   DIV/DIVU -> all ones,  REM/REMU -> the dividend
--   -2**31 / -1      DIV      -> -2**31,    REM      -> 0
-- RISC-V raises no exception for either.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity muldiv is
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
end muldiv;

architecture rtl of muldiv is

	-- ---------------- multiply ----------------
	signal m_a     : signed(32 downto 0) := (others => '0');
	signal m_b     : signed(32 downto 0) := (others => '0');
	signal m_prod  : signed(65 downto 0) := (others => '0');
	signal m_f3_1  : unsigned(2 downto 0) := (others => '0');
	signal m_f3_2  : unsigned(2 downto 0) := (others => '0');
	signal m_vld   : std_logic_vector(2 downto 0) := (others => '0');
	signal m_res   : unsigned(31 downto 0) := (others => '0');

	-- ---------------- divide ----------------
	type t_dstate is (D_IDLE, D_RUN, D_FIX);
	signal d_state  : t_dstate := D_IDLE;
	signal d_num    : unsigned(31 downto 0) := (others => '0');   -- shifting dividend
	signal d_den    : unsigned(31 downto 0) := (others => '0');
	signal d_rem    : unsigned(32 downto 0) := (others => '0');
	signal d_quot   : unsigned(31 downto 0) := (others => '0');
	signal d_cnt    : natural range 0 to 32 := 0;
	signal d_f3     : unsigned(2 downto 0) := (others => '0');
	signal d_neg_q  : std_logic := '0';
	signal d_neg_r  : std_logic := '0';
	signal d_by0    : std_logic := '0';
	signal d_ovf    : std_logic := '0';
	signal d_a_orig : unsigned(31 downto 0) := (others => '0');
	signal d_res    : unsigned(31 downto 0) := (others => '0');
	signal d_done   : std_logic := '0';

	function abs_u (v : unsigned(31 downto 0); is_signed : boolean)
		return unsigned is
	begin
		if is_signed and v(31) = '1' then
			return (not v) + 1;          -- works for -2**31 too: gives 0x80000000
		else
			return v;
		end if;
	end function;

begin

	o_Done   <= m_vld(2) or d_done;
	o_Result <= m_res when m_vld(2) = '1' else d_res;

	----------------------------------------------------------------------------
	-- multiplier: 3 stage pipeline
	----------------------------------------------------------------------------
	Mul_Proc : process (i_Clk)
	begin
		if rising_edge(i_Clk) then
			if i_Rst = '1' then
				m_vld <= (others => '0');
			else
				-- stage 0: extend operands according to the variant
				if i_Start = '1' and i_Func3(2) = '0' then
					case i_Func3 is
						when "011" =>                      -- MULHU: both unsigned
							m_a <= signed('0' & i_A);
							m_b <= signed('0' & i_B);
						when "010" =>                      -- MULHSU: rs1 signed, rs2 unsigned
							m_a <= resize(signed(i_A), 33);
							m_b <= signed('0' & i_B);
						when others =>                     -- MUL, MULH: both signed
							m_a <= resize(signed(i_A), 33);
							m_b <= resize(signed(i_B), 33);
					end case;
					m_f3_1 <= i_Func3;
				end if;

				m_vld <= m_vld(1 downto 0) & (i_Start and not i_Func3(2));

				-- stage 1: the multiply itself
				m_prod <= m_a * m_b;
				m_f3_2 <= m_f3_1;

				-- stage 2: pick low or high word
				if m_f3_2 = "000" then
					m_res <= unsigned(m_prod(31 downto 0));     -- MUL
				else
					m_res <= unsigned(m_prod(63 downto 32));    -- MULH/MULHSU/MULHU
				end if;
			end if;
		end if;
	end process;

	----------------------------------------------------------------------------
	-- divider: restoring, one bit per cycle
	----------------------------------------------------------------------------
	Div_Proc : process (i_Clk)
		variable v_rem : unsigned(32 downto 0);
		variable v_sgn : boolean;
	begin
		if rising_edge(i_Clk) then
			d_done <= '0';

			if i_Rst = '1' then
				d_state <= D_IDLE;
			else
				case d_state is

					when D_IDLE =>
						if i_Start = '1' and i_Func3(2) = '1' then
							v_sgn := (i_Func3(0) = '0');   -- DIV and REM are signed

							d_f3     <= i_Func3;
							d_a_orig <= i_A;
							d_num    <= abs_u(i_A, v_sgn);
							d_den    <= abs_u(i_B, v_sgn);
							d_rem    <= (others => '0');
							d_quot   <= (others => '0');
							d_cnt    <= 0;

							-- quotient is negative when the signs differ,
							-- remainder always takes the sign of the dividend
							if v_sgn then
								d_neg_q <= i_A(31) xor i_B(31);
								d_neg_r <= i_A(31);
							else
								d_neg_q <= '0';
								d_neg_r <= '0';
							end if;

							if i_B = 0 then
								d_by0 <= '1';
							else
								d_by0 <= '0';
							end if;

							if v_sgn and i_A = x"80000000" and i_B = x"FFFFFFFF" then
								d_ovf <= '1';
							else
								d_ovf <= '0';
							end if;

							d_state <= D_RUN;
						end if;

					when D_RUN =>
						if d_by0 = '1' or d_ovf = '1' then
							d_state <= D_FIX;              -- result is fixed, skip the loop
						else
							v_rem := d_rem(31 downto 0) & d_num(31);
							if v_rem >= ('0' & d_den) then
								d_rem  <= v_rem - ('0' & d_den);
								d_quot <= d_quot(30 downto 0) & '1';
							else
								d_rem  <= v_rem;
								d_quot <= d_quot(30 downto 0) & '0';
							end if;
							d_num <= d_num(30 downto 0) & '0';

							if d_cnt = 31 then
								d_state <= D_FIX;
							else
								d_cnt <= d_cnt + 1;
							end if;
						end if;

					when D_FIX =>
						if d_by0 = '1' then
							-- DIV/DIVU -> all ones, REM/REMU -> dividend unchanged
							if d_f3(1) = '0' then
								d_res <= (others => '1');
							else
								d_res <= d_a_orig;
							end if;
						elsif d_ovf = '1' then
							-- -2**31 / -1 : DIV -> -2**31, REM -> 0
							if d_f3(1) = '0' then
								d_res <= x"80000000";
							else
								d_res <= (others => '0');
							end if;
						else
							if d_f3(1) = '0' then          -- DIV / DIVU
								if d_neg_q = '1' then
									d_res <= (not d_quot) + 1;
								else
									d_res <= d_quot;
								end if;
							else                            -- REM / REMU
								if d_neg_r = '1' then
									d_res <= (not d_rem(31 downto 0)) + 1;
								else
									d_res <= d_rem(31 downto 0);
								end if;
							end if;
						end if;
						d_done  <= '1';
						d_state <= D_IDLE;

				end case;
			end if;
		end if;
	end process;

end rtl;
