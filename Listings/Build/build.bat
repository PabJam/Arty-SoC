@echo off
set "PATH=D:\Projekte\xpack-riscv-none-elf-gcc-15.2.0-1\bin;%PATH%"
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ID:\Projekte\Arty\Listings\C\Libs -c D:\Projekte\Arty\Listings\Build\startup.s -o D:\Projekte\Arty\Listings\Build\startup.o
if %errorlevel% neq 0 (
    echo startup.s compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\Projekte\Arty\Listings\C\Libs -c D:\Projekte\Arty\Listings\C\Fibonacci.c -o D:\Projekte\Arty\Listings\Build\Fibonacci.o
if %errorlevel% neq 0 (
    echo Fibonacci.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\Projekte\Arty\Listings\C\Libs -c D:\Projekte\Arty\Listings\C\Libs\Peripherals.c -o D:\Projekte\Arty\Listings\Build\Peripherals.o
if %errorlevel% neq 0 (
    echo Peripherals.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\Projekte\Arty\Listings\C\Libs -c D:\Projekte\Arty\Listings\C\Libs\Utils.c -o D:\Projekte\Arty\Listings\Build\Utils.o
if %errorlevel% neq 0 (
    echo Utils.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -nostdlib -T D:\Projekte\Arty\Listings\Build\linker.ld -o D:\Projekte\Arty\Listings\Build\Fibonacci.elf D:\Projekte\Arty\Listings\Build\startup.o D:\Projekte\Arty\Listings\Build\Fibonacci.o D:\Projekte\Arty\Listings\Build\Peripherals.o D:\Projekte\Arty\Listings\Build\Utils.o -lgcc
if %errorlevel% neq 0 (
    echo Linking failed!
    exit /b 1
)
riscv-none-elf-objcopy.exe -O binary D:\Projekte\Arty\Listings\Build\Fibonacci.elf D:\Projekte\Arty\Listings\Build\Fibonacci.bin
echo ========================================
echo Build complete!
echo ========================================
riscv-none-elf-size.exe D:\Projekte\Arty\Listings\Build\Fibonacci.elf
