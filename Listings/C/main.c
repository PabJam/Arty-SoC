// Bare metal C program for RV32I
// Startup is handled by startup.s

// Memory-mapped peripheral addresses
// Update these to match your hardware
#define LED_BASE 0x80000004
#define RGB_LED_BASE 0x80000008
#define UART_BASE 0x8000000C
#define Timer_BASE 0x80000000

char message[] = { "Ich bin ein char array" };

// Write to memory-mapped register
static inline void write_reg(unsigned int addr, unsigned int value) {
    *((volatile unsigned int*)addr) = value;
}

// Read from memory-mapped register
static inline unsigned int read_reg(unsigned int addr) {
    return *((volatile unsigned int*)addr);
}

static inline unsigned int read_timer()
{
    return read_reg(Timer_BASE);
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

// lowest 4 bits respond to 4 leds
static inline void set_leds(unsigned int leds)
{
    write_reg(LED_BASE, leds);
}

// bits : 5 => r1, 4 => g1, 3 => b1, 2 => r0, 1 => g0, 0 => b0  
static inline void set_rgb_leds(unsigned int rgb_leds)
{
    write_reg(RGB_LED_BASE, rgb_leds);
}

void print_int(unsigned int val)
{
    write_reg(UART_BASE, val >> 24);
    write_reg(UART_BASE, val >> 16);
    write_reg(UART_BASE, val >> 8);
    write_reg(UART_BASE, val);
}

// Simple delay function
void delay(int count) {
    for (volatile int i = 0; i < count; i++) {
        // Busy wait
    }
}

// Main function - called by startup.s
int main(void) {

    print("Entered Main\r\n");
    print(message);
    set_leds(0b1010);
    set_rgb_leds(0b101100);
    
    return 0;
    // Main loop - runs forever
    unsigned int counter;
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