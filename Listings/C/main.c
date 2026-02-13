#include ".\Libs\Peripherals.h"

// Bare metal C program for RV32I
// Startup is handled by startup.s

const unsigned int heart[] = {
  0x3184a444,
  0x44042081,
  0x100a0040,
  66
};


// Main function - called by startup.s
int main(void) {
    print("Counter before: ");
    unsigned int tx_count = get_i2c_slave_tx_counter();
    print_int(tx_count);
    set_i2c_slave_tx(heart[0]);
    print("\r\nCounter after: ");
    tx_count = get_i2c_slave_tx_counter();
    print_int(tx_count);
     

    while (1) {
        wait_ms(3000);
    }

    // Never reached
    return 0;
}