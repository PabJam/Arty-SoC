transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+Uart_Fifo  -L xil_defaultlib -L xpm -L fifo_generator_v13_2_13 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Uart_Fifo xil_defaultlib.glbl

do {Uart_Fifo.udo}

run 1000ns

endsim

quit -force
