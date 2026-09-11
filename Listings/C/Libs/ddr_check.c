/* ddr_check.c - software validation of the DDR3 heap. Call from main(). */
#include "heap.h"

#define PERIPH_STATUS (*(volatile unsigned int *)0x80000018)
#define DDR_BASE      0x40000000u

extern void uart_puts(const char *s);
extern void uart_hex(unsigned int v);

/* Returns 0 on success, or the address of the first failing word. */
unsigned int ddr_memtest(unsigned int base, unsigned int words)
{
    volatile unsigned int *p = (volatile unsigned int *)base;
    unsigned int i;

    /* 1. address-in-address: catches stuck or swapped address lines */
    for (i = 0; i < words; i++) p[i] = base + (i << 2);
    for (i = 0; i < words; i++)
        if (p[i] != base + (i << 2)) return base + (i << 2);

    /* 2. walking ones: catches stuck or shorted data lines */
    for (i = 0; i < 32; i++) {
        p[0] = 1u << i;
        if (p[0] != (1u << i)) return base;
    }

    /* 3. byte enables: sb/sh must not disturb neighbouring bytes */
    {
        volatile unsigned char *b = (volatile unsigned char *)base;
        p[0] = 0x00000000u;
        b[0] = 0x11; b[1] = 0x22; b[2] = 0x33; b[3] = 0x44;
        if (p[0] != 0x44332211u) return base;

        volatile unsigned short *h = (volatile unsigned short *)base;
        p[0] = 0x00000000u;
        h[0] = 0xBEEF; h[1] = 0xDEAD;
        if (p[0] != 0xDEADBEEFu) return base;
    }

    return 0;
}

void ddr_report(void)
{
    unsigned int st, bad, f, u, n;

    st = PERIPH_STATUS;
    uart_puts("calib="); uart_hex(st & 1u);
    uart_puts(" rst=");  uart_hex((st >> 1) & 1u);
    uart_puts(" err=");  uart_hex((st >> 2) & 1u);
    uart_puts("\r\n");

    if (!(st & 1u)) { uart_puts("DDR NOT CALIBRATED\r\n"); return; }

    bad = ddr_memtest(DDR_BASE, 1024);       /* first 4 KB */
    if (bad) { uart_puts("MEMTEST FAIL at "); uart_hex(bad); uart_puts("\r\n"); return; }
    uart_puts("memtest ok\r\n");

    heap_stats(&f, &u, &n);
    uart_puts("heap free="); uart_hex(f);
    uart_puts(" used=");     uart_hex(u);
    uart_puts(" blocks=");   uart_hex(n);
    uart_puts("\r\n");

    {
        unsigned int *a = (unsigned int *)malloc(256);
        unsigned int *b = (unsigned int *)malloc(1024);
        if (!a || !b) { uart_puts("malloc FAILED\r\n"); return; }
        uart_puts("a="); uart_hex((unsigned int)a);
        uart_puts(" b="); uart_hex((unsigned int)b);
        uart_puts("\r\n");
        a[0] = 0xA5A5A5A5u; b[0] = 0x5A5A5A5Au;
        if (a[0] != 0xA5A5A5A5u || b[0] != 0x5A5A5A5Au) {
            uart_puts("heap readback FAILED\r\n"); return;
        }
        free(a); free(b);
        heap_stats(&f, &u, &n);
        uart_puts("after free blocks="); uart_hex(n); uart_puts("\r\n");
    }
    uart_puts("DDR HEAP OK\r\n");
}
