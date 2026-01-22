This is a hobby project in which I implemented a softcore in a Spartan 7 FPGA on an Arty S7 25K board. The softcore is based on the RISC-V rv32i instruction set.
Since I am the only person contributing to this project and Vivado creates a lot of temporary files, I did not bother setting up a clean .gitignore or .tcl script to generate the Vivado project files.
Besides the Vivado project (\ALU), this repository also contains a few tools needed to use the softcore:

\ComPortUI is a simple WPF GUI to load programs onto the softcore and receive messages via UART.
\xpack-riscv-none-elf-gcc-15.2.0-1 contains a precompiled GCC version.
\Listings contains different example Assembly and C programs which can be compiled and loaded onto the softcore.

Softcore Characteristics:
Everything on the FPGA, including the softcore, runs with an internal clock speed of 100MHz.
The softcore has 128kB of RAM, which is shared between the program and data.
The softcore has 3 pipelining stages: instruction fetch => instruction decode => instruction execute.
As described above, the softcore uses the rv32i instruction set.
The following peripherals on the Arty board can be accessed from the softcore: the 4 LEDs, the 2 RGB LEDs, the UART port, an internal 100MHz timer, and the 4 PMOD connectors containing a combined 32 GPIOs.
The 4 buttons on the Arty board are set up to have the following functionality:

BTN:0 => read back program memory
BTN:1 => give control to the ALU (start executing program)
BTN:2 => take control from ALU
BTN:3 => sync reset

Vivado Project Details:
The project is in Vivado 2025.1 and targets the "Arty S7-25 (xc7s25csga324-1)".
The HDL files are written in VHDL and located at \ALU\ALU.srcs\sources_1.
The project uses the Master.xdc from the Digilent GPIO_demo for the Arty S7 board.
Outlook:
The project is not finished, and there are some things I would like to implement in the future:

Improve the decoding pipelining step.
Some RISC-V extensions, like M, F, B.
Expand the peripheral access to use the chipKIT connectors on the board and the XADC on the Spartan 7.
Connect the 256MB DDR3 RAM on the board for data memory and turn the 128kB BRAM into pure ROM.
Maybe try to implement/run an OS.

If you have any questions or inquiries, please contact me at: jamin.pablo@googlemail.com
