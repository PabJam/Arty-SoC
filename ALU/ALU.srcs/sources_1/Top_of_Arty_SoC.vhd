library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- IOBUF
library UNISIM;
use UNISIM.VComponents.all;


entity Top_of_Arty_SoC is
    Port 
	(
		SW : in std_logic_vector (3 downto 0);
		BTN : in  std_logic_vector (3 downto 0);
		CLK : in  std_logic;
		LED : out  std_logic_vector (3 downto 0);
		o_Uart_TXD : out  std_logic;
		i_Uart_RXD : in std_logic;
		led0_r : out std_logic;
		led0_g : out std_logic;
		led0_b : out std_logic;    
		led1_r : out std_logic;
		led1_g : out std_logic;
		led1_b : out std_logic;
		ja : inout std_logic_vector(7 downto 0);
		jb : inout std_logic_vector(7 downto 0);
		jc : inout std_logic_vector(7 downto 0);
		jd : inout std_logic_vector(7 downto 0)
	);
end Top_of_Arty_SoC;

architecture Behavioral of Top_of_Arty_SoC is


component Arithmetic_Logic_Unit
	port 
	(
		i_Clk : in std_logic;
		i_Sync_nRst : in std_logic;
		i_Give_Ctrl_ALU : in std_logic;
		i_Take_Ctrl_ALU : in std_logic;
		o_Return_Ctrl_ALU : out std_logic;
		o_PM_Addr : out std_logic_vector(13 downto 0);
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
end component;

component UART_RX_CTRL
	generic (g_CLKS_PER_BIT : integer);
	port
	(
		i_Clk : in std_logic;
		i_RX_Serial : in std_logic;
		o_RX_DV : out std_logic;
		o_RX_Byte : out std_logic_vector(7 downto 0)
	);
end component;

component UART_TX_CTRL
	generic (g_CLKS_PER_BIT : integer);
	port
	(
		i_Clk       : in  std_logic;
		i_TX_DV     : in  std_logic;
		i_TX_Byte   : in  std_logic_vector(7 downto 0);
		o_TX_Active : out std_logic;
		o_TX_Serial : out std_logic;
		o_TX_Done   : out std_logic
	);
end component;

component UART_Fifo is
  Port ( 
    clk : in STD_LOGIC;
    srst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    valid : out STD_LOGIC
  );
end component;

component ProgRam
	port 
	(
		clka : in std_logic;
		wea : in std_logic_vector ( 7 downto 0 );
		addra : in std_logic_vector ( 13 downto 0 );
		dina : in std_logic_vector ( 63 downto 0 );
		douta : out std_logic_vector ( 63 downto 0 );
		clkb : in std_logic;
		web : in std_logic_vector ( 3 downto 0 );
		addrb : in std_logic_vector ( 14 downto 0 );
		dinb : in std_logic_vector ( 31 downto 0 );
		doutb : out std_logic_vector ( 31 downto 0 )
	);
end component;

component debouncer
Generic(
        DEBNC_CLOCKS : integer;
        PORT_WIDTH : integer);
Port(
		SIGNAL_I : in std_logic_vector(3 downto 0);
		CLK_I : in std_logic;          
		SIGNAL_O : out std_logic_vector(3 downto 0)
		);
end component;

--Used to determine when a button press has occured
signal btnReg : std_logic_vector (3 downto 0) := "0000";
signal btnDetect : std_logic;
--Debounced btn signals used to prevent single button presses
--from being interpreted as multiple button presses.
signal btnDeBnc : std_logic_vector(3 downto 0);


--UART signals
signal uart_RX : std_logic;
signal uart_TX : std_logic;
signal uart_RX_DV : std_logic;
signal uart_RX_Data : std_logic_vector(7 downto 0) := (others => '0');
signal uart_TX_DV :  std_logic;
signal uart_TX_Data : std_logic_vector(7 downto 0) := (others => '0');
signal uart_TX_Active : std_logic;
signal uart_TX_done : std_logic;
signal uart_fifo_empty : std_logic;
signal uart_fifo_rd_en : std_logic;
signal uart_fifo_valid : std_logic;
signal uart_fifo_wr_en : std_logic;
signal uart_fifo_dout : std_logic_vector(7 downto 0);
signal uart_fifo_din : std_logic_vector(7 downto 0) := (others => '0');
signal uart_fifo_srst : std_logic;


--ProgRam signals
type t_progRam_Uart_States is (progRam_Uart_Idle, progRam_Uart_Write, progRam_Uart_PreRead, progRam_Uart_ReadWait, ProgRam_Uart_Read);
signal progRam_Uart_State : t_progRam_Uart_States := progRam_Uart_Idle;

type t_pm_alu_states is (pm_alu_state_idle, pm_alu_state_pre_read, pm_alu_state_read);
signal pm_alu_state : t_pm_alu_states := pm_alu_state_pre_read;

signal progRam_Addr : std_logic_vector(13 downto 0) := (others => '0');
signal progRam_addr_alu : std_logic_vector(13 downto 0) := (others => '0'); 
signal latched_progRam_addr_alu : std_logic_vector(13 downto 0) := (others => '0'); 
signal progRam_addr_uart : std_logic_vector(12 downto 0) := (others => '0'); 
signal progRam_Wr_Cntr : unsigned(16 downto 0) := (others => '0');
signal progRam_Rd_Cntr : unsigned(16 downto 0) := (others => '0');
signal progRam_Wr_En : std_logic_vector(7 downto 0) := (others => '0'); -- can also write single bytes instead of full 64 bit
signal progRam_Data_In : std_logic_vector(63 downto 0); 
signal progRam_Data_Out : std_logic_vector(63 downto 0); 
signal progRam_dv : std_logic := '0';
signal progRam_addr_valid : std_logic;


type t_8byte_array is array (0 to 7) of std_logic_vector(7 downto 0);
signal progRam_Data_In_Bytes : t_8byte_array;
signal progRam_Data_Out_Bytes : t_8byte_array;

--DataRam signals
signal dm_addr : std_logic_vector(31 downto 0) := (others => '0');
signal dm_data_in : std_logic_vector(31 downto 0) := (others => '0');
signal dm_data_out : std_logic_vector(31 downto 0) := (others => '0');
signal dm_wr_en : std_logic_vector(3 downto 0) := (others => '0');
Signal dm_wr_ram_en : std_logic_vector(3 downto 0) := (others => '0');
signal dm_read_dv : std_logic := '0';
signal peripherals_read_dv : std_logic := '0';
signal alu_read_dv : std_logic := '0';
signal peripherals_read_data : std_logic_vector(31 downto 0) := (others => '0');
signal alu_read_data : std_logic_vector(31 downto 0) := (others => '0');
signal dm_alu_addr_dv : std_logic := '0';
type t_dm_read_states is (state_dm_read_idle, state_dm_read_wait, state_dm_read);
signal dm_read_state : t_dm_read_states := state_dm_read_idle;
--Logic Unit Signal
signal ctrl_arithmetic_logic_unit : std_logic := '0';
Signal get_ctrl_logic_unit : std_logic := '0';
signal give_ctrl_logic_unit : std_logic := '0';
signal take_ctrl_logic_unit : std_logic := '0';
signal sync_nRst_alu : std_logic := '0';
Signal wait_peripheral_access_finish : std_logic := '0';
Signal wait_setup_pm : std_logic := '0';
signal wait_peripheral_access_finish_cntr : natural range 0 to 7 := 0; 


-- Registers
signal cntr_100MHZ : unsigned(31 downto 0) := (others => '0');

-- GPIO for PMOD ports
signal ja_out : std_logic_vector(7 downto 0) := (others => '0');
signal ja_in : std_logic_vector(7 downto 0);
signal ja_io : std_logic_vector(7 downto 0) := (others => '0');

signal jb_out : std_logic_vector(7 downto 0) := (others => '0');
signal jb_in : std_logic_vector(7 downto 0);
signal jb_io : std_logic_vector(7 downto 0) := (others => '0');

signal jc_out : std_logic_vector(7 downto 0) := (others => '0');
signal jc_in : std_logic_vector(7 downto 0);
signal jc_io : std_logic_vector(7 downto 0) := (others => '0');

signal jd_out : std_logic_vector(7 downto 0) := (others => '0');
signal jd_in : std_logic_vector(7 downto 0);
signal jd_io : std_logic_vector(7 downto 0) := (others => '0');

signal clk_cntr_reg : std_logic_vector (4 downto 0) := (others=>'0'); 
signal saved_leds : std_logic_vector(3 downto 0) := (others => '0'); 
signal saved_rgb_leds_r0 : std_logic := '0';
signal saved_rgb_leds_g0 : std_logic := '0';
signal saved_rgb_leds_b0 : std_logic := '0';
signal saved_rgb_leds_r1 : std_logic := '0';
signal saved_rgb_leds_g1 : std_logic := '0';
signal saved_rgb_leds_b1 : std_logic := '0';


begin

----------------------------------------------------------
------              Button Control                 -------
----------------------------------------------------------
--Buttons are debounced and their rising edges are detected
--to BTN:0 => clear pm, BTN:1 => give Control to alu, BTN:2 => take control from alu, BTN:3 => sync reset


--Debounces btn signals 
Inst_btn_debounce: debouncer 
    generic map(
        DEBNC_CLOCKS => (2**16),
        PORT_WIDTH => 4)
    port map(
		SIGNAL_I => BTN,
		CLK_I => CLK,
		SIGNAL_O => btnDeBnc
	);

--Registers the debounced button signals, for edge detection.
btn_reg_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		btnReg <= btnDeBnc(3 downto 0);
	end if;
end process;

--btnDetect goes high for a single clock cycle when a btn press is detected
btnDetect <= '1' when ((btnReg(0)='0' and btnDeBnc(0)='1') or
								(btnReg(1)='0' and btnDeBnc(1)='1') or
								(btnReg(2)='0' and btnDeBnc(2)='1') or
								(btnReg(3)='0' and btnDeBnc(3)='1')  ) else
				  '0';
				  



----------------------------------------------------------
------              UART Control                   -------
----------------------------------------------------------

Inst_UART_TX_CTRL: UART_TX_CTRL 
generic map (g_CLKS_PER_BIT => 868)
port map
(
	i_Clk => CLK,
	i_TX_DV => uart_TX_DV,
	i_TX_Byte(7 downto 0) => uart_TX_Data(7 downto 0),
	o_TX_Active => uart_TX_Active,
	o_TX_Serial => uart_TX,
	o_TX_Done => open
);

-- Drive UART line high when transmitter is not active
o_Uart_TXD <= uart_TX when uart_TX_Active = '1' else '1';

Inst_UART_RX_CTRL: UART_RX_CTRL 
generic map (g_CLKS_PER_BIT => 868)
port map
(
	i_Clk => CLK,
	i_RX_Serial => uart_RX,
	o_RX_DV => uart_RX_DV,
	o_RX_Byte => uart_RX_Data
);

uart_RX <= i_Uart_RXD;

Inst_UART_Fifo: UART_Fifo
port map
(
    clk => CLK,
    srst => uart_fifo_srst,
    din => uart_fifo_din,
    wr_en => uart_fifo_wr_en,
    rd_en => uart_fifo_rd_en,
    dout => uart_fifo_dout,
    full => open,
    empty => uart_fifo_empty,
    valid => uart_fifo_valid
);

----------------------------------------------------------
------          IOBUF for Tri State GPIO           -------
----------------------------------------------------------


gen_iobuf: for i in 0 to 7 generate

	IOBUF_inst_a : IOBUF
	generic map 
	(
		DRIVE => 12,
		IOSTANDARD => "LVCMOS33",
		SLEW => "SLOW"
	)
	port map 
	(
		O => ja_in(i),
		IO => ja(i),
		I => ja_out(i),
		T => ja_io(i)
	);
	
	IOBUF_inst_b : IOBUF
	generic map 
	(
		DRIVE => 12,
		IOSTANDARD => "LVCMOS33",
		SLEW => "SLOW"
	)
	port map 
	(
		O => jb_in(i),
		IO => jb(i),
		I => jb_out(i),
		T => jb_io(i)
	);
	
	IOBUF_inst_c : IOBUF
	generic map 
	(
		DRIVE => 12,
		IOSTANDARD => "LVCMOS33",
		SLEW => "SLOW"
	)
	port map 
	(
		O => jc_in(i),
		IO => jc(i),
		I => jc_out(i),
		T => jc_io(i)
	);
	
	IOBUF_inst_d : IOBUF
	generic map 
	(
		DRIVE => 12,
		IOSTANDARD => "LVCMOS33",
		SLEW => "SLOW"
	)
	port map 
	(
		O => jd_in(i),
		IO => jd(i),
		I => jd_out(i),
		T => jd_io(i)
	);

end generate;

----------------------------------------------------------
------              Logic Unit Control             -------
----------------------------------------------------------

inst_Arithmetic_Logic_Unit: Arithmetic_Logic_Unit
port map
(
	i_Clk => clk,
	i_Sync_nRst => sync_nRst_alu,
	i_Give_Ctrl_ALU => give_ctrl_logic_unit,
	i_Take_Ctrl_ALU => take_ctrl_logic_unit,
	o_Return_Ctrl_ALU => get_ctrl_logic_unit,
	o_PM_Addr => progRam_addr_alu,
	o_PM_DV => progRam_addr_valid,
	i_PM_Data => progRam_Data_Out,
	i_PM_DV => progRam_dv,
	o_DM_Addr => dm_addr,
	o_DM_Data => dm_data_in,
	o_DM_Wr_En => dm_wr_en,
	o_DM_DV => dm_alu_addr_dv,
	i_DM_Data => alu_read_data,
	i_DM_DV => alu_read_dv
);

alu_read_dv <= '1' when (dm_read_dv = '1' or peripherals_read_dv = '1') else '0';
alu_read_data <= peripherals_read_data when peripherals_read_dv = '1' else dm_data_out;

Ctrl_ALU_Proc : process(clk)
begin
	if rising_edge(clk) then
		take_ctrl_logic_unit <= '0';
		give_ctrl_logic_unit <= '0';
		sync_nRst_alu <= '1';
		uart_fifo_srst <= '0';
		wait_setup_pm <= '0';
		
		if (wait_peripheral_access_finish = '1' and uart_fifo_empty = '1' and wait_peripheral_access_finish_cntr = 0) then
			ctrl_arithmetic_logic_unit <= '0';
			wait_peripheral_access_finish <= '0';
		elsif wait_peripheral_access_finish_cntr /= 0 then
			wait_peripheral_access_finish_cntr <= wait_peripheral_access_finish_cntr - 1;
		end if;
		
		if (wait_setup_pm = '1' and ctrl_arithmetic_logic_unit = '1') then
			give_ctrl_logic_unit <= '1';
		end if;
		
		if (get_ctrl_logic_unit = '1') then
			wait_peripheral_access_finish <= '1';
			wait_peripheral_access_finish_cntr <= 7; -- just to ensure that the last uart fifo write has enough time to go through cntr value is arbitrary
		end if;	
		
		if (btnReg(3)='0' and btnDeBnc(3)='1') then
			uart_fifo_srst <= '1';
			sync_nRst_alu <= '0';
		end if;
		
		if (btnReg(2)='0' and btnDeBnc(2)='1') then
			take_ctrl_logic_unit <= '1';
			wait_peripheral_access_finish <= '1';
			wait_peripheral_access_finish_cntr <= 7;
		end if;
		
		if (btnReg(1)='0' and btnDeBnc(1)='1') then
			wait_setup_pm <= '1';
			ctrl_arithmetic_logic_unit <= '1';
		end if;
		
		
		
	end if;
end process;

----------------------------------------------------------
------              PM Bram Control                -------
----------------------------------------------------------

dm_wr_ram_en <= dm_wr_en when dm_addr(31) = '0' else (others => '0');

inst_ProgRam: ProgRam
port map
(
	clka => clk,
	wea => progRam_Wr_En,
	addra => progRam_Addr,
	dina => progRam_Data_In,
	douta => progRam_Data_Out,
	clkb => clk,
	web => dm_wr_ram_en,
	addrb => dm_addr(16 downto 2),
	dinb => dm_data_in,
	doutb => dm_data_out
);

Prog_Ram_Proc : process(CLK)
begin
	if rising_edge(CLK) then
	
		progRam_Wr_En <= (others => '0'); -- default assignment
		uart_TX_DV <= '0';
		progRam_dv <= '0';
		uart_fifo_rd_en <= '0';
		latched_progRam_addr_alu <= progRam_addr_alu;
		
		if ctrl_arithmetic_logic_unit = '0' then
			pm_alu_state <= pm_alu_state_pre_read;
			
			case progRam_Uart_State is
				
				when progRam_Uart_Idle =>
					if uart_RX_DV = '1' then
						progRam_Uart_State <= progRam_Uart_Write;	
					elsif btnReg(0)='0' and btnDeBnc(0)='1' and progRam_Wr_Cntr /= 0 then -- button 0 is pressed 
						progRam_Uart_State <= progRam_Uart_PreRead;
						progRam_Wr_Cntr <= progRam_Wr_Cntr - 1;
						progRam_Rd_Cntr <= (others => '0');
					else
						progRam_Uart_State <= progRam_Uart_Idle;
					end if;
					
				when progRam_Uart_Write =>
					if progRam_Wr_Cntr < x"FFFF" then
						progRam_Data_In_Bytes(to_integer(progRam_Wr_Cntr(2 downto 0)))(7 downto 0) <= uart_RX_Data(7 downto 0);
						progRam_Addr(13 downto 0) <=  std_logic_vector(progRam_Wr_Cntr(16 downto 3));
						progRam_Wr_En(to_integer(progRam_Wr_Cntr(2 downto 0))) <= '1'; 
						progRam_Wr_Cntr <= progRam_Wr_Cntr + 1;
					end if;
				
					progRam_Uart_State <= progRam_Uart_Idle;
				
				-- Always takes a clk cycle to read data even if address didn't change
				-- could be improved to read all 4 bytes in read and only change state when addres changes
				when progRam_Uart_PreRead => 
					progRam_Addr(13 downto 0) <= std_logic_vector(progRam_Rd_Cntr(16 downto 3));
					progRam_Uart_State <= ProgRam_Uart_ReadWait;
				
				when progRam_Uart_ReadWait =>
					progRam_Uart_State <= ProgRam_Uart_Read;
				
				when progRam_Uart_Read =>
					if uart_TX_Active = '0' then
						uart_TX_DV <= '1';
						uart_TX_Data(7 downto 0) <= progRam_Data_Out_Bytes(to_integer(progRam_Rd_Cntr(2 downto 0)))(7 downto 0);
						--uart_TX_Data(7 downto 0) <= x"9B";
						if (progRam_Wr_Cntr /= x"0000") then
							progRam_Rd_Cntr <= progRam_Rd_Cntr + 1;
							progRam_Wr_Cntr <= progRam_Wr_Cntr - 1;
							progRam_Uart_State <= progRam_Uart_PreRead;
						else
							progRam_Uart_State <= progRam_Uart_Idle;
						end if;
					else
						progRam_Uart_State <= ProgRam_Uart_Read;
					end if;
					
				when others => -- should not be reached
					progRam_Uart_State <= progRam_Uart_Idle;
				
			end case;
		else -- lu has control over pm
			progRam_Addr <= progRam_addr_alu; 
			
			if progRam_addr_valid = '1' then
				if latched_progRam_addr_alu /= progRam_addr_alu then
					pm_alu_state <= pm_alu_state_pre_read;
				else
					pm_alu_state <= pm_alu_state_read;
				end if;
			else
				case pm_alu_state is
					when pm_alu_state_idle =>
						pm_alu_state <= pm_alu_state_idle;
					when pm_alu_state_pre_read =>
						pm_alu_state <= pm_alu_state_read;
					when pm_alu_state_read =>
						progRam_dv <= '1';
						pm_alu_state <= pm_alu_state_idle;
					when others =>
						null;
						pm_alu_state <= pm_alu_state_idle;
				end case;
			end if;
			
			if uart_fifo_valid = '1' and uart_TX_Active = '0' and uart_fifo_empty = '0' and uart_fifo_rd_en = '0' then
				uart_TX_Data <= uart_fifo_dout;
				uart_fifo_rd_en <= '1';
				uart_TX_DV <= '1';
			end if;
			
		end if;
	end if;
end process;

----------------------------------------------------------
------   Peripherals adress map & ALU ram access   -------
----------------------------------------------------------

address_map_proc: process(clk)
begin
	if rising_edge(clk) then
	
		uart_fifo_wr_en <= '0';
		peripherals_read_data <= (others => '0');
		peripherals_read_dv <= '0';
		
		if sync_nRst_alu = '0' then
			saved_leds <= (others => '0');
			saved_rgb_leds_r0 <= '0';
			saved_rgb_leds_g0 <= '0';
			saved_rgb_leds_b0 <= '0';
			saved_rgb_leds_r1 <= '0';
			saved_rgb_leds_g1 <= '0';
			saved_rgb_leds_b1 <= '0';
			cntr_100MHZ <= (others => '0');
		else 
			
			cntr_100MHZ <= cntr_100MHZ + 1; 
			if dm_alu_addr_dv = '1' and dm_addr(31) = '1' then -- peripherals
				if dm_wr_en = "0000" then -- read 
					case dm_addr(7 downto 0) is
						
						when "000000000" =>
							peripherals_read_data <= std_logic_vector(cntr_100MHZ);
							peripherals_read_dv <= '1';
						
						when "000010000" => 
							peripherals_read_data <= jd_in(7 downto 0) & jc_in(7 downto 0) & jb_in(7 downto 0) & ja_in(7 downto 0);
							peripherals_read_dv <= '1';
						
						when "000010100" =>
							peripherals_read_data <= jd_io(7 downto 0) & jc_io(7 downto 0) & jb_io(7 downto 0) & ja_io(7 downto 0);
							peripherals_read_dv <= '1';
						
						when others =>
							peripherals_read_dv <= '1';
							null;
					
					end case;
				else -- write
					case dm_addr(7 downto 0) is
						
						when "00000100" =>	
							saved_leds <= dm_data_in(3 downto 0);
						
						when "00001000" =>	
							saved_rgb_leds_r0 <= dm_data_in(2);
							saved_rgb_leds_g0 <= dm_data_in(1);
							saved_rgb_leds_b0 <= dm_data_in(0);
							saved_rgb_leds_r1 <= dm_data_in(5);
							saved_rgb_leds_g1 <= dm_data_in(4);
							saved_rgb_leds_b1 <= dm_data_in(3);
						
						when "00001100" =>
							uart_fifo_din(7 downto 0) <= dm_data_in(7 downto 0);
							uart_fifo_wr_en <= '1';
							
						when "000010000" =>
							ja_out(7 downto 0) <= dm_data_in(7 downto 0);
							jb_out(7 downto 0) <= dm_data_in(15 downto 8);
							jc_out(7 downto 0) <= dm_data_in(23 downto 16);
							jd_out(7 downto 0) <= dm_data_in(31 downto 24);
						
						when "000010100" =>
							ja_io(7 downto 0) <= dm_data_in(7 downto 0);
							jb_io(7 downto 0) <= dm_data_in(15 downto 8);
							jc_io(7 downto 0) <= dm_data_in(23 downto 16);
							jd_io(7 downto 0) <= dm_data_in(31 downto 24);
						
						when others =>
							null;
							
					end case;	
				end if; 
					
			end if;
		end if;
		
	end if;
end process;

ram_access_proc: process(clk)
begin
	if rising_edge(clk) then
		dm_read_dv <= '0';
		case dm_read_state is
			when state_dm_read_idle =>
				if dm_alu_addr_dv = '1' and dm_wr_en = "0000" and dm_addr(31) = '0' then
					dm_read_state <= state_dm_read_wait;
				else
					dm_read_state <= state_dm_read_idle;
				end if;
			when state_dm_read_wait => 
				dm_read_state <= state_dm_read;
			when state_dm_read =>
				dm_read_state <= state_dm_read_idle;
				dm_read_dv <= '1';
			when others =>
				null;
		end case;	
	end if;
end process;

progRam_Data_In(7 downto 0) <= progRam_Data_In_Bytes(0)(7 downto 0);
progRam_Data_In(15 downto 8) <= progRam_Data_In_Bytes(1)(7 downto 0);
progRam_Data_In(23 downto 16) <= progRam_Data_In_Bytes(2)(7 downto 0);
progRam_Data_In(31 downto 24) <= progRam_Data_In_Bytes(3)(7 downto 0);
progRam_Data_In(39 downto 32) <= progRam_Data_In_Bytes(4)(7 downto 0);
progRam_Data_In(47 downto 40) <= progRam_Data_In_Bytes(5)(7 downto 0);
progRam_Data_In(55 downto 48) <= progRam_Data_In_Bytes(6)(7 downto 0);
progRam_Data_In(63 downto 56) <= progRam_Data_In_Bytes(7)(7 downto 0);

progRam_Data_Out_Bytes(0)(7 downto 0) <= progRam_Data_Out(7 downto 0);
progRam_Data_Out_Bytes(1)(7 downto 0) <= progRam_Data_Out(15 downto 8);
progRam_Data_Out_Bytes(2)(7 downto 0) <= progRam_Data_Out(23 downto 16);
progRam_Data_Out_Bytes(3)(7 downto 0) <= progRam_Data_Out(31 downto 24);
progRam_Data_Out_Bytes(4)(7 downto 0) <= progRam_Data_Out(39 downto 32);
progRam_Data_Out_Bytes(5)(7 downto 0) <= progRam_Data_Out(47 downto 40);
progRam_Data_Out_Bytes(6)(7 downto 0) <= progRam_Data_Out(55 downto 48);
progRam_Data_Out_Bytes(7)(7 downto 0) <= progRam_Data_Out(63 downto 56);

----------------------------------------------------------
------             LED Control                  -------
----------------------------------------------------------

led_proc: process (clk)
begin
	if rising_edge(clk) then
		LED <= saved_leds;
		led0_r <= saved_rgb_leds_r0;
		led0_g <= saved_rgb_leds_g0;
		led0_b <= saved_rgb_leds_b0;
		led1_r <= saved_rgb_leds_r1;
		led1_g <= saved_rgb_leds_g1;
		led1_b <= saved_rgb_leds_b1 ;
	end if;
end process;
	

end Behavioral;
