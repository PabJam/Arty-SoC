#ifndef PRINTF_H
#define PRINTF_H

/* You must provide this. One-liner over your existing UART FIFO write:
 *
 *   void uart_putc(char c) {
 *       while (get_uart_fifo_full());
 *       write_reg(UART_BASE, (int)c);
 *   }
 */
void uart_putc(char c);

int printf(const char *fmt, ...);
int snprintf(char *buf, unsigned int size, const char *fmt, ...);
int puts(const char *str);

#endif
