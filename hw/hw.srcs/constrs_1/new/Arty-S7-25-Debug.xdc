
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
connect_debug_port u_ila_0/probe0 [get_nets [list {progRam_Data_Out[0]} {progRam_Data_Out[1]} {progRam_Data_Out[2]} {progRam_Data_Out[3]} {progRam_Data_Out[4]} {progRam_Data_Out[5]} {progRam_Data_Out[6]} {progRam_Data_Out[7]} {progRam_Data_Out[8]} {progRam_Data_Out[9]} {progRam_Data_Out[10]} {progRam_Data_Out[11]} {progRam_Data_Out[12]} {progRam_Data_Out[13]} {progRam_Data_Out[14]} {progRam_Data_Out[15]} {progRam_Data_Out[16]} {progRam_Data_Out[17]} {progRam_Data_Out[18]} {progRam_Data_Out[19]} {progRam_Data_Out[20]} {progRam_Data_Out[21]} {progRam_Data_Out[22]} {progRam_Data_Out[23]} {progRam_Data_Out[24]} {progRam_Data_Out[25]} {progRam_Data_Out[26]} {progRam_Data_Out[27]} {progRam_Data_Out[28]} {progRam_Data_Out[29]} {progRam_Data_Out[30]} {progRam_Data_Out[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {progRam_Addr[0]} {progRam_Addr[1]} {progRam_Addr[2]} {progRam_Addr[3]} {progRam_Addr[4]} {progRam_Addr[5]} {progRam_Addr[6]} {progRam_Addr[7]} {progRam_Addr[8]} {progRam_Addr[9]} {progRam_Addr[10]} {progRam_Addr[11]} {progRam_Addr[12]} {progRam_Addr[13]} {progRam_Addr[14]} {progRam_Addr[15]} {progRam_Addr[16]} {progRam_Addr[17]} {progRam_Addr[18]} {progRam_Addr[19]} {progRam_Addr[20]} {progRam_Addr[21]} {progRam_Addr[22]} {progRam_Addr[23]} {progRam_Addr[24]} {progRam_Addr[25]} {progRam_Addr[26]} {progRam_Addr[27]} {progRam_Addr[28]} {progRam_Addr[29]} {progRam_Addr[30]} {progRam_Addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {progRam_Data_In[0]} {progRam_Data_In[1]} {progRam_Data_In[2]} {progRam_Data_In[3]} {progRam_Data_In[4]} {progRam_Data_In[5]} {progRam_Data_In[6]} {progRam_Data_In[7]} {progRam_Data_In[8]} {progRam_Data_In[9]} {progRam_Data_In[10]} {progRam_Data_In[11]} {progRam_Data_In[12]} {progRam_Data_In[13]} {progRam_Data_In[14]} {progRam_Data_In[15]} {progRam_Data_In[16]} {progRam_Data_In[17]} {progRam_Data_In[18]} {progRam_Data_In[19]} {progRam_Data_In[20]} {progRam_Data_In[21]} {progRam_Data_In[22]} {progRam_Data_In[23]} {progRam_Data_In[24]} {progRam_Data_In[25]} {progRam_Data_In[26]} {progRam_Data_In[27]} {progRam_Data_In[28]} {progRam_Data_In[29]} {progRam_Data_In[30]} {progRam_Data_In[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 16 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {progRam_Rd_Cntr[0]} {progRam_Rd_Cntr[1]} {progRam_Rd_Cntr[2]} {progRam_Rd_Cntr[3]} {progRam_Rd_Cntr[4]} {progRam_Rd_Cntr[5]} {progRam_Rd_Cntr[6]} {progRam_Rd_Cntr[7]} {progRam_Rd_Cntr[8]} {progRam_Rd_Cntr[9]} {progRam_Rd_Cntr[10]} {progRam_Rd_Cntr[11]} {progRam_Rd_Cntr[12]} {progRam_Rd_Cntr[13]} {progRam_Rd_Cntr[14]} {progRam_Rd_Cntr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {progRam_Wr_Cntr[0]} {progRam_Wr_Cntr[1]} {progRam_Wr_Cntr[2]} {progRam_Wr_Cntr[3]} {progRam_Wr_Cntr[4]} {progRam_Wr_Cntr[5]} {progRam_Wr_Cntr[6]} {progRam_Wr_Cntr[7]} {progRam_Wr_Cntr[8]} {progRam_Wr_Cntr[9]} {progRam_Wr_Cntr[10]} {progRam_Wr_Cntr[11]} {progRam_Wr_Cntr[12]} {progRam_Wr_Cntr[13]} {progRam_Wr_Cntr[14]} {progRam_Wr_Cntr[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 3 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {progRam_State[0]} {progRam_State[1]} {progRam_State[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 4 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {progRam_Wr_En[0]} {progRam_Wr_En[1]} {progRam_Wr_En[2]} {progRam_Wr_En[3]}]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CLK_IBUF_BUFG]
