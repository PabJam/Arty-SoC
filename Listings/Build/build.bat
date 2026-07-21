@echo off
set "PATH=D:\projects\xpack-riscv-none-elf-gcc-15.2.0-1\bin;%PATH%"
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ID:\projects\Arty-SoC\Listings\C\Libs -c D:\projects\Arty-SoC\Listings\Build\startup.s -o D:\projects\Arty-SoC\Listings\Build\startup.o
if %errorlevel% neq 0 (
    echo startup.s compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\projects\Arty-SoC\Listings\C\Libs -c D:\projects\Arty-SoC\Listings\C\Fibonacci.c -o D:\projects\Arty-SoC\Listings\Build\Fibonacci.o
if %errorlevel% neq 0 (
    echo Fibonacci.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\projects\Arty-SoC\Listings\C\Libs -c D:\projects\Arty-SoC\Listings\C\Libs\Peripherals.c -o D:\projects\Arty-SoC\Listings\Build\Peripherals.o
if %errorlevel% neq 0 (
    echo Peripherals.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\projects\Arty-SoC\Listings\C\Libs -c D:\projects\Arty-SoC\Listings\C\Libs\Utils.c -o D:\projects\Arty-SoC\Listings\Build\Utils.o
if %errorlevel% neq 0 (
    echo Utils.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -nostdlib -T D:\projects\Arty-SoC\Listings\Build\linker.ld -o D:\projects\Arty-SoC\Listings\Build\Fibonacci.elf D:\projects\Arty-SoC\Listings\Build\startup.o D:\projects\Arty-SoC\Listings\Build\Fibonacci.o D:\projects\Arty-SoC\Listings\Build\Peripherals.o D:\projects\Arty-SoC\Listings\Build\Utils.o -lgcc
if %errorlevel% neq 0 (
    echo Linking failed!
    exit /b 1
)
riscv-none-elf-objcopy.exe -O binary D:\projects\Arty-SoC\Listings\Build\Fibonacci.elf D:\projects\Arty-SoC\Listings\Build\Fibonacci.bin
echo ========================================
echo Build complete!
echo ========================================
riscv-none-elf-size.exe D:\projects\Arty-SoC\Listings\Build\Fibonacci.elf
