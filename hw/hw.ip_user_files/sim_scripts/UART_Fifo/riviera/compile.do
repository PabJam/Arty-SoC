transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/fifo_generator_v13_2_13
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap fifo_generator_v13_2_13 riviera/fifo_generator_v13_2_13
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+C:/Xilinx/2025.1/Vivado/data/rsb/busdef" -l xpm -l fifo_generator_v13_2_13 -l xil_defaultlib \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_13  -incr -v2k5 "+incdir+C:/Xilinx/2025.1/Vivado/data/rsb/busdef" -l xpm -l fifo_generator_v13_2_13 -l xil_defaultlib \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_13 -93  -incr \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_13  -incr -v2k5 "+incdir+C:/Xilinx/2025.1/Vivado/data/rsb/busdef" -l xpm -l fifo_generator_v13_2_13 -l xil_defaultlib \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+C:/Xilinx/2025.1/Vivado/data/rsb/busdef" -l xpm -l fifo_generator_v13_2_13 -l xil_defaultlib \
"../../../../hw.gen/sources_1/ip/UART_Fifo/sim/UART_Fifo.v" \

vlog -work xil_defaultlib \
"glbl.v"

