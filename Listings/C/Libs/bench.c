/* bench.c - cycle level benchmarks for the Arty SoC softcore.
 *
 * Two kinds of measurement:
 *
 *   MICRO   an exact instruction sequence built with .rept, measured at two
 *           different lengths so the loop overhead and the cost of reading the
 *           timer cancel exactly in the difference. What comes out is the
 *           marginal cost of one instruction, with no calibration guesswork.
 *
 *   MACRO   a realistic workload measured end to end. Useful for deciding what
 *           to optimise next, not for attributing cost to one instruction.
 *
 * The free running counter in TIMER_BASE ticks once per ui_clk at 81.25 MHz and
 * wraps every 52.9 s, so every measurement here must stay well under that.
 */

#include "Peripherals.h"
#include "printf.h"
#include "heap.h"

#define ITERS 256u          /* outer loop repetitions */
#define N_LO  16            /* short .rept length */
#define N_HI  48            /* long .rept length, difference is 32 ops */
#define N_DIFF (N_HI - N_LO)

static unsigned int bram_buf[512];
static unsigned int *ddr_buf;
static volatile unsigned int sink;

/* ------------------------------------------------------------------------ */
/* reporting                                                                 */
/* ------------------------------------------------------------------------ */

/* cycles per op to two decimals, without floating point */
static void report(const char *name, unsigned int cycles, unsigned int ops)
{
    unsigned int hundredths;

    if (ops == 0) { ops = 1; }
    hundredths = (cycles * 100u + ops / 2u) / ops;
    printf("  %-26s %8u cyc  %7u ops  %3u.%02u cyc/op\r\n",
           name, cycles, ops, hundredths / 100u, hundredths % 100u);
}

static void report_bytes(const char *name, unsigned int cycles, unsigned int bytes)
{
    /* MB/s = bytes * 81.25e6 / cycles / 1e6.  Rearranged to stay in 32 bits:
     * bytes and cycles are both modest, so scale by 8125 and divide by 100. */
    unsigned int mbps = 0;
    if (cycles != 0) { mbps = (bytes / 100u) * 8125u / cycles; }
    printf("  %-26s %8u cyc  %7u B   %5u MB/s\r\n", name, cycles, bytes, mbps);
}

/* ------------------------------------------------------------------------ */
/* micro benchmarks                                                          */
/*                                                                           */
/* Each one runs the same loop twice with different .rept counts. Everything  */
/* common to both - loop control, timer reads, call overhead - subtracts out. */
/* ------------------------------------------------------------------------ */

/* two levels so the macro argument is expanded before being stringified */
#define STR2(x) #x
#define STR(x) STR2(x)

/* The asm operand list needs a ':' between outputs and inputs, which cannot be
 * passed through a macro argument, so there is one variant per operand shape
 * rather than a single variadic macro. */
/* per_unit is how many instructions one .rept repetition emits. Getting this
 * wrong silently scales the result: a four instruction body reported as one op
 * reads as 4x the true cost per instruction. */
#define MICRO_BODY(name, per_unit, CLAUSES_LO, CLAUSES_HI)                     \
do {                                                                           \
    unsigned int t0, lo, hi;                                                   \
    unsigned int i;                                                            \
    t0 = read_timer();                                                         \
    for (i = 0; i < ITERS; i++) { CLAUSES_LO; }                                \
    lo = elapsed_cycles(t0);                                                   \
    t0 = read_timer();                                                         \
    for (i = 0; i < ITERS; i++) { CLAUSES_HI; }                                \
    hi = elapsed_cycles(t0);                                                   \
    report(name, hi - lo, ITERS * N_DIFF * (per_unit));                        \
} while (0)

#define REPT(n, body) ".rept " STR(n) "\n\t" body "\n\t.endr"

/* one read-write operand */
#define MICRO1(name, body, o0)                                                 \
    MICRO_BODY(name, 1,                                                        \
        __asm__ __volatile__(REPT(N_LO, body) : o0),                           \
        __asm__ __volatile__(REPT(N_HI, body) : o0))

/* one read-write operand, one read only operand */
#define MICRO2(name, body, o0, i0)                                             \
    MICRO_BODY(name, 1,                                                        \
        __asm__ __volatile__(REPT(N_LO, body) : o0 : i0),                      \
        __asm__ __volatile__(REPT(N_HI, body) : o0 : i0))

/* four independent read-write operands, four instructions per repetition */
#define MICRO4(name, body, o0, o1, o2, o3)                                     \
    MICRO_BODY(name, 4,                                                        \
        __asm__ __volatile__(REPT(N_LO, body) : o0, o1, o2, o3),               \
        __asm__ __volatile__(REPT(N_HI, body) : o0, o1, o2, o3))

static void micro_alu(void)
{
    register unsigned int a = 1, b = 2, c = 3, d = 4;

    printf("ALU and control flow\r\n");

    /* every instruction depends on the previous one: pure issue rate */
    MICRO1("dependent addi", "addi %0, %0, 1", "+r"(a));

    /* four independent chains: reveals any hazard the dependent case hides */
    MICRO4("independent addi x4",
           "addi %0,%0,1\n\taddi %1,%1,1\n\taddi %2,%2,1\n\taddi %3,%3,1",
           "+r"(a), "+r"(b), "+r"(c), "+r"(d));

    MICRO2("xor", "xor %0, %0, %1", "+r"(a), "r"(b));
    MICRO2("sll", "sll %0, %0, %1", "+r"(a), "r"(b));
    MICRO2("slt", "slt %0, %0, %1", "+r"(a), "r"(b));

    sink = a + b + c + d;
}

static void micro_branch(void)
{
    register unsigned int a = 0;

    printf("branches\r\n");

    /* never taken: condition is false every time */
    MICRO1("branch not taken", "bne %0, %0, 1f\n1:", "+r"(a));

    /* always taken, to the very next instruction. Costs a pipeline flush and
     * a refetch, so this is the real price of control flow here. */
    MICRO1("branch taken", "beq %0, %0, 1f\n1:", "+r"(a));

    sink = a;
}

static void micro_muldiv(void)
{
    register unsigned int a = 0x12345, b = 7;

    printf("RV32M\r\n");

    MICRO2("mul", "mul %0, %0, %1", "+r"(a), "r"(b));
    a = 0x7FFFFFFF;
    MICRO2("div", "div %0, %0, %1", "+r"(a), "r"(b));
    a = 0x7FFFFFFF;
    MICRO2("rem", "rem %0, %0, %1", "+r"(a), "r"(b));

    sink = a;
}

static void micro_bram(void)
{
    register unsigned int *p = bram_buf;
    register unsigned int a = 0;

    printf("BRAM memory\r\n");

    MICRO2("lw same address", "lw %0, 0(%1)", "=&r"(a), "r"(p));
    MICRO2("sw same address", "sw %0, 0(%1)", "+r"(a), "r"(p));

    sink = a;
}

/* ------------------------------------------------------------------------ */
/* memory workloads                                                          */
/*                                                                           */
/* These use C loops rather than .rept, because what matters is the access    */
/* pattern rather than one instruction's cost.                               */
/* ------------------------------------------------------------------------ */

static void bench_memory(void)
{
    unsigned int t0, dt, i;
    const unsigned int n = 4096;            /* words, 16 KB */
    unsigned int acc = 0;

    printf("memory patterns (%u KB working set)\r\n", (n * 4u) / 1024u);

    /* BRAM sequential read */
    t0 = read_timer();
    for (i = 0; i < 512u; i++) { acc += bram_buf[i]; }
    dt = elapsed_cycles(t0);
    report("BRAM seq read", dt, 512u);

    /* BRAM sequential write */
    t0 = read_timer();
    for (i = 0; i < 512u; i++) { bram_buf[i] = i; }
    dt = elapsed_cycles(t0);
    report("BRAM seq write", dt, 512u);

    if (ddr_buf == 0) { printf("  (no DDR buffer, skipping DDR tests)\r\n"); return; }

    /* DDR sequential write: four words per line should coalesce into one burst */
    t0 = read_timer();
    for (i = 0; i < n; i++) { ddr_buf[i] = i; }
    dt = elapsed_cycles(t0);
    report("DDR seq write", dt, n);
    report_bytes("DDR seq write", dt, n * 4u);

    /* DDR sequential read: three of four words should hit the read line */
    t0 = read_timer();
    for (i = 0; i < n; i++) { acc += ddr_buf[i]; }
    dt = elapsed_cycles(t0);
    report("DDR seq read", dt, n);
    report_bytes("DDR seq read", dt, n * 4u);

    /* DDR strided read, 64 byte stride guarantees a miss on every access */
    t0 = read_timer();
    for (i = 0; i < 256u; i++) { acc += ddr_buf[i * 16u]; }
    dt = elapsed_cycles(t0);
    report("DDR miss read (64B stride)", dt, 256u);

    /* DDR read modify write: the case that would thrash without mirroring */
    t0 = read_timer();
    for (i = 0; i < 1024u; i++) { ddr_buf[i] = ddr_buf[i] + 1u; }
    dt = elapsed_cycles(t0);
    report("DDR read-modify-write", dt, 1024u);

    sink = acc;
}

static void bench_copy(void)
{
    unsigned int t0, dt, i;
    const unsigned int n = 2048u;           /* words, 8 KB */

    printf("copies\r\n");

    t0 = read_timer();
    for (i = 0; i < 256u; i++) { bram_buf[i] = bram_buf[i + 256u]; }
    dt = elapsed_cycles(t0);
    report_bytes("BRAM -> BRAM", dt, 256u * 4u);

    if (ddr_buf == 0) { return; }

    t0 = read_timer();
    for (i = 0; i < 256u; i++) { ddr_buf[i] = bram_buf[i]; }
    dt = elapsed_cycles(t0);
    report_bytes("BRAM -> DDR", dt, 256u * 4u);

    t0 = read_timer();
    for (i = 0; i < 256u; i++) { bram_buf[i] = ddr_buf[i]; }
    dt = elapsed_cycles(t0);
    report_bytes("DDR -> BRAM", dt, 256u * 4u);

    t0 = read_timer();
    for (i = 0; i < n; i++) { ddr_buf[i + n] = ddr_buf[i]; }
    dt = elapsed_cycles(t0);
    report_bytes("DDR -> DDR", dt, n * 4u);
}

/* ------------------------------------------------------------------------ */
/* higher level workloads                                                    */
/* ------------------------------------------------------------------------ */

__attribute__((naked, noinline)) static unsigned int fib(unsigned int n)
{
    __asm__ volatile (
        "li      a5, 1\n\t"
        "bgtu    a0, a5, 1f\n\t"
        "ret\n"
        "1:\n\t"
        "addi    sp, sp, -16\n\t"
        "sw      ra, 12(sp)\n\t"
        "sw      s0, 8(sp)\n\t"
        "sw      s1, 4(sp)\n\t"
        "mv      s0, a0\n\t"
        "addi    a0, s0, -1\n\t"
        "jal     ra, fib\n\t"
        "mv      s1, a0\n\t"
        "addi    a0, s0, -2\n\t"
        "jal     ra, fib\n\t"
        "add     a0, s1, a0\n\t"
        "lw      ra, 12(sp)\n\t"
        "lw      s0, 8(sp)\n\t"
        "lw      s1, 4(sp)\n\t"
        "addi    sp, sp, 16\n\t"
        "ret\n"
        );
}

static void bench_workloads(void)
{
    unsigned int t0, dt, i;
    char buf[64];

    printf("workloads\r\n");

    /* recursion: exercises jal, jalr, and the stack in BRAM */
    /* fib(18) makes 2*fib(19)-1 = 8361 calls, so this is cycles per call */
    t0 = read_timer();
    sink = fib(18u);
    dt = elapsed_cycles(t0);
    report("fib(18) per call", dt, 8361u);

    /* formatting: decimal conversion plus a lot of branching */
    t0 = read_timer();
    for (i = 0; i < 64u; i++) { snprintf(buf, sizeof buf, "%d %x %s", (int)i, i, "abc"); }
    dt = elapsed_cycles(t0);
    report("snprintf", dt, 64u);

    /* heap churn: the block table lives in BRAM, the payload in DDR */
    t0 = read_timer();
    for (i = 0; i < 64u; i++) {
        void *p = malloc(128u);
        free(p);
    }
    dt = elapsed_cycles(t0);
    report("malloc + free", dt, 64u);
}

/* ------------------------------------------------------------------------ */

void run_benchmarks(void)
{
    unsigned int t0, overhead;

    printf("\r\n==== softcore benchmarks, %u Hz ====\r\n", CLOCK_FREQ_HZ);

    /* how much does one timer read plus loop control cost? Informational only,
     * the MICRO macro cancels it by differencing. */
    t0 = read_timer();
    overhead = elapsed_cycles(t0);
    printf("timer read overhead: %u cycles\r\n\r\n", overhead);

    ddr_buf = (unsigned int *)malloc(64u * 1024u);
    if (ddr_buf == 0) { printf("WARNING: DDR alloc failed\r\n"); }

    micro_alu();
    micro_branch();
    micro_muldiv();
    micro_bram();
    bench_memory();
    bench_copy();
    bench_workloads();

    if (ddr_buf != 0) { free(ddr_buf); }
    printf("==== done ====\r\n");
}
