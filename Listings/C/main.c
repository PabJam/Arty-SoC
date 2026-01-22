#include "Peripherals.h"

// Bare metal C program for RV32I
// Startup is handled by startup.s

char message[] = { "I get saved in the data section\r\n" };
unsigned int counter; // shoulb be placed in bss

// Main function - called by startup.s
int main(void) {
    unsigned int rgb_leds = 0b101100;
    unsigned int leds = 0b1010;
    unsigned int output = 0;
    pin_mode(0, OUTPUT);

    print("Entered Main\r\n");
    print(message);
    
    // Main loop - runs forever
    
    while (1) {
        counter++;

        if (counter > 255) {
            counter = 0;
            print("Counter reset\r\n");
            set_leds(leds);
            set_rgb_leds(rgb_leds);
            set_pin(0, output);
            output ^= 0b1;
            leds ^= 0b1111;
            rgb_leds ^= 0b111111;

            wait_ms(3000);
        }

        
    }

    // Never reached
    return 0;
}