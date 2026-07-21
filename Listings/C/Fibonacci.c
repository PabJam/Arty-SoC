#include ".\Libs\Peripherals.h"

int Fibonacci(unsigned int n);

// Main function - called by startup.s
int main(void) {
    print("Calculating Fibonacci numbers for 10 seconds\r\n");
    
    unsigned int timerStart = read_timer();
    unsigned int timer = 0;
    unsigned int n = 0;
    unsigned int result = 0;

    while (1)
    {
        timer = read_timer();
        int dif = timer - timerStart;
        if (dif > 1000000000) { break; } // 100MHZ * 1sec
        print_int(n);
        print(": ");
        print_int(result);
        print(" after ");
        print_int(dif);
        print(" ticks\r\n");
        n++;
        result = Fibonacci(n);
    }

    print("Calculated ");
    print_int(n);
    print(" (");
    print_int(result);
    print(") Fibonacci numbers in 10 seconds\r\n");

    return 0;
}

int Fibonacci(unsigned int n)
{
    if (n == 0) { return 0; }
    else if (n == 1) { return 1; }
    else { return Fibonacci(n - 2) + Fibonacci(n - 1); }
}