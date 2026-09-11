/* uart_glue.c - the one function printf.c needs from you.
 * Adjust the names to match your existing code.
 */
#include "printf.h"
#include "Peripherals.h"

#define UART_BASE 0x8000000C   /* <-- your UART data register */

void uart_putc(char c)
{
    while (get_uart_fifo_full());
    write_reg(UART_BASE, (int)(unsigned char)c);
}
