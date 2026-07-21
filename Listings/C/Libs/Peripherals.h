#ifndef __PERIPHERALS_H__
#define __PERIPHERALS_H__

#define LED_BASE 0x80000004
#define RGB_LED_BASE 0x80000008
#define UART_BASE 0x8000000C
#define UART_FIFO_FULL_BASE 0x8000000C
#define GPIO_BASE 0x80000010
#define GPIO_BASE_IN_OUT 0x80000014
#define INPUT 0x1
#define OUTPUT 0x0
#define TIMER_BASE 0x80000000
#define I2C_SLAVE_REG 0x80000020
#define I2C_SLAVE_REG_CNTR 0x80000024

#define CLOCK_FREQ_HZ 100000000 //100MHz
#define CYCLES_PER_MS 100000  

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

static inline void pin_mode(unsigned int pin, unsigned int in_out)
{
    unsigned int pin_modes = read_reg(GPIO_BASE_IN_OUT);
    // clear the pin'th bit in pinmodes and or it with in_out shifted to the pin'th position
    pin_modes = (pin_modes & ~(0b1 << pin)) | ((in_out & 0b1) << pin);
    write_reg(GPIO_BASE_IN_OUT, pin_modes);
}

static inline void set_pin(unsigned int pin, unsigned int pin_out)
{
    unsigned int pins_output = read_reg(GPIO_BASE);
    // clear the pin'th bit in pinmodes and or it with in_out shifted to the pin'th position
    pins_output = (pins_output & ~(0b1 << pin)) | ((pin_out & 0b1) << pin);
    write_reg(GPIO_BASE, pins_output);
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
    return (char)(read_reg(UART_FIFO_FULL_BASE));
}

// print message containing up to 255 char 
void print(const char* msg);

// thread idles for specified milliseconds
void wait_ms(unsigned int milliseconds);

// writes the val back over Uart
void print_int(int val);

#endif // !__PERIPHERALS_H__
