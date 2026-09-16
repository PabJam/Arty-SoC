#ifndef __PERIPHERALS_H__
#define __PERIPHERALS_H__

/* ---------------------------------------------------------------------------
 * MEMORY MAP  (mirrors the address decode in Top_of_Arty_SoC.vhd)
 *
 *   0x0000_0000 .. 0x0001_FFFF   BRAM   128 KB  text, rodata, data, bss, stack
 *   0x4000_0000 .. 0x4FFF_FFFF   DDR3   256 MB  heap
 *   0x8000_0000 ..               peripherals, word addressed
 *
 * BRAM is shared with program memory, so code size eats data space directly.
 * ------------------------------------------------------------------------- */

#define BRAM_BASE 0x00000000
#define BRAM_SIZE 0x00020000
#define DDR_BASE 0x40000000
#define DDR_SIZE 0x10000000

#define TIMER_BASE 0x80000000
#define LED_BASE 0x80000004
#define RGB_LED_BASE 0x80000008
#define UART_BASE 0x8000000C
#define UART_FIFO_FULL_BASE 0x8000000C
#define GPIO_BASE 0x80000010
#define GPIO_BASE_IN_OUT 0x80000014
#define STATUS_CTRL_REG 0x80000018
#define I2C_SLAVE_REG 0x80000020
#define I2C_SLAVE_REG_CNTR 0x80000024

#define INPUT 0x1
#define OUTPUT 0x0

/* status register bits */
#define STATUS_DDR_CALIB 0x1
#define STATUS_UI_RESET 0x2
#define STATUS_DDR_ERROR 0x4

/* The SoC runs on the MIG ui_clk, not the 100 MHz board oscillator.
 * ui_clk = f_DDR / 4 = 324.99 MHz / 4. */
#define CLOCK_FREQ_HZ 81250000
#define CYCLES_PER_MS 81250
#define CYCLES_PER_US 81

// Write to memory-mapped register
static inline void write_reg(unsigned int addr, unsigned int value) {
    *((volatile unsigned int*)addr) = value;
}

// Read from memory-mapped register
static inline unsigned int read_reg(unsigned int addr) {
    return *((volatile unsigned int*)addr);
}

// read timer, which is incremented each Clock cycle
static inline unsigned int read_timer()
{
    return read_reg(TIMER_BASE);
}

/// <summary>
/// Cycles elapsed since a previously captured read_timer() value. Correct
/// across the counter wrap, which happens every 52.9 s at 81.25 MHz, as long
/// as the interval being measured is shorter than that.
/// </summary>
static inline unsigned int elapsed_cycles(unsigned int start)
{
    return read_timer() - start;
}

// lowest 4 bits respond to 4 leds
static inline void set_leds(unsigned int leds)
{
    write_reg(LED_BASE, leds);
}

// bits : 5 => r1, 4 => g1, 3 => b1, 2 => r0, 1 => g0, 0 => b0  
static inline void set_rgb_leds(unsigned int rgb_leds)
{
    write_reg(RGB_LED_BASE, rgb_leds);
}

/// <summary>
/// Read the live state of all 32 GPIO pins. Note this is the PIN state, not
/// the output register, so an output pin reads back what is actually on the
/// pad.
/// </summary>
static inline unsigned int get_pins(void)
{
    return read_reg(GPIO_BASE);
}

static inline unsigned int get_pin(unsigned int pin)
{
    return (read_reg(GPIO_BASE) >> pin) & 0x1;
}

/// <summary>
/// Write 4 bytes to the i2c slave tx register, which are transmitted when a master requests read access
/// </summary>
/// <param name="messages">The 4 bytes which are transmitted</param>
static inline void set_i2c_slave_tx(unsigned int messages)
{
    write_reg(I2C_SLAVE_REG, messages);
}

/// <summary>
/// Read 4 bytes from the i2c Slave rx register
/// </summary>
/// <returns>The current i2c slave rx register</returns>
static inline unsigned int get_i2c_slave_rx(void)
{
    return read_reg(I2C_SLAVE_REG);
}

/// <summary>
/// Read out how many recieved bytes are in the rx register
/// </summary>
/// <returns>number of bytes</returns>
static inline char get_i2c_slave_rx_counter(void)
{
    return (char)(read_reg(I2C_SLAVE_REG_CNTR) & 0b0111);
}

/// <summary>
/// Read out how many bytes are in the tx register and ready to be transmitted
/// </summary>
/// <returns>number of bytes</returns>
static inline char get_i2c_slave_tx_counter(void)
{
    return (char)((read_reg(I2C_SLAVE_REG_CNTR) >> 3) & 0b0111);
}

/// <summary>
/// Checks if the Uart hardware fifo is full
/// </summary>
static inline char get_uart_fifo_full(void)
{
    return (char)(read_reg(UART_FIFO_FULL_BASE) & 0x1);
}

static inline unsigned int get_status_ctrl_reg(void)
{
    return read_reg(STATUS_CTRL_REG);
}

/// <summary>
/// DDR3 PHY finished calibration. Until this is set, any access to the DDR
/// region returns zeros and latches the error bit.
/// </summary>
static inline char get_ddr_calibrated(void)
{
    return (char)(read_reg(STATUS_CTRL_REG) & STATUS_DDR_CALIB);
}

/// <summary>
/// At least one DDR access happened before calibration completed.
/// Cleared only by reset.
/// </summary>
static inline char get_ddr_error(void)
{
    return (char)((read_reg(STATUS_CTRL_REG) & STATUS_DDR_ERROR) != 0);
}

/// <summary>
/// Set a single GPIO pin high or low without disturbing the other 31.
/// </summary>
void set_pin(unsigned int pin, unsigned int pin_out);

/// <summary>
/// Configure a single GPIO pin as INPUT or OUTPUT.
/// </summary>
void pin_mode(unsigned int pin, unsigned int in_out);

/// <summary>
/// Write all 32 output pins at once and resync the shadow register.
/// </summary>
void set_pins(unsigned int pins);

// thread idles for specified milliseconds
void wait_ms(unsigned int milliseconds);

// thread idles for specified microseconds
void wait_us(unsigned int microseconds);

#endif // !__PERIPHERALS_H__
