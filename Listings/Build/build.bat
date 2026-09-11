@echo off
set "PATH=D:\delete_me\xpack-riscv-none-elf-gcc-15.2.0-1\bin;%PATH%"
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\Build\startup.s -o D:\delete_me\Arty-SoC\Listings\Build\startup.o
if %errorlevel% neq 0 (
    echo startup.s compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\C\DramTest.c -o D:\delete_me\Arty-SoC\Listings\Build\DramTest.o
if %errorlevel% neq 0 (
    echo DramTest.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\C\Libs\Peripherals.c -o D:\delete_me\Arty-SoC\Listings\Build\Peripherals.o
if %errorlevel% neq 0 (
    echo Peripherals.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\delete_me\Arty-SoC\Listings\C\Libs -c D:\delete_me\Arty-SoC\Listings\C\Libs\Utils.c -o D:\delete_me\Arty-SoC\Listings\Build\Utils.o
if %errorlevel% neq 0 (
    echo Utils.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -nostdlib -T D:\delete_me\Arty-SoC\Listings\Build\linker.ld -o D:\delete_me\Arty-SoC\Listings\Build\DramTest.elf D:\delete_me\Arty-SoC\Listings\Build\startup.o D:\delete_me\Arty-SoC\Listings\Build\DramTest.o D:\delete_me\Arty-SoC\Listings\Build\Peripherals.o D:\delete_me\Arty-SoC\Listings\Build\Utils.o -lgcc
if %errorlevel% neq 0 (
    echo Linking failed!
    exit /b 1
)
riscv-none-elf-objcopy.exe -O binary D:\delete_me\Arty-SoC\Listings\Build\DramTest.elf D:\delete_me\Arty-SoC\Listings\Build\DramTest.bin
echo ========================================
echo Build complete!
echo ========================================
riscv-none-elf-size.exe D:\delete_me\Arty-SoC\Listings\Build\DramTest.elf
