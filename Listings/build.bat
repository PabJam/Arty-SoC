@echo off
echo Building UART Hello World...

REM Compile and link the assembly code
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -nostdlib -T linker.ld -o uart_hello.elf uart_hello.s

if %errorlevel% neq 0 (
    echo Build failed!
	pause
    exit /b 1
)

REM Create the binary file
riscv-none-elf-objcopy.exe -O binary uart_hello.elf uart_hello.bin

echo.
echo Build complete!
echo.
echo THE FILE YOU NEED: uart_hello.bin
echo This is the raw binary to load via UART to your FPGA
echo.
echo Optional files (for debugging):
riscv-none-elf-objdump.exe -d uart_hello.elf > uart_hello.dis
echo   uart_hello.dis - Shows the assembly instructions and their addresses
pause