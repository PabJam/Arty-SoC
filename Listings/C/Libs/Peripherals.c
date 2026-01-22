#include "Peripherals.h"

void print(const char* msg)
{
    int idx = 0;
    while (true)
    {
        if (msg[idx] == 0 || idx > 255) { return; }
        write_reg(UART_BASE, (int)(msg[idx]));
        idx++;
    }
}

void wait_ms(unsigned int milliseconds)
{
    unsigned int start = read_timer();
    unsigned int cycles = milliseconds * CYCLES_PER_MS;

    while ((read_timer() - start) < cycles);
}

void print_int(unsigned int val)
{
    write_reg(UART_BASE, val >> 24);
    write_reg(UART_BASE, val >> 16);
    write_reg(UART_BASE, val >> 8);
    write_reg(UART_BASE, val);
}