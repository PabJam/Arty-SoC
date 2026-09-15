/* ddr_check.c - software validation of the DDR3 heap and the ddr_port caches.
 *
 * The plain memtest cannot see cache bugs, because it writes every location
 * before reading any of them - so a stale or falsely-hit cache line still
 * happens to hold the right data. The tests below are ordered specifically to
 * break that: cold reads before any write, reads that alternate between the
 * cached read line and the dirty write line, and sub-word writes merged into a
 * line that is already dirty.
 */

#include "heap.h"
#include "printf.h"

#define PERIPH_STATUS (*(volatile unsigned int *)0x80000018)
#define DDR_BASE      0x40000000u
#define LINE          16u          /* bytes per DDR burst / cache line */

static int fails;

static void chk(const char* tag, unsigned int got, unsigned int exp)
{
    if (got != exp) {
        printf("  FAIL %s: expected %#010x got %#010x\r\n", tag, exp, got);
        fails++;
    }
}

/* 1. COLD READ.  Must run before anything writes to DDR.
 *    Catches a hit test that ignores the valid bit: after reset the tag
 *    register reads as zero, which is the real address of line 0, so a cold
 *    read of DDR_BASE would falsely hit and return the reset contents. */
static void t_cold_read(void)
{
    volatile unsigned int* p = (volatile unsigned int*)DDR_BASE;
    unsigned int a, b, c, d;

    a = p[0]; b = p[1]; c = p[2]; d = p[3];
    printf("  cold line0 = %08x %08x %08x %08x\r\n", a, b, c, d);

    /* Write a marker, read it back, and confirm the other words did not move.
     * If the cold read came from a bogus cache the values change here. */
    p[0] = 0x5A5A0001u;
    chk("cold w0 readback", p[0], 0x5A5A0001u);
    chk("cold w1 unchanged", p[1], b);
    chk("cold w2 unchanged", p[2], c);
    chk("cold w3 unchanged", p[3], d);
}

/* 2. WRITE LINE A, READ LINE B, READ BACK A.
 *    Catches a write cache that is never flushed before a read of the same
 *    line, and a read cache that keeps stale data for a line with dirty bytes. */
static void t_flush_replay(void)
{
    volatile unsigned int* a = (volatile unsigned int*)(DDR_BASE + 0x1000);
    volatile unsigned int* b = (volatile unsigned int*)(DDR_BASE + 0x2000);

    a[0] = 0xAAAA0000u;
    b[0] = 0xBBBB0000u;              /* evicts A's write line */
    chk("A after B", a[0], 0xAAAA0000u);
    chk("B still ok", b[0], 0xBBBB0000u);

    /* ping pong between two lines, each iteration evicting the other */
    for (unsigned int i = 0; i < 8; i++) {
        a[0] = 0xA0000000u + i;
        b[0] = 0xB0000000u + i;
        chk("pingpong A", a[0], 0xA0000000u + i);
        chk("pingpong B", b[0], 0xB0000000u + i);
    }
}

/* 3. SUB-WORD MERGE into an already dirty line.
 *    Catches a dirty mask accumulated with AND instead of OR, and a flush that
 *    writes the wrong mask or the wrong data. */
static void t_subword_merge(void)
{
    volatile unsigned int* w = (volatile unsigned int*)(DDR_BASE + 0x3000);
    volatile unsigned char* b = (volatile unsigned char*)(DDR_BASE + 0x3000);
    volatile unsigned short* h = (volatile unsigned short*)(DDR_BASE + 0x3000);

    w[0] = 0x00000000u;
    b[0] = 0x11; b[1] = 0x22; b[2] = 0x33; b[3] = 0x44;
    chk("byte merge same line", w[0], 0x44332211u);

    w[1] = 0x00000000u;
    h[2] = 0xBEEF; h[3] = 0xDEAD;          /* halfwords of word 1 */
    chk("half merge same line", w[1], 0xDEADBEEFu);

    /* force an eviction, then confirm the merged bytes actually reached DDR */
    *(volatile unsigned int*)(DDR_BASE + 0x4000) = 1;
    chk("byte merge after evict", w[0], 0x44332211u);
    chk("half merge after evict", w[1], 0xDEADBEEFu);

    /* Partial word: only bytes 0 and 2 of word 2 are rewritten, bytes 1 and 3
     * must survive the eviction.
     *   w[2] = 0x99887766 -> byte8=0x66 byte9=0x77 byte10=0x88 byte11=0x99
     *   b[8]=0xEE, b[10]=0xCC
     *   -> byte8=0xEE byte9=0x77 byte10=0xCC byte11=0x99 = 0x99CC77EE       */
    w[2] = 0x99887766u;
    *(volatile unsigned int*)(DDR_BASE + 0x5000) = 1;   /* evict */
    b[8] = 0xEE;
    b[10] = 0xCC;
    *(volatile unsigned int*)(DDR_BASE + 0x6000) = 1;   /* evict again */
    chk("partial byte mask", w[2], 0x99CC77EEu);
}

/* 4. MIRROR: write to the line currently held by the read cache.
 *    Catches a read cache that is not updated on a write hit. */
static void t_mirror(void)
{
    volatile unsigned int* p = (volatile unsigned int*)(DDR_BASE + 0x7000);

    p[0] = 0x11112222u;
    (void)p[0];                       /* pull the line into the read cache */
    p[1] = 0x33334444u;               /* write hit on the same line */
    chk("mirror w0", p[0], 0x11112222u);
    chk("mirror w1", p[1], 0x33334444u);
    p[0] = 0x55556666u;
    chk("mirror w0 again", p[0], 0x55556666u);
    chk("mirror w1 again", p[1], 0x33334444u);
}

/* 5. CROSSING LINE BOUNDARIES with a walking value. */
static void t_walk(void)
{
    volatile unsigned int* p = (volatile unsigned int*)(DDR_BASE + 0x8000);
    unsigned int i;

    for (i = 0; i < 64; i++) p[i] = 0xC0DE0000u + i;
    for (i = 0; i < 64; i++) chk("walk fwd", p[i], 0xC0DE0000u + i);
    for (i = 64; i-- > 0; )  chk("walk rev", p[i], 0xC0DE0000u + i);

    /* interleave two streams a line apart, which thrashes a single line cache */
    for (i = 0; i < 16; i++) {
        p[i] = 0x1000u + i;
        p[i + 32] = 0x2000u + i;
    }
    for (i = 0; i < 16; i++) {
        chk("stream a", p[i], 0x1000u + i);
        chk("stream b", p[i + 32], 0x2000u + i);
    }
}

/* 6. RV32M sanity check. volatile keeps GCC from folding these at compile
 *    time - without it the test proves nothing about the hardware. The
 *    divide-by-zero results are a RISC-V convention rather than arithmetic,
 *    so they are the ones worth checking. */
static void t_muldiv(void)
{
    volatile int a = 1000, b = 7, c = -1000, z = 0;
    volatile unsigned int ua = 0x80000000u, ub = 3u;

    chk("mul", (unsigned int)(a * b), 7000u);
    chk("div", (unsigned int)(a / b), 142u);
    chk("rem", (unsigned int)(a % b), 6u);
    chk("div neg", (unsigned int)(c / b), (unsigned int)-142);
    chk("rem neg", (unsigned int)(c % b), (unsigned int)-6);
    chk("div by 0", (unsigned int)(a / z), 0xFFFFFFFFu);
    chk("rem by 0", (unsigned int)(a % z), 1000u);
    chk("divu", ua / ub, 0x2AAAAAAAu);
    chk("remu", ua % ub, 2u);

    {
        volatile int min = (int)0x80000000, m1 = -1;
        chk("div overflow", (unsigned int)(min / m1), 0x80000000u);
        chk("rem overflow", (unsigned int)(min % m1), 0u);
    }

    {
        /* mulh family: force a 64 bit product and take the top word */
        volatile long long p;
        volatile int x = (int)0x12345678, y = (int)0x7ABCDEF0;
        p = (long long)x * (long long)y;
        chk("mulh", (unsigned int)(p >> 32), 0x08BA5F7Fu);
    }
}

/* 7. Classic bit level memtest, still worth running. */
static unsigned int ddr_memtest(unsigned int base, unsigned int words)
{
    volatile unsigned int* p = (volatile unsigned int*)base;
    unsigned int i;

    for (i = 0; i < words; i++) p[i] = base + (i << 2);
    for (i = 0; i < words; i++)
        if (p[i] != base + (i << 2)) return base + (i << 2);

    for (i = 0; i < 32; i++) {
        p[0] = 1u << i;
        if (p[0] != (1u << i)) return base;
    }
    return 0;
}

void ddr_report(void)
{
    unsigned int st, bad, f, u, n;

    fails = 0;

    st = PERIPH_STATUS;
    printf("calib=%u rst=%u err=%u\r\n", st & 1u, (st >> 1) & 1u, (st >> 2) & 1u);
    if (!(st & 1u)) { printf("DDR NOT CALIBRATED\r\n"); return; }

    printf("cold read...\r\n");    t_cold_read();
    printf("flush/replay...\r\n"); t_flush_replay();
    printf("subword merge...\r\n");t_subword_merge();
    printf("mirror...\r\n");       t_mirror();
    printf("walk...\r\n");         t_walk();
    printf("muldiv...\r\n");       t_muldiv();

    printf("memtest...\r\n");
    bad = ddr_memtest(DDR_BASE + 0x10000u, 1024);
    if (bad) { printf("  FAIL memtest at %#010x\r\n", bad); fails++; }

    heap_stats(&f, &u, &n);
    printf("heap free=%u used=%u blocks=%u\r\n", f, u, n);
    {
        unsigned int* a = (unsigned int*)malloc(256);
        unsigned int* b = (unsigned int*)malloc(1024);
        if (!a || !b) { printf("  FAIL malloc\r\n"); fails++; }
        else {
            a[0] = 0xA5A5A5A5u; b[0] = 0x5A5A5A5Au;
            chk("heap a", a[0], 0xA5A5A5A5u);
            chk("heap b", b[0], 0x5A5A5A5Au);
            free(a); free(b);
        }
    }

    if (st & 4u) { printf("  FAIL ddr_port error bit set\r\n"); fails++; }

    if (fails == 0) printf("DDR HEAP OK\r\n");
    else            printf("DDR TESTS FAILED: %d\r\n", fails);
}
