/* Linker script for bare metal RV32I */

MEMORY
{
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 65536
}

SECTIONS
{
    .text : {
        *(.text*)
    } > RAM
    
    .data : {
        *(.data*)
    } > RAM
    
    .bss : {
        *(.bss*)
    } > RAM
}