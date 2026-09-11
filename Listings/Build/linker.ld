/* Linker script for bare metal RV32I C programs
 *
 * Memory map matches the SoC address decode:
 *   0x0000_0000  BRAM   128 KB   text, rodata, data, bss, stack
 *   0x4000_0000  DDR3   256 MB   heap
 *   0x8000_0000  peripherals
 *
 * Only the BRAM contents end up in the .bin that the UART bootloader writes,
 * because the heap symbols below are plain addresses, not an output section.
 * That keeps the image small - a NOLOAD .heap section spanning 256 MB risks
 * objcopy padding the binary out to 256 MB.
 */

ENTRY(_start)

MEMORY
{
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 128K
    DDR (rw)  : ORIGIN = 0x40000000, LENGTH = 256M
}

SECTIONS
{
    .text : {
        KEEP(*(.text.start))  /* Startup code goes first */
        *(.text*)             /* All other code */
        *(.rodata*)           /* Read-only data (constants) */
        . = ALIGN(4);
    } > RAM

    .data : {
        . = ALIGN(4);
        _data_start = .;
        *(.data*)             /* Initialized global variables */
        . = ALIGN(4);
        _data_end = .;
    } > RAM

    .bss (NOLOAD) : {
        . = ALIGN(4);         /* startup clears this with sw, must be word */
        _bss_start = .;
        *(.bss*)              /* Uninitialized global variables */
        *(COMMON)
        . = ALIGN(4);         /* aligned end too, or the beq loop overruns */
        _bss_end = .;
    } > RAM

    /* Stack pointer initialisation value: top of BRAM, grows down */
    _stack_top = ORIGIN(RAM) + LENGTH(RAM);

    /* Heap lives in DDR3. Symbols only - nothing is loaded there. */
    _heap_start = ORIGIN(DDR);
    _heap_end   = ORIGIN(DDR) + LENGTH(DDR);

    /DISCARD/ : {
        *(.comment)
        *(.note*)
        *(.eh_frame*)
        *(.riscv.attributes)
    }
}
