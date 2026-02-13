#include ".\Utils.h"

void int_to_string(int num, char str[]) {
    int i = 0, isNegative = 0;

    if (num == 0) {
        str[i++] = '0';
        str[i] = '\0';
        return;
    }

    if (num < 0) {
        isNegative = 1;
        num = -num;
    }

    while (num != 0) {
        int digit = num % 10;
        str[i++] = digit + '0';
        num = num / 10;
    }

    if (isNegative)
        str[i++] = '-';

    str[i] = '\0';

    // reverse the string
    int start = 0, end = i - 1;
    while (start < end) {
        char temp = str[start];
        str[start] = str[end];
        str[end] = temp;
        start++;
        end--;
    }
}