@echo off
echo Building C program for RV32I bare metal

REM Compile the assembly startup code
echo Compiling startup.s...
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -c startup.s -o startup.o
if %errorlevel% neq 0 (
    echo Assembly compilation failed!
    pause
    exit /b 1
)

REM Compile the peripherals C source code
echo Compiling Peripherals.c...
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -O2 -ffreestanding -nostdlib -I.\Libs -c Libs\Peripherals.c -o Peripherals.o
if %errorlevel% neq 0 (
    echo Peripherals compilation failed!
    pause
    exit /b 1
)

REM Compile the main C source code
echo Compiling main.c...
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -O2 -ffreestanding -nostdlib -I.\Libs -c main.c -o main.o
if %errorlevel% neq 0 (
    echo C compilation failed!
    pause
    exit /b 1
)

REM Link all object files together
echo Linking...
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -nostdlib -T linker.ld -o program.elf startup.o main.o Peripherals.o
if %errorlevel% neq 0 (
    echo Linking failed!
    pause
    exit /b 1
)

REM Create the binary file for UART upload
echo Creating binary...
riscv-none-elf-objcopy.exe -O binary program.elf program.bin

echo.
echo ========================================
echo Build complete!
echo ========================================
echo Output files:
echo   program.bin - Binary file to load via UART
echo   program.elf - ELF file with debug symbols
echo.

REM Create optional debugging files
echo Creating debug files...
riscv-none-elf-objdump.exe -d program.elf > program.dis
echo   program.dis - Disassembly listing
riscv-none-elf-size.exe program.elf
echo.
pause