/* heap.c - malloc/free for the RV32I softcore.
 *
 * The payload lives in DDR3 at 0x4000_0000. The BOOKKEEPING DOES NOT.
 *
 * Why: a conventional allocator puts a header immediately before every block,
 * so malloc and free walk a linked list scattered through the heap. On this
 * machine each 32-bit DDR access is a full round trip - roughly 20 to 40
 * ui_clk cycles - against about 3 cycles for BRAM. Walking headers in DDR
 * would make allocation an order of magnitude slower than it needs to be.
 *
 * So the block table is a plain array in .bss (BRAM) and the heap itself holds
 * nothing but user data. Cost is a fixed ceiling on live allocations
 * (HEAP_MAX_BLOCKS) and 16 bytes of BRAM per table entry.
 *
 * Strategy: first fit, split on allocate, coalesce with both neighbours on
 * free. The table is kept sorted by address so coalescing is a neighbour
 * check rather than a search.
 *
 * No multiply or divide on variables anywhere - this core is RV32I with no M
 * extension, and a runtime multiply would pull in a libgcc call.
 */

#include "heap.h"

/* Address arithmetic type. 32 bits on the target; the host test widens it. */
#ifndef HEAP_ADDR_T
#define HEAP_ADDR_T unsigned int
#endif
typedef HEAP_ADDR_T haddr_t;

extern char _heap_start;
extern char _heap_end;

#define HEAP_MAX_BLOCKS 64
#define HEAP_ALIGN      8          /* power of two, keeps doubles happy */

typedef struct {
    haddr_t      addr;             /* start address of the region   */
    unsigned int size;             /* size in bytes                 */
    unsigned int used;             /* 0 = free, 1 = allocated       */
    unsigned int pad;              /* keeps the entry a power of two */
} block_t;

static block_t blocks[HEAP_MAX_BLOCKS];
static int     nblocks = 0;
static int     inited  = 0;

static haddr_t align_up(haddr_t v)
{
    return (v + (HEAP_ALIGN - 1)) & ~((haddr_t)(HEAP_ALIGN - 1));
}

void heap_init(void)
{
    haddr_t start = align_up((haddr_t)&_heap_start);
    haddr_t end   = (haddr_t)&_heap_end;

    blocks[0].addr = start;
    blocks[0].size = end - start;
    blocks[0].used = 0;
    nblocks = 1;
    inited  = 1;
}

/* insert a fresh entry at index i, shifting the tail up */
static int table_insert(int i)
{
    int k;
    if (nblocks >= HEAP_MAX_BLOCKS) return 0;
    for (k = nblocks; k > i; k--) blocks[k] = blocks[k - 1];
    nblocks++;
    return 1;
}

/* remove entry i, shifting the tail down */
static void table_remove(int i)
{
    int k;
    for (k = i; k < nblocks - 1; k++) blocks[k] = blocks[k + 1];
    nblocks--;
}

void *malloc(unsigned int n)
{
    int i;
    unsigned int want;

    if (!inited) heap_init();
    if (n == 0) return 0;

    want = align_up(n);
    if (want < n) return 0;                 /* size overflowed */

    for (i = 0; i < nblocks; i++) {
        if (blocks[i].used) continue;
        if (blocks[i].size < want) continue;

        if (blocks[i].size == want) {
            blocks[i].used = 1;
            return (void *)blocks[i].addr;
        }

        /* split: [i] becomes the allocation, [i+1] the remainder */
        if (!table_insert(i + 1)) {
            /* table full - hand over the whole block rather than fail */
            blocks[i].used = 1;
            return (void *)blocks[i].addr;
        }
        blocks[i + 1].addr = blocks[i].addr + want;
        blocks[i + 1].size = blocks[i].size - want;
        blocks[i + 1].used = 0;

        blocks[i].size = want;
        blocks[i].used = 1;
        return (void *)blocks[i].addr;
    }

    return 0;                               /* out of memory */
}

void free(void *p)
{
    int i;
    haddr_t a = (haddr_t)p;

    if (p == 0) return;

    for (i = 0; i < nblocks; i++) {
        if (blocks[i].addr != a) continue;
        if (!blocks[i].used) return;        /* double free, ignore */

        blocks[i].used = 0;

        /* coalesce forward */
        if (i + 1 < nblocks && !blocks[i + 1].used) {
            blocks[i].size += blocks[i + 1].size;
            table_remove(i + 1);
        }
        /* coalesce backward */
        if (i > 0 && !blocks[i - 1].used) {
            blocks[i - 1].size += blocks[i].size;
            table_remove(i);
        }
        return;
    }
    /* not a live allocation - ignore */
}

void *calloc(unsigned int count, unsigned int size)
{
    /* no runtime multiply on RV32I: repeated addition, with overflow check */
    unsigned int total = 0;
    unsigned int i;
    char *p;

    for (i = 0; i < count; i++) {
        unsigned int next = total + size;
        if (next < total) return 0;         /* overflow */
        total = next;
    }

    p = (char *)malloc(total);
    if (p) {
        unsigned int *w = (unsigned int *)p;
        unsigned int nwords = total >> 2;
        for (i = 0; i < nwords; i++) w[i] = 0;
        for (i = nwords << 2; i < total; i++) p[i] = 0;
    }
    return p;
}

void heap_stats(unsigned int *free_bytes,
                unsigned int *used_bytes,
                unsigned int *n_blocks)
{
    int i;
    unsigned int f = 0, u = 0;

    if (!inited) heap_init();

    for (i = 0; i < nblocks; i++) {
        if (blocks[i].used) u += blocks[i].size;
        else                f += blocks[i].size;
    }
    if (free_bytes) *free_bytes = f;
    if (used_bytes) *used_bytes = u;
    if (n_blocks)   *n_blocks   = (unsigned int)nblocks;
}
