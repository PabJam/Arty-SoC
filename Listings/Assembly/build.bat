@echo off
echo Building assembly listing

REM Compile and link the assembly code
riscv-none-elf-gcc.exe -march=rv32i -mabi=ilp32 -nostdlib -T linker.ld -o loop.elf loop.s

if %errorlevel% neq 0 (
    echo Build failed!
	pause
    exit /b 1
)

REM Create the binary file
riscv-none-elf-objcopy.exe -O binary loop.elf loop.bin

echo.
echo Build complete!
echo.
echo Optional files (for debugging):
riscv-none-elf-objdump.exe -d loop.elf > loop.dis
echo   loop.dis - Shows the assembly instructions and their addresses
pause