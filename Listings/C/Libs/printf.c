/* printf.c - freestanding formatted output for the RV32I softcore.
 *
 * No libc, no FPU, and crucially NO HARDWARE DIVIDE. This core is RV32I with
 * no M extension, so every `/` or `%` on a variable becomes a call into
 * libgcc's __divsi3 / __modsi3, which is a 32-iteration shift-subtract loop.
 * Converting one 10-digit number that way costs ten of them.
 *
 * Decimal conversion here uses a shift-and-add reciprocal instead: udiv10()
 * below is branch-free apart from one correction and compiles to a handful of
 * shifts and adds. Hex, octal and binary are pure shifts.
 *
 * Supported: %d %i %u %x %X %o %b %c %s %p %%
 *            flags  - 0 + space #
 *            width  number or *
 *            prec   .number or .*
 *            length h hh l z   (accepted and ignored: all 32-bit here)
 *
 * NOT supported: %f %e %g (no FPU), %lld / %llu (no 64-bit paths).
 *
 * You must supply uart_putc():
 *
 *     void uart_putc(char c) {
 *         while (get_uart_fifo_full());
 *         write_reg(UART_BASE, (int)c);
 *     }
 */

#include "printf.h"
#include <stdarg.h>

extern void uart_putc(char c);

/* ---------------------------------------------------------------------- */
/* divide by 10 with shifts and adds only                                  */
/* ---------------------------------------------------------------------- */
static unsigned int udiv10(unsigned int n)
{
    unsigned int q, r;

    q = (n >> 1) + (n >> 2);       /* q ~= n * 0.75            */
    q = q + (q >> 4);              /*      * 1.0625            */
    q = q + (q >> 8);
    q = q + (q >> 16);
    q = q >> 3;                    /* q ~= n / 10              */

    r = n - ((q << 3) + (q << 1)); /* r = n - q*10             */
    return q + (r > 9);            /* correct the estimate     */
}

static unsigned int umod10(unsigned int n)
{
    unsigned int q = udiv10(n);
    return n - ((q << 3) + (q << 1));
}

/* ---------------------------------------------------------------------- */
/* output sinks                                                            */
/* ---------------------------------------------------------------------- */
typedef struct {
    char* buf;      /* 0 for the UART sink */
    unsigned int cap;
    unsigned int len;      /* characters that would have been written */
} sink_t;

static void emit(sink_t* s, char c)
{
    if (s->buf) {
        if (s->len + 1 < s->cap) {
            s->buf[s->len] = c;
        }
    }
    else {
        uart_putc(c);
    }
    s->len++;
}

/* ---------------------------------------------------------------------- */
/* integer to digits, written backwards into tmp                           */
/* ---------------------------------------------------------------------- */
static int digits(char* tmp, unsigned int v, unsigned int base, int upper)
{
    const char* lo = "0123456789abcdef";
    const char* up = "0123456789ABCDEF";
    const char* d = upper ? up : lo;
    int n = 0;

    if (v == 0) {
        tmp[n++] = '0';
        return n;
    }

    switch (base) {
    case 10: {
        while (v) {
            tmp[n++] = (char)('0' + umod10(v));
            v = udiv10(v);
        }
        break;
    }
    case 16: {
        while (v) {
            tmp[n++] = d[v & 15u];
            v >>= 4;
        }
        break;
    }
    case 8: {
        while (v) {
            tmp[n++] = (char)('0' + (v & 7u));
            v >>= 3;
        }
        break;
    }
    case 2: {
        while (v) {
            tmp[n++] = (char)('0' + (v & 1u));
            v >>= 1;
        }
        break;
    }
    default: {
        tmp[n++] = '?';
        break;
    }
    }

    return n;
}

/* ---------------------------------------------------------------------- */
/* core formatter                                                          */
/* ---------------------------------------------------------------------- */
#define FL_LEFT  0x01
#define FL_ZERO  0x02
#define FL_PLUS  0x04
#define FL_SPACE 0x08
#define FL_HASH  0x10

static void pad(sink_t* s, char c, int n)
{
    while (n-- > 0) {
        emit(s, c);
    }
}

static int vfmt(sink_t* s, const char* fmt, va_list ap)
{
    char tmp[34];

    while (*fmt) {
        int flags = 0, width = 0, prec = -1;
        unsigned int base = 10;
        int upper = 0, isneg = 0, n, padlen, signlen;
        char sign = 0;
        const char* pre = "";
        unsigned int uv = 0;
        const char* str = 0;
        int slen = 0;

        if (*fmt != '%') {
            emit(s, *fmt++);
            continue;
        }
        fmt++;

        if (*fmt == '%') {
            emit(s, '%');
            fmt++;
            continue;
        }

        /* flags */
        for (;;) {
            if (*fmt == '-') {
                flags |= FL_LEFT;
                fmt++;
            }
            else if (*fmt == '0') {
                flags |= FL_ZERO;
                fmt++;
            }
            else if (*fmt == '+') {
                flags |= FL_PLUS;
                fmt++;
            }
            else if (*fmt == ' ') {
                flags |= FL_SPACE;
                fmt++;
            }
            else if (*fmt == '#') {
                flags |= FL_HASH;
                fmt++;
            }
            else {
                break;
            }
        }

        /* width */
        if (*fmt == '*') {
            width = va_arg(ap, int);
            if (width < 0) {
                flags |= FL_LEFT;
                width = -width;
            }
            fmt++;
        }
        else {
            while (*fmt >= '0' && *fmt <= '9') {
                width = (width << 3) + (width << 1) + (*fmt - '0');
                fmt++;
            }
        }

        /* precision */
        if (*fmt == '.') {
            fmt++;
            prec = 0;
            if (*fmt == '*') {
                prec = va_arg(ap, int);
                if (prec < 0) {
                    prec = -1;
                }
                fmt++;
            }
            else {
                while (*fmt >= '0' && *fmt <= '9') {
                    prec = (prec << 3) + (prec << 1) + (*fmt - '0');
                    fmt++;
                }
            }
        }

        /* length modifiers: everything is 32-bit here, so just skip them */
        while (*fmt == 'h' || *fmt == 'l' || *fmt == 'z' || *fmt == 'j' || *fmt == 't') {
            fmt++;
        }

        switch (*fmt) {
        case 'd':
        case 'i': {
            int sv = va_arg(ap, int);
            if (sv < 0) {
                isneg = 1;
                uv = (unsigned int)(-(sv + 1)) + 1u;
            }
            else {
                uv = (unsigned int)sv;
            }
            base = 10;
            break;
        }
        case 'u': {
            uv = va_arg(ap, unsigned int);
            base = 10;
            break;
        }
        case 'x': {
            uv = va_arg(ap, unsigned int);
            base = 16;
            if (flags & FL_HASH) {
                pre = "0x";
            }
            break;
        }
        case 'X': {
            uv = va_arg(ap, unsigned int);
            base = 16;
            upper = 1;
            if (flags & FL_HASH) {
                pre = "0X";
            }
            break;
        }
        case 'o': {
            uv = va_arg(ap, unsigned int);
            base = 8;
            if (flags & FL_HASH) {
                pre = "0";
            }
            break;
        }
        case 'b': {
            uv = va_arg(ap, unsigned int);
            base = 2;
            if (flags & FL_HASH) {
                pre = "0b";
            }
            break;
        }
        case 'p': {
            uv = va_arg(ap, unsigned int);
            base = 16;
            pre = "0x";
            if (prec < 0) {
                prec = 8;
            }
            break;
        }
        case 'c': {
            char c = (char)va_arg(ap, int);
            if (!(flags & FL_LEFT)) {
                pad(s, ' ', width - 1);
            }
            emit(s, c);
            if (flags & FL_LEFT) {
                pad(s, ' ', width - 1);
            }
            fmt++;
            continue;
        }
        case 's': {
            str = va_arg(ap, const char*);
            if (!str) {
                str = "(null)";
            }
            while (str[slen] && (prec < 0 || slen < prec)) {
                slen++;
            }
            if (!(flags & FL_LEFT)) {
                pad(s, ' ', width - slen);
            }
            for (n = 0; n < slen; n++) {
                emit(s, str[n]);
            }
            if (flags & FL_LEFT) {
                pad(s, ' ', width - slen);
            }
            fmt++;
            continue;
        }
        case 0: {
            return (int)s->len;
        }
        default: {
            emit(s, '%');
            emit(s, *fmt++);
            continue;
        }
        }
        fmt++;

        /* ---- numeric output ---- */
        n = digits(tmp, uv, base, upper);

        if (isneg) {
            sign = '-';
        }
        else if (flags & FL_PLUS) {
            sign = '+';
        }
        else if (flags & FL_SPACE) {
            sign = ' ';
        }
        signlen = sign ? 1 : 0;

        /* "%.0d" of zero prints nothing */
        if (prec == 0 && uv == 0) {
            n = 0;
        }

        {
            int zeros = (prec > n) ? (prec - n) : 0;
            int prelen = 0;
            while (pre[prelen]) {
                prelen++;
            }

            /* '0' flag is ignored when an explicit precision is given */
            if ((flags & FL_ZERO) && !(flags & FL_LEFT) && prec < 0) {
                int room = width - n - signlen - prelen;
                if (room > 0) {
                    zeros += room;
                }
            }

            padlen = width - n - zeros - signlen - prelen;

            if (!(flags & FL_LEFT)) {
                pad(s, ' ', padlen);
            }
            if (sign) {
                emit(s, sign);
            }
            {
                int k;
                for (k = 0; k < prelen; k++) {
                    emit(s, pre[k]);
                }
            }
            pad(s, '0', zeros);
            while (n-- > 0) {
                emit(s, tmp[n]);
            }
            if (flags & FL_LEFT) {
                pad(s, ' ', padlen);
            }
        }
    }

    return (int)s->len;
}

/* ---------------------------------------------------------------------- */
/* public entry points                                                     */
/* ---------------------------------------------------------------------- */
int printf(const char* fmt, ...)
{
    sink_t s;
    va_list ap;
    int r;

    s.buf = 0;
    s.cap = 0;
    s.len = 0;

    va_start(ap, fmt);
    r = vfmt(&s, fmt, ap);
    va_end(ap);

    return r;
}

int snprintf(char* buf, unsigned int size, const char* fmt, ...)
{
    sink_t s;
    va_list ap;
    int r;

    s.buf = buf;
    s.cap = size;
    s.len = 0;

    va_start(ap, fmt);
    r = vfmt(&s, fmt, ap);
    va_end(ap);

    if (size) {
        buf[(s.len < size - 1) ? s.len : size - 1] = '\0';
    }

    return r;
}

int puts(const char* str)
{
    int n = 0;
    while (str[n]) {
        uart_putc(str[n++]);
    }
    uart_putc('\r');
    uart_putc('\n');

    return n + 2;
}