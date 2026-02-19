#include ".\Libs\Peripherals.h"
#include ".\Libs\Bad_Apple_Data.h"

// Bare metal C program for RV32I
// Startup is handled by startup.s

const unsigned int heart[] = {
  0x3184a444,
  0x44042081,
  0x100a0040,
};


// Main function - called by startup.s
int main(void) {
    char tx_count = 0;
    unsigned int frame_cnt = 0;
    print("Bad Apple stream over I2C started\r\n");
    set_i2c_slave_tx(bmp[frame_cnt]);
    frame_cnt++;

    while (1) {
        tx_count = get_i2c_slave_tx_counter();
        if (tx_count == 0)
        {
            set_i2c_slave_tx(bmp[frame_cnt]);
            frame_cnt++;
            if (frame_cnt == sizeof(bmp)) { frame_cnt = 0; }
            
            //print("Set Register ");
            //print_int(tx_register);
            //print("\r\n");

            //print("Recieved byte: ");
            //rx_data = get_i2c_slave_rx() & 0x0FF;
            //print_int(rx_data);
            //print("\r\n");
        }
        
        //print("Counter: ");
        //print_int(rx_count);
        //print("\r\n");
        //wait_ms(500);
    }

    // Never reached
    return 0;
}