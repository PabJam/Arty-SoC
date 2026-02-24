@echo off
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -march=rv32i -mabi=ilp32 -march=rv32i -mabi=ilp32 -ID:\Projekte\Arty\Listings\C\Libs -c D:\Projekte\Arty\Listings\Build\startup.s -o D:\Projekte\Arty\Listings\Buildstartup.o
if %errorlevel% neq 0 (
    echo startup.s compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\Projekte\Arty\Listings\C\Libs -c D:\Projekte\Arty\Listings\C\I2C_BadApple.c -o D:\Projekte\Arty\Listings\BuildI2C_BadApple.o
if %errorlevel% neq 0 (
    echo I2C_BadApple.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\Projekte\Arty\Listings\C\Libs -c D:\Projekte\Arty\Listings\C\Libs\Peripherals.c -o D:\Projekte\Arty\Listings\BuildPeripherals.o
if %errorlevel% neq 0 (
    echo Peripherals.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -ID:\Projekte\Arty\Listings\C\Libs -c D:\Projekte\Arty\Listings\C\Libs\Utils.c -o D:\Projekte\Arty\Listings\BuildUtils.o
if %errorlevel% neq 0 (
    echo Utils.c compilation failed!  
    exit /b 1
)
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -nostdlib -march=rv32i -mabi=ilp32 -nostdlib -T D:\Projekte\Arty\Listings\Build\linker.ld -o D:\Projekte\Arty\Listings\BuildI2C_BadApple.elf D:\Projekte\Arty\Listings\Build\startup.o D:\Projekte\Arty\Listings\BuildI2C_BadApple.o D:\Projekte\Arty\Listings\BuildPeripherals.o D:\Projekte\Arty\Listings\BuildUtils.o -lgcc -lgcc
if %errorlevel% neq 0 (
    echo Linking failed!
    exit /b 1
)
riscv-none-elf-objcopy.exe -O binary D:\Projekte\Arty\Listings\BuildI2C_BadApple.elf D:\Projekte\Arty\Listings\BuildI2C_BadApple.bin
echo ========================================
echo Build complete!
echo ========================================
riscv-none-elf-size.exe D:\Projekte\Arty\Listings\BuildI2C_BadApple.elf
