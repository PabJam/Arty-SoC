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
set_property port_width 3 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {inst_LogicUnit/func3[0]} {inst_LogicUnit/func3[1]} {inst_LogicUnit/func3[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {inst_LogicUnit/current_pc[0]} {inst_LogicUnit/current_pc[1]} {inst_LogicUnit/current_pc[2]} {inst_LogicUnit/current_pc[3]} {inst_LogicUnit/current_pc[4]} {inst_LogicUnit/current_pc[5]} {inst_LogicUnit/current_pc[6]} {inst_LogicUnit/current_pc[7]} {inst_LogicUnit/current_pc[8]} {inst_LogicUnit/current_pc[9]} {inst_LogicUnit/current_pc[10]} {inst_LogicUnit/current_pc[11]} {inst_LogicUnit/current_pc[12]} {inst_LogicUnit/current_pc[13]} {inst_LogicUnit/current_pc[14]} {inst_LogicUnit/current_pc[15]} {inst_LogicUnit/current_pc[16]} {inst_LogicUnit/current_pc[17]} {inst_LogicUnit/current_pc[18]} {inst_LogicUnit/current_pc[19]} {inst_LogicUnit/current_pc[20]} {inst_LogicUnit/current_pc[21]} {inst_LogicUnit/current_pc[22]} {inst_LogicUnit/current_pc[23]} {inst_LogicUnit/current_pc[24]} {inst_LogicUnit/current_pc[25]} {inst_LogicUnit/current_pc[26]} {inst_LogicUnit/current_pc[27]} {inst_LogicUnit/current_pc[28]} {inst_LogicUnit/current_pc[29]} {inst_LogicUnit/current_pc[30]} {inst_LogicUnit/current_pc[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 21 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {inst_LogicUnit/immediate[0]} {inst_LogicUnit/immediate[1]} {inst_LogicUnit/immediate[2]} {inst_LogicUnit/immediate[3]} {inst_LogicUnit/immediate[4]} {inst_LogicUnit/immediate[5]} {inst_LogicUnit/immediate[6]} {inst_LogicUnit/immediate[7]} {inst_LogicUnit/immediate[8]} {inst_LogicUnit/immediate[9]} {inst_LogicUnit/immediate[10]} {inst_LogicUnit/immediate[11]} {inst_LogicUnit/immediate[12]} {inst_LogicUnit/immediate[13]} {inst_LogicUnit/immediate[14]} {inst_LogicUnit/immediate[15]} {inst_LogicUnit/immediate[16]} {inst_LogicUnit/immediate[17]} {inst_LogicUnit/immediate[18]} {inst_LogicUnit/immediate[19]} {inst_LogicUnit/immediate[20]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 7 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {inst_LogicUnit/opcode[0]} {inst_LogicUnit/opcode[1]} {inst_LogicUnit/opcode[2]} {inst_LogicUnit/opcode[3]} {inst_LogicUnit/opcode[4]} {inst_LogicUnit/opcode[5]} {inst_LogicUnit/opcode[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 5 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {inst_LogicUnit/rd[0]} {inst_LogicUnit/rd[1]} {inst_LogicUnit/rd[2]} {inst_LogicUnit/rd[3]} {inst_LogicUnit/rd[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {inst_LogicUnit/rs2_val[0]} {inst_LogicUnit/rs2_val[1]} {inst_LogicUnit/rs2_val[2]} {inst_LogicUnit/rs2_val[3]} {inst_LogicUnit/rs2_val[4]} {inst_LogicUnit/rs2_val[5]} {inst_LogicUnit/rs2_val[6]} {inst_LogicUnit/rs2_val[7]} {inst_LogicUnit/rs2_val[8]} {inst_LogicUnit/rs2_val[9]} {inst_LogicUnit/rs2_val[10]} {inst_LogicUnit/rs2_val[11]} {inst_LogicUnit/rs2_val[12]} {inst_LogicUnit/rs2_val[13]} {inst_LogicUnit/rs2_val[14]} {inst_LogicUnit/rs2_val[15]} {inst_LogicUnit/rs2_val[16]} {inst_LogicUnit/rs2_val[17]} {inst_LogicUnit/rs2_val[18]} {inst_LogicUnit/rs2_val[19]} {inst_LogicUnit/rs2_val[20]} {inst_LogicUnit/rs2_val[21]} {inst_LogicUnit/rs2_val[22]} {inst_LogicUnit/rs2_val[23]} {inst_LogicUnit/rs2_val[24]} {inst_LogicUnit/rs2_val[25]} {inst_LogicUnit/rs2_val[26]} {inst_LogicUnit/rs2_val[27]} {inst_LogicUnit/rs2_val[28]} {inst_LogicUnit/rs2_val[29]} {inst_LogicUnit/rs2_val[30]} {inst_LogicUnit/rs2_val[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 5 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {inst_LogicUnit/rs2[0]} {inst_LogicUnit/rs2[1]} {inst_LogicUnit/rs2[2]} {inst_LogicUnit/rs2[3]} {inst_LogicUnit/rs2[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 5 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {inst_LogicUnit/rs1[0]} {inst_LogicUnit/rs1[1]} {inst_LogicUnit/rs1[2]} {inst_LogicUnit/rs1[3]} {inst_LogicUnit/rs1[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {inst_LogicUnit/rs1_val[0]} {inst_LogicUnit/rs1_val[1]} {inst_LogicUnit/rs1_val[2]} {inst_LogicUnit/rs1_val[3]} {inst_LogicUnit/rs1_val[4]} {inst_LogicUnit/rs1_val[5]} {inst_LogicUnit/rs1_val[6]} {inst_LogicUnit/rs1_val[7]} {inst_LogicUnit/rs1_val[8]} {inst_LogicUnit/rs1_val[9]} {inst_LogicUnit/rs1_val[10]} {inst_LogicUnit/rs1_val[11]} {inst_LogicUnit/rs1_val[12]} {inst_LogicUnit/rs1_val[13]} {inst_LogicUnit/rs1_val[14]} {inst_LogicUnit/rs1_val[15]} {inst_LogicUnit/rs1_val[16]} {inst_LogicUnit/rs1_val[17]} {inst_LogicUnit/rs1_val[18]} {inst_LogicUnit/rs1_val[19]} {inst_LogicUnit/rs1_val[20]} {inst_LogicUnit/rs1_val[21]} {inst_LogicUnit/rs1_val[22]} {inst_LogicUnit/rs1_val[23]} {inst_LogicUnit/rs1_val[24]} {inst_LogicUnit/rs1_val[25]} {inst_LogicUnit/rs1_val[26]} {inst_LogicUnit/rs1_val[27]} {inst_LogicUnit/rs1_val[28]} {inst_LogicUnit/rs1_val[29]} {inst_LogicUnit/rs1_val[30]} {inst_LogicUnit/rs1_val[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {dm_data_in[0]} {dm_data_in[1]} {dm_data_in[2]} {dm_data_in[3]} {dm_data_in[4]} {dm_data_in[5]} {dm_data_in[6]} {dm_data_in[7]} {dm_data_in[8]} {dm_data_in[9]} {dm_data_in[10]} {dm_data_in[11]} {dm_data_in[12]} {dm_data_in[13]} {dm_data_in[14]} {dm_data_in[15]} {dm_data_in[16]} {dm_data_in[17]} {dm_data_in[18]} {dm_data_in[19]} {dm_data_in[20]} {dm_data_in[21]} {dm_data_in[22]} {dm_data_in[23]} {dm_data_in[24]} {dm_data_in[25]} {dm_data_in[26]} {dm_data_in[27]} {dm_data_in[28]} {dm_data_in[29]} {dm_data_in[30]} {dm_data_in[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {dm_data_out[0]} {dm_data_out[1]} {dm_data_out[2]} {dm_data_out[3]} {dm_data_out[4]} {dm_data_out[5]} {dm_data_out[6]} {dm_data_out[7]} {dm_data_out[8]} {dm_data_out[9]} {dm_data_out[10]} {dm_data_out[11]} {dm_data_out[12]} {dm_data_out[13]} {dm_data_out[14]} {dm_data_out[15]} {dm_data_out[16]} {dm_data_out[17]} {dm_data_out[18]} {dm_data_out[19]} {dm_data_out[20]} {dm_data_out[21]} {dm_data_out[22]} {dm_data_out[23]} {dm_data_out[24]} {dm_data_out[25]} {dm_data_out[26]} {dm_data_out[27]} {dm_data_out[28]} {dm_data_out[29]} {dm_data_out[30]} {dm_data_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 4 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {dm_wr_en[0]} {dm_wr_en[1]} {dm_wr_en[2]} {dm_wr_en[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 32 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {dm_addr[0]} {dm_addr[1]} {dm_addr[2]} {dm_addr[3]} {dm_addr[4]} {dm_addr[5]} {dm_addr[6]} {dm_addr[7]} {dm_addr[8]} {dm_addr[9]} {dm_addr[10]} {dm_addr[11]} {dm_addr[12]} {dm_addr[13]} {dm_addr[14]} {dm_addr[15]} {dm_addr[16]} {dm_addr[17]} {dm_addr[18]} {dm_addr[19]} {dm_addr[20]} {dm_addr[21]} {dm_addr[22]} {dm_addr[23]} {dm_addr[24]} {dm_addr[25]} {dm_addr[26]} {dm_addr[27]} {dm_addr[28]} {dm_addr[29]} {dm_addr[30]} {dm_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 2 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {dm_read_state[0]} {dm_read_state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {uart_fifo_din[0]} {uart_fifo_din[1]} {uart_fifo_din[2]} {uart_fifo_din[3]} {uart_fifo_din[4]} {uart_fifo_din[5]} {uart_fifo_din[6]} {uart_fifo_din[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 8 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {uart_fifo_dout[0]} {uart_fifo_dout[1]} {uart_fifo_dout[2]} {uart_fifo_dout[3]} {uart_fifo_dout[4]} {uart_fifo_dout[5]} {uart_fifo_dout[6]} {uart_fifo_dout[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list inst_LogicUnit/ctrl_logic_unit]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list dm_lu_addr_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list dm_read_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list inst_LogicUnit/instruction_decoded]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list inst_LogicUnit/instruction_done]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list inst_LogicUnit/instruction_jump]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list inst_LogicUnit/instruction_multicycle]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list inst_LogicUnit/instruction_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list uart_fifo_empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list uart_fifo_rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list uart_fifo_srst]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list uart_fifo_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list uart_fifo_wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list inst_LogicUnit/wait_finish_write_operation]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CLK_IBUF_BUFG]
