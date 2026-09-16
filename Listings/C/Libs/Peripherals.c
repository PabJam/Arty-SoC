#include ".\Peripherals.h"

static unsigned int gpio_out_shadow = 0;

void set_pin(unsigned int pin, unsigned int pin_out)
{
    gpio_out_shadow = (gpio_out_shadow & ~(0b1 << pin)) | ((pin_out & 0b1) << pin);
    write_reg(GPIO_BASE, gpio_out_shadow);
}

void set_pins(unsigned int pins)
{
    gpio_out_shadow = pins;
    write_reg(GPIO_BASE, gpio_out_shadow);
}

void pin_mode(unsigned int pin, unsigned int in_out)
{
    /* GPIO_BASE_IN_OUT reads back the tristate register itself, so a
     * read-modify-write is correct here. */
    unsigned int pin_modes = read_reg(GPIO_BASE_IN_OUT);
    pin_modes = (pin_modes & ~(0b1 << pin)) | ((in_out & 0b1) << pin);
    write_reg(GPIO_BASE_IN_OUT, pin_modes);
}

/* ---------------------------------------------------------------------------
 * delays
 *
 * milliseconds * CYCLES_PER_MS overflows 32 bits at 52861 ms, and the hardware
 * counter itself wraps every 52.9 s, so long waits are chunked. Each chunk
 * measures well under one wrap, which keeps the unsigned subtraction valid.
 * ------------------------------------------------------------------------- */

#define WAIT_CHUNK_MS 1000

static void wait_cycles(unsigned int cycles)
{
    unsigned int start = read_timer();
    while (elapsed_cycles(start) < cycles);
}

void wait_ms(unsigned int milliseconds)
{
    while (milliseconds > WAIT_CHUNK_MS) {
        wait_cycles(WAIT_CHUNK_MS * CYCLES_PER_MS);
        milliseconds -= WAIT_CHUNK_MS;
    }
    wait_cycles(milliseconds * CYCLES_PER_MS);
}

void wait_us(unsigned int microseconds)
{
    wait_cycles(microseconds * CYCLES_PER_US);
}
