@echo off
set "PATH=C:\Users\PJamin\projects\xpack-riscv-none-elf-gcc-15.2.0-1\bin;%PATH%"
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -IC:\Users\PJamin\projects\Arty-SoC\Listings\C\Libs -c C:\Users\PJamin\projects\Arty-SoC\Listings\Build\startup.s -o C:\Users\PJamin\projects\Arty-SoC\Listings\Build\startup.o
if %errorlevel% neq 0 (
    echo startup.s compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -IC:\Users\PJamin\projects\Arty-SoC\Listings\C\Libs -c C:\Users\PJamin\projects\Arty-SoC\Listings\C\Fibonacci.c -o C:\Users\PJamin\projects\Arty-SoC\Listings\Build\Fibonacci.o
if %errorlevel% neq 0 (
    echo Fibonacci.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -IC:\Users\PJamin\projects\Arty-SoC\Listings\C\Libs -c C:\Users\PJamin\projects\Arty-SoC\Listings\C\Libs\Peripherals.c -o C:\Users\PJamin\projects\Arty-SoC\Listings\Build\Peripherals.o
if %errorlevel% neq 0 (
    echo Peripherals.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -IC:\Users\PJamin\projects\Arty-SoC\Listings\C\Libs -c C:\Users\PJamin\projects\Arty-SoC\Listings\C\Libs\Utils.c -o C:\Users\PJamin\projects\Arty-SoC\Listings\Build\Utils.o
if %errorlevel% neq 0 (
    echo Utils.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -nostdlib -T C:\Users\PJamin\projects\Arty-SoC\Listings\Build\linker.ld -o C:\Users\PJamin\projects\Arty-SoC\Listings\Build\Fibonacci.elf C:\Users\PJamin\projects\Arty-SoC\Listings\Build\startup.o C:\Users\PJamin\projects\Arty-SoC\Listings\Build\Fibonacci.o C:\Users\PJamin\projects\Arty-SoC\Listings\Build\Peripherals.o C:\Users\PJamin\projects\Arty-SoC\Listings\Build\Utils.o -lgcc
if %errorlevel% neq 0 (
    echo Linking failed!
    exit /b 1
)
riscv-none-elf-objcopy.exe -O binary C:\Users\PJamin\projects\Arty-SoC\Listings\Build\Fibonacci.elf C:\Users\PJamin\projects\Arty-SoC\Listings\Build\Fibonacci.bin
echo ========================================
echo Build complete!
echo ========================================
riscv-none-elf-size.exe C:\Users\PJamin\projects\Arty-SoC\Listings\Build\Fibonacci.elf
