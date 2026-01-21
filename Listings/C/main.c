// Bare metal C program for RV32I
// Startup is handled by startup.s

// Memory-mapped peripheral addresses
// Update these to match your hardware
#define LED_BASE 0x80000004
#define RGB_LED_BASE 0x80000008
#define UART_BASE 0x8000000C
#define GPIO_BASE 0x80000010
#define GPIO_BASE_IN_OUT 0x80000014
#define INPUT 0x1
#define OUTPUT 0x0
#define UART_BASE 0x8000000C
#define Timer_BASE 0x80000000

char message[] = { "Ich bin ein char array\r\n" };

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

static inline void pin_mode(unsigned int pin, unsigned int in_out)
{
    unsigned int pin_modes = read_reg(GPIO_BASE_IN_OUT);
    // clear the pin'th bit in pinmodes and or it with in_out shifted to the pin'th position
    pin_modes = (pin_modes & ~(0b1 << pin)) | ((in_out & 0b1) << pin);
    write_reg(GPIO_BASE_IN_OUT, pin_modes);
}

static inline void set_pin(unsigned int pin, unsigned int pin_out)
{
    unsigned int pins_output = read_reg(GPIO_BASE);
    // clear the pin'th bit in pinmodes and or it with in_out shifted to the pin'th position
    pins_output = (pins_output & ~(0b1 << pin)) | ((pin_out & 0b1) << pin);
    write_reg(GPIO_BASE, pins_output);
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
    unsigned int rgb_leds = 0b101100;
    unsigned int leds = 0b1010;
    unsigned int output = 0;
    pin_mode(0, OUTPUT);

    print("Entered Main\r\n");
    print(message);
    
    // Main loop - runs forever
    unsigned int counter;
    while (1) {

        //write_reg(UART_BASE, counter);
        counter++;

        // Reset counter periodically
        if (counter > 255) {
            counter = 0;
            print("Counter reset\r\n");
            set_leds(leds);
            set_rgb_leds(rgb_leds);
            set_pin(0, output);
            output ^= 0b1;
            leds ^= 0b1111;
            rgb_leds ^= 0b111111;
        }

        delay(10000);
    }

    // Never reached
    return 0;
}