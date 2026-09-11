----------------------------------------------------------------------------------
-- mig_stub_ui - behavioural model of the MIG 7-series native user interface.
--
-- Models the protocol, not the PHY:
--   * independent app_rdy / app_wdf_rdy, accepted on different cycles
--   * command and write-data FIFOs paired in ISSUE order (not acceptance order)
--   * variable read latency, 8..40 cycles
--   * periodic "refresh" windows where both readies drop for ~30 cycles
--   * byte masking via app_wdf_mask (1 = do not write)
--
-- Does NOT model: DDR timing, bank conflicts, reordering, the PHY, or
-- calibration. Use the real MIG plus the Micron model for those.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mig_stub_ui is
	generic (
		G_LINES      : natural := 1024;   -- 128-bit lines modelled
		G_CALIB_CYC  : natural := 50      -- cycles before init_calib_complete
	);
	port (
		clk                 : in  std_logic;
		rst                 : in  std_logic;
		init_calib_complete : out std_logic;
		app_addr            : in  std_logic_vector(27 downto 0);
		app_cmd             : in  std_logic_vector(2 downto 0);
		app_en              : in  std_logic;
		app_rdy             : out std_logic;
		app_wdf_data        : in  std_logic_vector(127 downto 0);
		app_wdf_end         : in  std_logic;
		app_wdf_mask        : in  std_logic_vector(15 downto 0);
		app_wdf_wren        : in  std_logic;
		app_wdf_rdy         : out std_logic;
		app_rd_data         : out std_logic_vector(127 downto 0);
		app_rd_data_valid   : out std_logic
	);
end mig_stub_ui;

architecture sim of mig_stub_ui is

	constant C_MAX_LAT : natural := 48;

	type t_mem   is array (0 to G_LINES-1)  of std_logic_vector(127 downto 0);
	type t_aq    is array (0 to 15)         of natural;
	type t_dq    is array (0 to 15)         of std_logic_vector(127 downto 0);
	type t_mq    is array (0 to 15)         of std_logic_vector(15 downto 0);
	type t_dpipe is array (0 to C_MAX_LAT)  of std_logic_vector(127 downto 0);

	signal calib    : std_logic := '0';
	signal cnt      : natural   := 0;
	signal lf1      : std_logic_vector(7 downto 0) := "10110111";
	signal lf2      : std_logic_vector(7 downto 0) := "01101011";
	signal lf3      : std_logic_vector(7 downto 0) := "11001011";
	signal refr_cnt : natural   := 0;
	signal refresh  : std_logic := '0';
	signal rdy_c    : std_logic;
	signal rdy_d    : std_logic;

	signal vpipe : std_logic_vector(C_MAX_LAT downto 0) := (others => '0');
	signal dpipe : t_dpipe := (others => (others => '0'));

begin

	-- refresh window: both ready signals drop for 30 of every 640 cycles
	-- (640 cycles at 81.25 MHz is roughly the 7.8 us DDR3 refresh interval)
	refresh <= '1' when refr_cnt < 30 else '0';

	rdy_c <= calib and lf1(0) and (not refresh);
	rdy_d <= calib and lf2(3) and (not refresh);

	app_rdy             <= rdy_c;
	app_wdf_rdy         <= rdy_d;
	init_calib_complete <= calib;
	app_rd_data_valid   <= vpipe(0);
	app_rd_data         <= dpipe(0);

	process (clk)
		variable mem  : t_mem := (others => (others => '0'));
		variable aq   : t_aq;
		variable wdq  : t_dq;
		variable wmq  : t_mq;
		variable an   : natural := 0;
		variable dn   : natural := 0;
		variable lat  : natural;
		variable line : natural;
		variable cur  : std_logic_vector(127 downto 0);
	begin
		if rising_edge(clk) then
			if rst = '1' then
				calib    <= '0';
				cnt      <= 0;
				refr_cnt <= 0;
				an := 0; dn := 0;
				vpipe <= (others => '0');
			else
				lf1 <= lf1(6 downto 0) & (lf1(7) xor lf1(5));
				lf2 <= lf2(6 downto 0) & (lf2(7) xor lf2(4));
				lf3 <= lf3(6 downto 0) & (lf3(7) xor lf3(3));

				if cnt < G_CALIB_CYC then cnt <= cnt + 1; else calib <= '1'; end if;

				if refr_cnt < 639 then refr_cnt <= refr_cnt + 1; else refr_cnt <= 0; end if;

				-- shift the read-return pipeline down
				vpipe(C_MAX_LAT-1 downto 0) <= vpipe(C_MAX_LAT downto 1);
				vpipe(C_MAX_LAT) <= '0';
				dpipe(0 to C_MAX_LAT-1) <= dpipe(1 to C_MAX_LAT);

				-- write command accepted -> queue the address
				if calib = '1' and app_en = '1' and app_cmd = "000" and rdy_c = '1' then
					aq(an) := to_integer(unsigned(app_addr(27 downto 3))) mod G_LINES;
					an := an + 1;
				end if;

				-- write data accepted -> queue data + mask
				if calib = '1' and app_wdf_wren = '1' and rdy_d = '1' then
					wdq(dn) := app_wdf_data;
					wmq(dn) := app_wdf_mask;
					dn := dn + 1;
				end if;

				-- pair them in issue order and apply the byte mask
				if an > 0 and dn > 0 then
					cur := mem(aq(0));
					for b in 0 to 15 loop
						if wmq(0)(b) = '0' then
							cur(8*b+7 downto 8*b) := wdq(0)(8*b+7 downto 8*b);
						end if;
					end loop;
					mem(aq(0)) := cur;
					for k in 0 to 14 loop
						aq(k) := aq(k+1); wdq(k) := wdq(k+1); wmq(k) := wmq(k+1);
					end loop;
					an := an - 1; dn := dn - 1;
				end if;

				-- read command accepted -> schedule the return
				if calib = '1' and app_en = '1' and app_cmd = "001" and rdy_c = '1' then
					lat  := 8 + (to_integer(unsigned(lf3)) mod 33);   -- 8..40
					line := to_integer(unsigned(app_addr(27 downto 3))) mod G_LINES;
					vpipe(lat) <= '1';
					dpipe(lat) <= mem(line);
				end if;
			end if;
		end if;
	end process;

end sim;
