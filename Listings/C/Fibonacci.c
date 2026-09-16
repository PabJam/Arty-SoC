#include ".\Libs\Peripherals.h"
#include ".\Libs\printf.h"

static int Fibonacci(unsigned int n);

// Main function - called by startup.s
int main(void) {
    printf("Calculating Fibonacci numbers for 10 seconds\r\n");
    
    unsigned int timerStart = read_timer();
    unsigned int timer = 0;
    unsigned int n = 0;
    unsigned int result = 0;

    while (1)
    {
        timer = read_timer();
        unsigned int dif = timer - timerStart;
        if (dif > CLOCK_FREQ_HZ * 10) { break; } // 81.25MHZ * 10sec
        printf("%d : %d after %d ticks\r\n", n, result, dif);
        n++;
        result = Fibonacci(n);
    }

    printf("Calculated %d (%d) Fibonacci numbers in 10 seconds\r\n", n, result);

    return 0;
}

static int Fibonacci(unsigned int n)
{
    if (n == 0) { return 0; }
    else if (n == 1) { return 1; }
    else { return Fibonacci(n - 2) + Fibonacci(n - 1); }
}