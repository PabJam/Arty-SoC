transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+UART_Fifo  -L xil_defaultlib -L xpm -L fifo_generator_v13_2_13 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.UART_Fifo xil_defaultlib.glbl

do {UART_Fifo.udo}

run 1000ns

endsim

quit -force
