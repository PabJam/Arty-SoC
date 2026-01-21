.section .text.start
.global _start

_start:
    # Initialize stack pointer to 0x00020000 (just past end of 128KB RAM)
    lui sp, %hi(_stack_top)
    addi sp, sp, %lo(_stack_top)
    
    # Clear BSS section (uninitialized global variables)
    lui a0, %hi(_bss_start)
    addi a0, a0, %lo(_bss_start)
    lui a1, %hi(_bss_end)
    addi a1, a1, %lo(_bss_end)
    
clear_bss:
    beq a0, a1, bss_done
    sw zero, 0(a0)
    addi a0, a0, 4
    j clear_bss
    
bss_done:
    # Call main function
    call main
    
    # If main returns, loop forever
_halt:
    j _halt