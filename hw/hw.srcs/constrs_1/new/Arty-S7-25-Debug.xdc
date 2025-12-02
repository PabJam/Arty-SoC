

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 1 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list CLK_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {dm_addr[0]} {dm_addr[1]} {dm_addr[2]} {dm_addr[3]} {dm_addr[4]} {dm_addr[5]} {dm_addr[6]} {dm_addr[7]} {dm_addr[8]} {dm_addr[9]} {dm_addr[10]} {dm_addr[11]} {dm_addr[12]} {dm_addr[13]} {dm_addr[14]} {dm_addr[15]} {dm_addr[16]} {dm_addr[17]} {dm_addr[18]} {dm_addr[19]} {dm_addr[20]} {dm_addr[21]} {dm_addr[22]} {dm_addr[23]} {dm_addr[24]} {dm_addr[25]} {dm_addr[26]} {dm_addr[27]} {dm_addr[28]} {dm_addr[29]} {dm_addr[30]} {dm_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {dm_data_in[0]} {dm_data_in[1]} {dm_data_in[2]} {dm_data_in[3]} {dm_data_in[4]} {dm_data_in[5]} {dm_data_in[6]} {dm_data_in[7]} {dm_data_in[8]} {dm_data_in[9]} {dm_data_in[10]} {dm_data_in[11]} {dm_data_in[12]} {dm_data_in[13]} {dm_data_in[14]} {dm_data_in[15]} {dm_data_in[16]} {dm_data_in[17]} {dm_data_in[18]} {dm_data_in[19]} {dm_data_in[20]} {dm_data_in[21]} {dm_data_in[22]} {dm_data_in[23]} {dm_data_in[24]} {dm_data_in[25]} {dm_data_in[26]} {dm_data_in[27]} {dm_data_in[28]} {dm_data_in[29]} {dm_data_in[30]} {dm_data_in[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {debug_flags[0]} {debug_flags[1]} {debug_flags[2]} {debug_flags[3]} {debug_flags[4]} {debug_flags[5]} {debug_flags[6]} {debug_flags[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {uart_fifo_din[0]} {uart_fifo_din[1]} {uart_fifo_din[2]} {uart_fifo_din[3]} {uart_fifo_din[4]} {uart_fifo_din[5]} {uart_fifo_din[6]} {uart_fifo_din[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {uart_fifo_dout[0]} {uart_fifo_dout[1]} {uart_fifo_dout[2]} {uart_fifo_dout[3]} {uart_fifo_dout[4]} {uart_fifo_dout[5]} {uart_fifo_dout[6]} {uart_fifo_dout[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {uart_TX_Data[0]} {uart_TX_Data[1]} {uart_TX_Data[2]} {uart_TX_Data[3]} {uart_TX_Data[4]} {uart_TX_Data[5]} {uart_TX_Data[6]} {uart_TX_Data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list dm_write_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list uart_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list uart_fifo_rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list uart_fifo_srst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list uart_fifo_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list uart_fifo_wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list uart_TX_Active]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list uart_TX_DV]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CLK_IBUF_BUFG]
