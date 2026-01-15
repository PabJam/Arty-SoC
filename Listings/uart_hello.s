# Simplest UART Hello World for RV32I
# UART address: 0x80000008

.section .text
.global _start

_start:
    # Load UART address (0x80000008)
    lui x10, 0x80000      # x10 = 0x80000000
    addi x10, x10, 8      # x10 = 0x80000008
    
    # Write 'H'
    li x11, 72
    sb x11, 0(x10)
    
    # Write 'e'
    li x11, 101
    sb x11, 0(x10)
    
    # Write 'l'
    li x11, 108
    sb x11, 0(x10)
    
    # Write 'l'
    li x11, 108
    sb x11, 0(x10)
    
    # Write 'o'
    li x11, 111
    sb x11, 0(x10)
    
    # Write ' '
    li x11, 32
    sb x11, 0(x10)
    
    # Write 'W'
    li x11, 87
    sb x11, 0(x10)
    
    # Write 'o'
    li x11, 111
    sb x11, 0(x10)
    
    # Write 'r'
    li x11, 114
    sb x11, 0(x10)
    
    # Write 'l'
    li x11, 108
    sb x11, 0(x10)
    
    # Write 'd'
    li x11, 100
    sb x11, 0(x10)
    
    # Write '!'
    li x11, 33
    sb x11, 0(x10)
    
done:
    ebreak