@echo off
set "PATH=D:\delete_me\xpack-riscv-none-elf-gcc-15.2.0-1\bin;%PATH%"
echo ========================================
echo Settings version : 2
echo asm   : -march=rv32im -mabi=ilp32
echo c     : -march=rv32im -mabi=ilp32 -ffreestanding -Wall -Wextra -g -ffunction-sections -fdata-sections -O2
echo link  : -march=rv32im -mabi=ilp32 -nostdlib -Wl,--gc-sections -Wl,--no-warn-rwx-segments
echo ========================================

echo Compiling startup.s...
riscv-none-elf-gcc.exe -march=rv32im -mabi=ilp32 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\Build\startup.s -o D:\delete_me\Arty-SoC\Listings\Build\startup.o
if %errorlevel% neq 0 (
    echo startup.s compilation failed!  
    exit /b 1
)
echo Compiling Fibonacci.c...
riscv-none-elf-gcc.exe -march=rv32im -mabi=ilp32 -ffreestanding -Wall -Wextra -g -ffunction-sections -fdata-sections -O2 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\C\Fibonacci.c -o D:\delete_me\Arty-SoC\Listings\Build\Fibonacci.o
if %errorlevel% neq 0 (
    echo Fibonacci.c compilation failed!  
    exit /b 1
)
echo Compiling bench.c...
riscv-none-elf-gcc.exe -march=rv32im -mabi=ilp32 -ffreestanding -Wall -Wextra -g -ffunction-sections -fdata-sections -O2 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\C\Libs\bench.c -o D:\delete_me\Arty-SoC\Listings\Build\bench.o
if %errorlevel% neq 0 (
    echo bench.c compilation failed!  
    exit /b 1
)
echo Compiling ddr_check.c...
riscv-none-elf-gcc.exe -march=rv32im -mabi=ilp32 -ffreestanding -Wall -Wextra -g -ffunction-sections -fdata-sections -O2 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\C\Libs\ddr_check.c -o D:\delete_me\Arty-SoC\Listings\Build\ddr_check.o
if %errorlevel% neq 0 (
    echo ddr_check.c compilation failed!  
    exit /b 1
)
echo Compiling heap.c...
riscv-none-elf-gcc.exe -march=rv32im -mabi=ilp32 -ffreestanding -Wall -Wextra -g -ffunction-sections -fdata-sections -O2 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\C\Libs\heap.c -o D:\delete_me\Arty-SoC\Listings\Build\heap.o
if %errorlevel% neq 0 (
    echo heap.c compilation failed!  
    exit /b 1
)
echo Compiling Peripherals.c...
riscv-none-elf-gcc.exe -march=rv32im -mabi=ilp32 -ffreestanding -Wall -Wextra -g -ffunction-sections -fdata-sections -O2 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\C\Libs\Peripherals.c -o D:\delete_me\Arty-SoC\Listings\Build\Peripherals.o
if %errorlevel% neq 0 (
    echo Peripherals.c compilation failed!  
    exit /b 1
)
echo Compiling printf.c...
riscv-none-elf-gcc.exe -march=rv32im -mabi=ilp32 -ffreestanding -Wall -Wextra -g -ffunction-sections -fdata-sections -O2 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\C\Libs\printf.c -o D:\delete_me\Arty-SoC\Listings\Build\printf.o
if %errorlevel% neq 0 (
    echo printf.c compilation failed!  
    exit /b 1
)
echo Compiling uart_glue.c...
riscv-none-elf-gcc.exe -march=rv32im -mabi=ilp32 -ffreestanding -Wall -Wextra -g -ffunction-sections -fdata-sections -O2 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\C\Libs\uart_glue.c -o D:\delete_me\Arty-SoC\Listings\Build\uart_glue.o
if %errorlevel% neq 0 (
    echo uart_glue.c compilation failed!  
    exit /b 1
)
echo Linking...
riscv-none-elf-gcc.exe -march=rv32im -mabi=ilp32 -nostdlib -Wl,--gc-sections -Wl,--no-warn-rwx-segments -Wl,-Map=D:\delete_me\Arty-SoC\Listings\Build\Fibonacci.map -T D:\delete_me\Arty-SoC\Listings\Build\linker.ld -o D:\delete_me\Arty-SoC\Listings\Build\Fibonacci.elf D:\delete_me\Arty-SoC\Listings\Build\startup.o D:\delete_me\Arty-SoC\Listings\Build\Fibonacci.o D:\delete_me\Arty-SoC\Listings\Build\bench.o D:\delete_me\Arty-SoC\Listings\Build\ddr_check.o D:\delete_me\Arty-SoC\Listings\Build\heap.o D:\delete_me\Arty-SoC\Listings\Build\Peripherals.o D:\delete_me\Arty-SoC\Listings\Build\printf.o D:\delete_me\Arty-SoC\Listings\Build\uart_glue.o -lgcc
if %errorlevel% neq 0 (
    echo Linking failed!
    exit /b 1
)
riscv-none-elf-objcopy.exe -O binary D:\delete_me\Arty-SoC\Listings\Build\Fibonacci.elf D:\delete_me\Arty-SoC\Listings\Build\Fibonacci.bin
echo ========================================
echo Build complete!
echo ========================================
riscv-none-elf-objdump.exe -d -S D:\delete_me\Arty-SoC\Listings\Build\Fibonacci.elf > D:\delete_me\Arty-SoC\Listings\Build\Fibonacci.dis
riscv-none-elf-size.exe D:\delete_me\Arty-SoC\Listings\Build\Fibonacci.elf
