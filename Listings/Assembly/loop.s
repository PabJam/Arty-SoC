# Simplest for loop for RV32I

.section .text
.global _start

_start:
    # Load UART address (0x80000008)
    lui x10, 0x80000      # x10 = 0x80000000
    addi x10, x10, 8      # x10 = 0x80000008

    li x5, 0          # Initialize counter register to 0
    li x6, 10         # Set loop limit to 10

loop:
    addi x5, x5, 1    # Increment counter
    blt x5, x6, loop  # Branch if x5 < x6

    sb x5, 0(x10)
    
done:
    ebreak