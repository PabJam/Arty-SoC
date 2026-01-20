// Bare metal C program for RV32I
// Startup is handled by startup.s

// Memory-mapped peripheral addresses
// Update these to match your hardware
#define UART_BASE 0x80000008

// Simple delay function
void delay(int count) {
    for (volatile int i = 0; i < count; i++) {
        // Busy wait
    }
}

// Write to memory-mapped register
static inline void write_reg(unsigned int addr, unsigned int value) {
    *((volatile unsigned int*)addr) = value;
}

// Read from memory-mapped register
static inline unsigned int read_reg(unsigned int addr) {
    return *((volatile unsigned int*)addr);
}

// Main function - called by startup.s
int main(void) {
    unsigned int counter = 0;

    // Main loop - runs forever
    while (1) {

        write_reg(UART_BASE, counter);
        counter++;

        // Reset counter periodically
        if (counter > 255) {
            counter = 0;
        }

        delay(100000);
    }

    // Never reached
    return 0;
}