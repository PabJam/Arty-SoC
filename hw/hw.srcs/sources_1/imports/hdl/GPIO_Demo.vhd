----------------------------------------------------------------------------
--	GPIO_Demo.vhd -- Arty S7 GPIO/UART Demonstration Project
----------------------------------------------------------------------------
-- Author:  Marshall Wingerson Adapted from Sam Bobrowicz
--          Copyright 2013 Digilent, Inc.
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
--	The GPIO/UART Demo project demonstrates a simple usage of the Nexys4DDR's 
--  GPIO and UART. The behavior is as follows:
--
--	      *The 16 User LEDs are tied to the 16 User Switches. While the center
--			 User button is pressed, the LEDs are instead tied to GND
--	      *The 7-Segment display counts from 0 to 9 on each of its 8
--        digits. This count is reset when the center button is pressed.
--        Also, single anodes of the 7-Segment display are blanked by
--	       holding BTNU, BTNL, BTND, or BTNR. Holding the center button 
--        blanks all the 7-Segment anodes.
--       *An introduction message is sent across the UART when the device
--        is finished being configured, and after the center User button
--        is pressed.
--       *A message is sent over UART whenever BTNU, BTNL, BTND, or BTNR is
--        pressed.
--       *The Tri-Color LEDs cycle through several colors in a ~4 second loop
--       *Data from the microphone is collected and transmitted over the mono
--        audio out port.
--       *Note that the center user button behaves as a user reset button
--        and is referred to as such in the code comments below
--        
--	All UART communication can be captured by attaching the UART port to a
-- computer running a Terminal program with 9600 Baud Rate, 8 data bits, no 
-- parity, and 1 stop bit.																
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
-- Revision History:
--  08/08/2011(SamB): Created using Xilinx Tools 13.2
--  08/27/2013(MarshallW): Modified for the Nexys4 with Xilinx ISE 14.4\
--  		--added RGB and microphone
--  12/10/2014(SamB): Ported to Nexys4DDR and updated to Vivado 2014.4
--  8/14/2017(SamB): Ported to Arty S7 and updated to Vivado 2017.2
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--The IEEE.std_logic_unsigned contains definitions that allow 
--std_logic_vector types to be used with the + operator to instantiate a 
--counter.
use ieee.numeric_std.all;

entity GPIO_demo is
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
		led1_b : out std_logic
	);
end GPIO_demo;

architecture Behavioral of GPIO_demo is


component LogicUnit
	port 
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
		addra : in std_logic_vector ( 12 downto 0 );
		dina : in std_logic_vector ( 63 downto 0 );
		douta : out std_logic_vector ( 63 downto 0 )
	);
end component;

component DataRam
	port
	(
		clka : in std_logic;
		wea : in std_logic_vector ( 3 downto 0 );
		addra : in std_logic_vector ( 13 downto 0 );
		dina : in std_logic_vector ( 31 downto 0 );
		douta : out std_logic_vector ( 31 downto 0 )
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

component RGB_controller 
Port(
	GCLK 		   : in std_logic;
	RGB_LED_1_O	   : out std_logic_vector(2 downto 0);
	RGB_LED_2_O	   : out std_logic_vector(2 downto 0)
	);
end component;



--The type definition for the UART state machine type. Here is a description of what
--occurs during each state:
-- RST_REG     -- Do Nothing. This state is entered after configuration or a user reset.
--                The state is set to LD_INIT_STR.
-- LD_INIT_STR -- The Welcome String is loaded into the sendStr variable and the strIndex
--                variable is set to zero. The welcome string length is stored in the StrEnd
--                variable. The state is set to SEND_CHAR.
-- SEND_CHAR   -- uartSend is set high for a single clock cycle, signaling the character
--                data at sendStr(strIndex) to be registered by the UART_TX_CTRL at the next
--                cycle. Also, strIndex is incremented (behaves as if it were post 
--                incremented after reading the sendStr data). The state is set to RDY_LOW.
-- RDY_LOW     -- Do nothing. Wait for the READY signal from the UART_TX_CTRL to go low, 
--                indicating a send operation has begun. State is set to WAIT_RDY.
-- WAIT_RDY    -- Do nothing. Wait for the READY signal from the UART_TX_CTRL to go high, 
--                indicating a send operation has finished. If READY is high and strEnd = 
--                StrIndex then state is set to WAIT_BTN, else if READY is high and strEnd /=
--                StrIndex then state is set to SEND_CHAR.
-- WAIT_BTN    -- Do nothing. Wait for a button press on BTNU, BTNL, BTND, or BTNR. If a 
--                button press is detected, set the state to LD_BTN_STR.
-- LD_BTN_STR  -- The Button String is loaded into the sendStr variable and the strIndex
--                variable is set to zero. The button string length is stored in the StrEnd
--                variable. The state is set to SEND_CHAR.
type UART_STATE_TYPE is (RST_REG, LD_INIT_STR, SEND_CHAR, RDY_LOW, WAIT_RDY, WAIT_BTN, LD_BTN_STR);




--The CHAR_ARRAY type is a variable length array of 8 bit std_logic_vectors. 
--Each std_logic_vector contains an ASCII value and represents a character in
--a string. The character at index 0 is meant to represent the first
--character of the string, the character at index 1 is meant to represent the
--second character of the string, and so on.
type CHAR_ARRAY is array (integer range<>) of std_logic_vector(7 downto 0);

constant TMR_CNTR_MAX : std_logic_vector(26 downto 0) := "101111101011110000100000000"; --100,000,000 = clk cycles per second
constant TMR_VAL_MAX : std_logic_vector(3 downto 0) := "1001"; --9

constant RESET_CNTR_MAX : std_logic_vector(17 downto 0) := "110000110101000000";-- 100,000,000 * 0.002 = 200,000 = clk cycles per 2 ms

constant MAX_STR_LEN : integer := 31;

constant WELCOME_STR_LEN : natural := 31;
constant BTN_STR_LEN : natural := 24;

--Welcome string definition. Note that the values stored at each index
--are the ASCII values of the indicated character.
constant WELCOME_STR : CHAR_ARRAY(0 to 30) := (X"0A",  --\n
															  X"0D",  --\r
															  X"41",  --A
															  X"52",  --R
															  X"54",  --T
															  X"59",  --Y
															  X"20",  -- 
															  X"47",  --G
															  X"50",  --P
															  X"49",  --I
															  X"4F",  --O
															  X"2F",  --/
															  X"55",  --U
															  X"41",  --A
															  X"52",  --R
															  X"54",  --T
															  X"20",  -- 
															  X"44",  --D
															  X"45",  --E
															  X"4D",  --M
															  X"4F",  --O
															  X"21",  --!
															  X"20",  -- 
															  X"20",  -- 
															  X"20",  -- 
															  X"20",  -- 
															  X"20",  -- 
															  X"20",  -- 
															  X"0A",  --\n
															  X"0D",  --\r
															  X"0A"); --\n
															  
--Button press string definition.
constant BTN_STR : CHAR_ARRAY(0 to 23) :=     (X"42",  --B
															  X"75",  --u
															  X"74",  --t
															  X"74",  --t
															  X"6F",  --o
															  X"6E",  --n
															  X"20",  -- 
															  X"70",  --p
															  X"72",  --r
															  X"65",  --e
															  X"73",  --s
															  X"73",  --s
															  X"20",  --
															  X"64",  --d
															  X"65",  --e
															  X"74",  --t
															  X"65",  --e
															  X"63",  --c
															  X"74",  --t
															  X"65",  --e
															  X"64",  --d
															  X"21",  --!
															  X"0D",  --\r
															  X"0A"); --\n

--This is used to determine when the 7-segment display should be
--incremented
signal tmrCntr : std_logic_vector(26 downto 0) := (others => '0');

--This counter keeps track of which number is currently being displayed
--on the 7-segment.
signal tmrVal : std_logic_vector(3 downto 0) := (others => '0');

--Contains the current string being sent over uart.
signal sendStr : CHAR_ARRAY(0 to (MAX_STR_LEN - 1));

--Contains the length of the current string being sent over uart.
signal strEnd : natural;

--Contains the index of the next character to be sent over uart
--within the sendStr variable.
signal strIndex : natural;

--Used to determine when a button press has occured
signal btnReg : std_logic_vector (3 downto 0) := "0000";
signal btnDetect : std_logic;

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

type t_pm_lu_states is (pm_lu_state_pre_read, pm_lu_state_read);
signal pm_lu_state : t_pm_lu_states := pm_lu_state_pre_read;

signal progRam_Addr : std_logic_vector(12 downto 0) := (others => '0');
signal progRam_addr_lu : std_logic_vector(12 downto 0) := (others => '0'); 
signal latched_progRam_addr_lu : std_logic_vector(12 downto 0) := (others => '0'); 
signal progRam_addr_uart : std_logic_vector(12 downto 0) := (others => '0'); 
signal progRam_Wr_Cntr : unsigned(15 downto 0) := (others => '0');
signal progRam_Rd_Cntr : unsigned(15 downto 0) := (others => '0');
signal progRam_Wr_En : std_logic_vector(7 downto 0) := (others => '0'); -- can also write single bytes instead of full 64 bit
signal progRam_Data_In : std_logic_vector(63 downto 0); 
signal progRam_Data_Out : std_logic_vector(63 downto 0); 
signal progRam_dv : std_logic := '0';

type t_8byte_array is array (0 to 7) of std_logic_vector(7 downto 0);
signal progRam_Data_In_Bytes : t_8byte_array;
signal progRam_Data_Out_Bytes : t_8byte_array;

--DataRam signals
signal dm_addr : std_logic_vector(31 downto 0) := (others => '0');
signal dm_data_in : std_logic_vector(31 downto 0) := (others => '0');
signal dm_data_out : std_logic_vector(31 downto 0) := (others => '0');
signal dm_wr_en : std_logic_vector(3 downto 0) := (others => '0');
signal dm_read_dv : std_logic := '0';
signal dm_write_dv : std_logic := '0';
--Logic Unit Signal
signal ctrl_logic_unit : std_logic := '0';
signal give_ctrl_logic_unit : std_logic := '0';
signal take_ctrl_logic_unit : std_logic := '0';
signal sync_nRst_lu : std_logic := '0';
Signal debug_flags : std_logic_vector(7 downto 0) := "11111111";

attribute mark_debug : string;
attribute mark_debug of dm_addr : signal is "true";
attribute mark_debug of dm_data_in : signal is "true";
attribute mark_debug of dm_write_dv : signal is "true";
attribute mark_debug of uart_fifo_din : signal is "true";
attribute mark_debug of uart_fifo_dout : signal is "true";
attribute mark_debug of uart_fifo_wr_en : signal is "true";
attribute mark_debug of uart_fifo_rd_en : signal is "true";
attribute mark_debug of uart_fifo_valid : signal is "true";
attribute mark_debug of uart_fifo_empty : signal is "true";
attribute mark_debug of uart_fifo_srst : signal is "true";
attribute mark_debug of uart_TX_Active : signal is "true";
attribute mark_debug of uart_TX_Data : signal is "true";
attribute mark_debug of uart_TX_DV : signal is "true";
attribute mark_debug of debug_flags : signal is "true";

--Current uart state signal
signal uartState : UART_STATE_TYPE := RST_REG;

--Debounced btn signals used to prevent single button presses
--from being interpreted as multiple button presses.
signal btnDeBnc : std_logic_vector(3 downto 0);

signal clk_cntr_reg : std_logic_vector (4 downto 0) := (others=>'0'); 
signal saved_leds : std_logic_vector(3 downto 0) := (others => '0'); 
--signal pwm_val_reg : std_logic := '0';

--this counter counts the amount of time paused in the UART reset state
signal reset_cntr : std_logic_vector (17 downto 0) := (others=>'0');

begin

----------------------------------------------------------
------                LED Control                  -------
----------------------------------------------------------


	--LED <= SW;

	

----------------------------------------------------------
------              Button Control                 -------
----------------------------------------------------------
--Buttons are debounced and their rising edges are detected
--to trigger UART messages


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
------              Logic Unit Control             -------
----------------------------------------------------------

inst_LogicUnit: LogicUnit
port map
(
	i_Clk => clk,
	i_Sync_nRst => sync_nRst_lu,
	i_Give_Ctrl_Logic_Unit => give_ctrl_logic_unit,
	i_Take_Ctrl_Logic_Unit => take_ctrl_logic_unit,
	o_Return_Ctrl_Logic_Unit => open,
	o_PM_Addr => progRam_addr_lu,
	i_PM_Data => progRam_Data_Out,
	i_PM_DV => progRam_dv,
	o_DM_Addr => dm_addr,
	o_DM_Data => dm_data_in,
	o_DM_Wr_En => dm_wr_en,
	o_DM_DV => dm_write_dv,
	i_DM_Data => dm_data_out,
	i_DM_DV => dm_read_dv
);


Ctrl_Lu_Proc : process(clk)
begin
	if rising_edge(clk) then
		take_ctrl_logic_unit <= '0';
		give_ctrl_logic_unit <= '0';
		sync_nRst_lu <= '1';
		uart_fifo_srst <= '0';
		
		if (btnReg(3)='0' and btnDeBnc(3)='1') then
			uart_fifo_srst <= '1';
			sync_nRst_lu <= '0';
		end if;
		if (btnReg(2)='0' and btnDeBnc(2)='1') then
			take_ctrl_logic_unit <= '1';
			ctrl_logic_unit <= '0';
		end if;
		if (btnReg(1)='0' and btnDeBnc(1)='1') then
			give_ctrl_logic_unit <= '1';
			ctrl_logic_unit <= '1';
		end if;
		
	end if;
end process;
----------------------------------------------------------
------              PM Bram Control                -------
----------------------------------------------------------

inst_ProgRam: ProgRam
port map
(
	clka => clk,
	wea => progRam_Wr_En,
	addra => progRam_Addr,
	dina => progRam_Data_In,
	douta => progRam_Data_Out
);

Prog_Ram_Proc : process(CLK)
begin
	if rising_edge(CLK) then
	
		progRam_Wr_En <= (others => '0'); -- default assignment
		uart_TX_DV <= '0';
		progRam_dv <= '0';
		uart_fifo_rd_en <= '0';
		latched_progRam_addr_lu <= progRam_addr_lu;
		
		if ctrl_logic_unit = '0' then
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
						progRam_Addr(12 downto 0) <=  std_logic_vector(progRam_Wr_Cntr(15 downto 3));
						progRam_Wr_En(to_integer(progRam_Wr_Cntr(2 downto 0))) <= '1'; 
						progRam_Wr_Cntr <= progRam_Wr_Cntr + 1;
					end if;
				
					progRam_Uart_State <= progRam_Uart_Idle;
				
				-- Always takes a clk cycle to read data even if address didn't change
				-- could be improved to read all 4 bytes in read and only change state when addres changes
				when progRam_Uart_PreRead => 
					progRam_Addr(12 downto 0) <= std_logic_vector(progRam_Rd_Cntr(15 downto 3));
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
			progRam_Addr <= progRam_addr_lu; -- this way it takes 1 extra clk cylcle to set the pm address 
			if (latched_progRam_addr_lu /= progRam_addr_lu) then
				pm_lu_state <= pm_lu_state_pre_read;
			else
				case pm_lu_state is
					when pm_lu_state_pre_read =>
						pm_lu_state <= pm_lu_state_read;
					when pm_lu_state_read =>
						progRam_dv <= '1';
						pm_lu_state <= pm_lu_state_read;
						--pm_lu_state <= pm_lu_state_idle;
					when others =>
						null;
						pm_lu_state <= pm_lu_state_pre_read;
				end case;
			end if;
			
			if uart_fifo_valid = '1' and uart_TX_Active = '0' and uart_fifo_empty = '0' and uart_fifo_rd_en <= '0' then
				uart_TX_Data <= uart_fifo_dout;
				uart_fifo_rd_en <= '1';
				uart_TX_DV <= '1';
			end if;
			
		end if;
	end if;
end process;

address_map: process (clk)
begin
	if rising_edge(clk) then
		debug_flags <= (others => '0');
		uart_fifo_wr_en <= '0';
		LED <= saved_leds;
		if dm_write_dv = '1' and dm_addr(31) = '1' then
			debug_flags(0) <= '1';
			case dm_addr(7 downto 0) is
				when "00000100" =>	
					saved_leds <= dm_data_in(3 downto 0);
					debug_flags(1) <= '1';
				when "00001000" =>
					uart_fifo_din(7 downto 0) <= dm_data_in(7 downto 0);
					uart_fifo_wr_en <= '1';
					debug_flags(2) <= '1';
				when others =>
					debug_flags(3) <= '1';
					null;
			end case;
		else
			debug_flags(4) <= '1';
		end if;
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
------              DM Bram Control             -------
----------------------------------------------------------

inst_DataRam: DataRam
port map
(
	clka => clk,
	wea => dm_wr_en,
	addra => dm_addr(13 downto 0),
	dina => dm_data_in,
	douta => dm_data_out
);


----------------------------------------------------------
------            RGB LED Control                  -------
----------------------------------------------------------



RGB_Core1: RGB_controller port map(
	GCLK => CLK, 			
	RGB_LED_1_O(0) => led0_g, 
	RGB_LED_1_O(1) => led0_b,
	RGB_LED_1_O(2) => led0_r,
	RGB_LED_2_O(0) => led1_g, 
	RGB_LED_2_O(1) => led1_b,
	RGB_LED_2_O(2) => led1_r
	);
	

end Behavioral;
