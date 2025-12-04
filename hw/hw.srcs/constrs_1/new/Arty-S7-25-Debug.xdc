
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
connect_debug_port u_ila_0/probe0 [get_nets [list {dm_data_out[0]} {dm_data_out[1]} {dm_data_out[2]} {dm_data_out[3]} {dm_data_out[4]} {dm_data_out[5]} {dm_data_out[6]} {dm_data_out[7]} {dm_data_out[8]} {dm_data_out[9]} {dm_data_out[10]} {dm_data_out[11]} {dm_data_out[12]} {dm_data_out[13]} {dm_data_out[14]} {dm_data_out[15]} {dm_data_out[16]} {dm_data_out[17]} {dm_data_out[18]} {dm_data_out[19]} {dm_data_out[20]} {dm_data_out[21]} {dm_data_out[22]} {dm_data_out[23]} {dm_data_out[24]} {dm_data_out[25]} {dm_data_out[26]} {dm_data_out[27]} {dm_data_out[28]} {dm_data_out[29]} {dm_data_out[30]} {dm_data_out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 64 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {progRam_Data_Out[0]} {progRam_Data_Out[1]} {progRam_Data_Out[2]} {progRam_Data_Out[3]} {progRam_Data_Out[4]} {progRam_Data_Out[5]} {progRam_Data_Out[6]} {progRam_Data_Out[7]} {progRam_Data_Out[8]} {progRam_Data_Out[9]} {progRam_Data_Out[10]} {progRam_Data_Out[11]} {progRam_Data_Out[12]} {progRam_Data_Out[13]} {progRam_Data_Out[14]} {progRam_Data_Out[15]} {progRam_Data_Out[16]} {progRam_Data_Out[17]} {progRam_Data_Out[18]} {progRam_Data_Out[19]} {progRam_Data_Out[20]} {progRam_Data_Out[21]} {progRam_Data_Out[22]} {progRam_Data_Out[23]} {progRam_Data_Out[24]} {progRam_Data_Out[25]} {progRam_Data_Out[26]} {progRam_Data_Out[27]} {progRam_Data_Out[28]} {progRam_Data_Out[29]} {progRam_Data_Out[30]} {progRam_Data_Out[31]} {progRam_Data_Out[32]} {progRam_Data_Out[33]} {progRam_Data_Out[34]} {progRam_Data_Out[35]} {progRam_Data_Out[36]} {progRam_Data_Out[37]} {progRam_Data_Out[38]} {progRam_Data_Out[39]} {progRam_Data_Out[40]} {progRam_Data_Out[41]} {progRam_Data_Out[42]} {progRam_Data_Out[43]} {progRam_Data_Out[44]} {progRam_Data_Out[45]} {progRam_Data_Out[46]} {progRam_Data_Out[47]} {progRam_Data_Out[48]} {progRam_Data_Out[49]} {progRam_Data_Out[50]} {progRam_Data_Out[51]} {progRam_Data_Out[52]} {progRam_Data_Out[53]} {progRam_Data_Out[54]} {progRam_Data_Out[55]} {progRam_Data_Out[56]} {progRam_Data_Out[57]} {progRam_Data_Out[58]} {progRam_Data_Out[59]} {progRam_Data_Out[60]} {progRam_Data_Out[61]} {progRam_Data_Out[62]} {progRam_Data_Out[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {dm_data_in[0]} {dm_data_in[1]} {dm_data_in[2]} {dm_data_in[3]} {dm_data_in[4]} {dm_data_in[5]} {dm_data_in[6]} {dm_data_in[7]} {dm_data_in[8]} {dm_data_in[9]} {dm_data_in[10]} {dm_data_in[11]} {dm_data_in[12]} {dm_data_in[13]} {dm_data_in[14]} {dm_data_in[15]} {dm_data_in[16]} {dm_data_in[17]} {dm_data_in[18]} {dm_data_in[19]} {dm_data_in[20]} {dm_data_in[21]} {dm_data_in[22]} {dm_data_in[23]} {dm_data_in[24]} {dm_data_in[25]} {dm_data_in[26]} {dm_data_in[27]} {dm_data_in[28]} {dm_data_in[29]} {dm_data_in[30]} {dm_data_in[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 13 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {progRam_Addr[0]} {progRam_Addr[1]} {progRam_Addr[2]} {progRam_Addr[3]} {progRam_Addr[4]} {progRam_Addr[5]} {progRam_Addr[6]} {progRam_Addr[7]} {progRam_Addr[8]} {progRam_Addr[9]} {progRam_Addr[10]} {progRam_Addr[11]} {progRam_Addr[12]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 3 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {progRam_Uart_State[0]} {progRam_Uart_State[1]} {progRam_Uart_State[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 64 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {progRam_Data_In[0]} {progRam_Data_In[1]} {progRam_Data_In[2]} {progRam_Data_In[3]} {progRam_Data_In[4]} {progRam_Data_In[5]} {progRam_Data_In[6]} {progRam_Data_In[7]} {progRam_Data_In[8]} {progRam_Data_In[9]} {progRam_Data_In[10]} {progRam_Data_In[11]} {progRam_Data_In[12]} {progRam_Data_In[13]} {progRam_Data_In[14]} {progRam_Data_In[15]} {progRam_Data_In[16]} {progRam_Data_In[17]} {progRam_Data_In[18]} {progRam_Data_In[19]} {progRam_Data_In[20]} {progRam_Data_In[21]} {progRam_Data_In[22]} {progRam_Data_In[23]} {progRam_Data_In[24]} {progRam_Data_In[25]} {progRam_Data_In[26]} {progRam_Data_In[27]} {progRam_Data_In[28]} {progRam_Data_In[29]} {progRam_Data_In[30]} {progRam_Data_In[31]} {progRam_Data_In[32]} {progRam_Data_In[33]} {progRam_Data_In[34]} {progRam_Data_In[35]} {progRam_Data_In[36]} {progRam_Data_In[37]} {progRam_Data_In[38]} {progRam_Data_In[39]} {progRam_Data_In[40]} {progRam_Data_In[41]} {progRam_Data_In[42]} {progRam_Data_In[43]} {progRam_Data_In[44]} {progRam_Data_In[45]} {progRam_Data_In[46]} {progRam_Data_In[47]} {progRam_Data_In[48]} {progRam_Data_In[49]} {progRam_Data_In[50]} {progRam_Data_In[51]} {progRam_Data_In[52]} {progRam_Data_In[53]} {progRam_Data_In[54]} {progRam_Data_In[55]} {progRam_Data_In[56]} {progRam_Data_In[57]} {progRam_Data_In[58]} {progRam_Data_In[59]} {progRam_Data_In[60]} {progRam_Data_In[61]} {progRam_Data_In[62]} {progRam_Data_In[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {progRam_Wr_En[0]} {progRam_Wr_En[1]} {progRam_Wr_En[2]} {progRam_Wr_En[3]} {progRam_Wr_En[4]} {progRam_Wr_En[5]} {progRam_Wr_En[6]} {progRam_Wr_En[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {dm_addr[0]} {dm_addr[1]} {dm_addr[2]} {dm_addr[3]} {dm_addr[4]} {dm_addr[5]} {dm_addr[6]} {dm_addr[7]} {dm_addr[8]} {dm_addr[9]} {dm_addr[10]} {dm_addr[11]} {dm_addr[12]} {dm_addr[13]} {dm_addr[14]} {dm_addr[15]} {dm_addr[16]} {dm_addr[17]} {dm_addr[18]} {dm_addr[19]} {dm_addr[20]} {dm_addr[21]} {dm_addr[22]} {dm_addr[23]} {dm_addr[24]} {dm_addr[25]} {dm_addr[26]} {dm_addr[27]} {dm_addr[28]} {dm_addr[29]} {dm_addr[30]} {dm_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 4 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {dm_wr_en[0]} {dm_wr_en[1]} {dm_wr_en[2]} {dm_wr_en[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list dm_lu_addr_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list dm_read_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list dm_read_state]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CLK_IBUF_BUFG]
