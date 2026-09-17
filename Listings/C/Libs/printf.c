/* printf.c - formatted output for RV32IM softcore.
 *
 * Freestanding, no libc, no FPU.
 * Uses RV32IM hardware multiply/divide instructions (mul, mulh, divu, remu).
 *
 * Supported: %d %i %u %x %X %o %b %c %s %p %%
 *            flags   - 0 + space #
 *            width   number or *
 *            prec    .number or .*
 *            length  h, hh, l, z, t (32-bit), ll, j (64-bit)
 *
 * Supply uart_putc():
 *     void uart_putc(char c);
 */

#include "printf.h"
#include <stdarg.h>

extern void uart_putc(char c);

/* ---------------------------------------------------------------------- */
/* output sinks                                                           */
/* ---------------------------------------------------------------------- */
typedef struct {
    char* buf;      /* 0 for UART sink */
    unsigned int cap;
    unsigned int len;
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
/* integer to digits (uses RV32IM hardware division / bit shifts)         */
/* ---------------------------------------------------------------------- */
static int digits(char* tmp, unsigned long long v, unsigned int base, int upper)
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
            tmp[n++] = (char)('0' + (v % 10ULL));
            v /= 10ULL;
        }
        break;
    }
    case 16: {
        while (v) {
            tmp[n++] = d[v & 15ULL];
            v >>= 4;
        }
        break;
    }
    case 8: {
        while (v) {
            tmp[n++] = (char)('0' + (v & 7ULL));
            v >>= 3;
        }
        break;
    }
    case 2: {
        while (v) {
            tmp[n++] = (char)('0' + (v & 1ULL));
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
/* core formatter                                                         */
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
    char tmp[66]; /* fits 64 binary digits + null/sign */

    while (*fmt) {
        int flags = 0, width = 0, prec = -1;
        unsigned int base = 10;
        int upper = 0, isneg = 0, is64 = 0, n, padlen, signlen;
        char sign = 0;
        const char* pre = "";
        unsigned long long uv = 0;
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
                width = width * 10 + (*fmt - '0');
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
                    prec = prec * 10 + (*fmt - '0');
                    fmt++;
                }
            }
        }

        /* length modifiers */
        while (*fmt == 'h' || *fmt == 'l' || *fmt == 'z' || *fmt == 'j' || *fmt == 't') {
            if (*fmt == 'l') {
                if (*(fmt + 1) == 'l') {
                    is64 = 1;
                    fmt += 2;
                    continue;
                }
            }
            else if (*fmt == 'j') {
                is64 = 1; /* intmax_t */
            }
            fmt++;
        }

        switch (*fmt) {
        case 'd':
        case 'i': {
            if (is64) {
                long long sv = va_arg(ap, long long);
                if (sv < 0) {
                    isneg = 1;
                    uv = (unsigned long long)(-(sv + 1)) + 1ULL;
                }
                else {
                    uv = (unsigned long long)sv;
                }
            }
            else {
                int sv = va_arg(ap, int);
                if (sv < 0) {
                    isneg = 1;
                    uv = (unsigned long long)(unsigned int)(-(sv + 1)) + 1ULL;
                }
                else {
                    uv = (unsigned long long)(unsigned int)sv;
                }
            }
            base = 10;
            break;
        }
        case 'u': {
            if (is64) {
                uv = va_arg(ap, unsigned long long);
            }
            else {
                uv = va_arg(ap, unsigned int);
            }
            base = 10;
            break;
        }
        case 'x': {
            if (is64) {
                uv = va_arg(ap, unsigned long long);
            }
            else {
                uv = va_arg(ap, unsigned int);
            }
            base = 16;
            if (flags & FL_HASH) {
                pre = "0x";
            }
            break;
        }
        case 'X': {
            if (is64) {
                uv = va_arg(ap, unsigned long long);
            }
            else {
                uv = va_arg(ap, unsigned int);
            }
            base = 16;
            upper = 1;
            if (flags & FL_HASH) {
                pre = "0X";
            }
            break;
        }
        case 'o': {
            if (is64) {
                uv = va_arg(ap, unsigned long long);
            }
            else {
                uv = va_arg(ap, unsigned int);
            }
            base = 8;
            if (flags & FL_HASH) {
                pre = "0";
            }
            break;
        }
        case 'b': {
            if (is64) {
                uv = va_arg(ap, unsigned long long);
            }
            else {
                uv = va_arg(ap, unsigned int);
            }
            base = 2;
            if (flags & FL_HASH) {
                pre = "0b";
            }
            break;
        }
        case 'p': {
            uv = (unsigned long long)(unsigned long)va_arg(ap, void*);
            base = 16;
            pre = "0x";
            if (prec < 0) {
                prec = (int)(sizeof(void*) * 2);
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
/* public entry points                                                    */
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