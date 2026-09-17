#include ".\Libs\Peripherals.h"
#include ".\Libs\printf.h"
#include <stdint.h>
#include ".\Libs\heap.h"

static uint64_t Fibonacci(uint32_t n);

static uint64_t* fibonaci_results;
// Main function - called by startup.s
int main(void) {

    fibonaci_results = (uint64_t*)calloc(100, sizeof(uint64_t));
    fibonaci_results[0] = 0;
    fibonaci_results[1] = 1;
    printf("Calculating Fibonacci numbers for 10 seconds\r\n");
    
    uint32_t timerStart = read_timer();
    uint32_t timer = 0;
    uint32_t n = 0;
    uint64_t result = 0;
  
    while (1)
    {
        if (n >= 99) { break; }
        timer = read_timer();
        uint32_t dif = timer - timerStart;
        if (dif > CLOCK_FREQ_HZ * 10) { break; } // 81.25MHZ * 10sec
        printf("%d : %llu after %d ticks\r\n", n, result, dif);
        n++;
        result = Fibonacci(n);
    }

    printf("Calculated %d (%llu) Fibonacci numbers in 10 seconds\r\n", n, result);

    return 0;
}

static uint64_t Fibonacci(uint32_t n)
{
    if (n == 0) { return 0; }
    else if (n == 1) { return 1; }
    else
    {
        uint64_t prev_result = fibonaci_results[n - 1];
        uint64_t prev_prev_result = fibonaci_results[n - 2];
        if (prev_result == 0) { prev_result = Fibonacci(n - 1); }
        if (prev_prev_result == 0) { prev_prev_result = Fibonacci(n - 2); }
        uint64_t result = prev_result + prev_prev_result;
        fibonaci_results[n] = result;
        return result;
    }
}