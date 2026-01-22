This is a hobby project, in which I implemented a softcore in a spartan 7 fpga on an Arty S7 25k board.
The softcore is based on the RISC-V rv32i instruction set.

Since I am the only person contributing to this project and Vivado creates alot of temporary files I did not
bother setting up a clean .gitignore or .tcl script to generate the Vivado project files.  

Besides the Vivado project (\ALU) this repository also contains a few tools needed to use the softcore.
\ComPortUI is simple wpf GUI, to load programs on the Softcore and recieve messages via UART.
\xpack-riscv-none-elf-gcc-15.2.0-1 contains a pre compiled GCC version
\Listings contains different example Assembly and C programs which can be compiled and loaded on to the softcore.

Softcore characteristics:









