/* Linker script for bare metal RV32I C programs */

ENTRY(_start)

MEMORY
{
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 131072
}

SECTIONS
{
    .text : {
        KEEP(*(.text.start))  /* Startup code goes first */
        *(.text*)             /* All other code */
        *(.rodata*)           /* Read-only data (constants) */
    } > RAM
    
    .data : {
        _data_start = .;
        *(.data*)             /* Initialized global variables */
        _data_end = .;
    } > RAM
    
    .bss : {
        _bss_start = .;
        *(.bss*)              /* Uninitialized global variables */
        *(COMMON)
        _bss_end = .;
    } > RAM
    
    /* Stack pointer initialization value */
    _stack_top = ORIGIN(RAM) + LENGTH(RAM);
}