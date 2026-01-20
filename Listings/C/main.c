// Bare metal C program for RV32I
// Startup is handled by startup.s

// Memory-mapped peripheral addresses
// Update these to match your hardware
#define UART_BASE 0x80000008

// Write to memory-mapped register
static inline void write_reg(unsigned int addr, unsigned int value) {
    *((volatile unsigned int*)addr) = value;
}

// Read from memory-mapped register
static inline unsigned int read_reg(unsigned int addr) {
    return *((volatile unsigned int*)addr);
}

// print message up to 255 char
void print(const char* msg)
{
    int idx = 0;
    while (true)
    {
        if (msg[idx] == 0 || idx > 255) { return; }   
        write_reg(UART_BASE, (int)(msg[idx]));
        idx++;
    }
}

// Simple delay function
void delay(int count) {
    for (volatile int i = 0; i < count; i++) {
        // Busy wait
    }
}

// Main function - called by startup.s
int main(void) {
    unsigned int counter = 0;
    print("Entered Main\r\n");
    // Main loop - runs forever
    while (1) {

        //write_reg(UART_BASE, counter);
        counter++;

        // Reset counter periodically
        if (counter > 255) {
            counter = 0;
            print("Reset\r\n");
        }

        delay(100000);
    }

    // Never reached
    return 0;
}