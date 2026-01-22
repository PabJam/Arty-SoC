#ifndef __PERIPHERALS_H__
#define __PERIPHERALS_H__

#define LED_BASE 0x80000004
#define RGB_LED_BASE 0x80000008
#define UART_BASE 0x8000000C
#define GPIO_BASE 0x80000010
#define GPIO_BASE_IN_OUT 0x80000014
#define INPUT 0x1
#define OUTPUT 0x0
#define UART_BASE 0x8000000C
#define TIMER_BASE 0x80000000

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

// print message containing up to 255 char 
void print(const char* msg);

// thread idles for specified milliseconds
void wait_ms(unsigned int milliseconds);

// writes the val back over Uart
void print_int(unsigned int val);

#endif // !__PERIPHERALS_H__
