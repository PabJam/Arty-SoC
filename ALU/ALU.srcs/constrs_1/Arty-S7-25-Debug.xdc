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
set_property port_width 7 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {inst_I2C_Slave/rx_address[0]} {inst_I2C_Slave/rx_address[1]} {inst_I2C_Slave/rx_address[2]} {inst_I2C_Slave/rx_address[3]} {inst_I2C_Slave/rx_address[4]} {inst_I2C_Slave/rx_address[5]} {inst_I2C_Slave/rx_address[6]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 3 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {inst_I2C_Slave/i2c_state[0]} {inst_I2C_Slave/i2c_state[1]} {inst_I2C_Slave/i2c_state[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {i2c_slave_tx_register[0]} {i2c_slave_tx_register[1]} {i2c_slave_tx_register[2]} {i2c_slave_tx_register[3]} {i2c_slave_tx_register[4]} {i2c_slave_tx_register[5]} {i2c_slave_tx_register[6]} {i2c_slave_tx_register[7]} {i2c_slave_tx_register[8]} {i2c_slave_tx_register[9]} {i2c_slave_tx_register[10]} {i2c_slave_tx_register[11]} {i2c_slave_tx_register[12]} {i2c_slave_tx_register[13]} {i2c_slave_tx_register[14]} {i2c_slave_tx_register[15]} {i2c_slave_tx_register[16]} {i2c_slave_tx_register[17]} {i2c_slave_tx_register[18]} {i2c_slave_tx_register[19]} {i2c_slave_tx_register[20]} {i2c_slave_tx_register[21]} {i2c_slave_tx_register[22]} {i2c_slave_tx_register[23]} {i2c_slave_tx_register[24]} {i2c_slave_tx_register[25]} {i2c_slave_tx_register[26]} {i2c_slave_tx_register[27]} {i2c_slave_tx_register[28]} {i2c_slave_tx_register[29]} {i2c_slave_tx_register[30]} {i2c_slave_tx_register[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 3 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {i2c_slave_rx_register_cntr__0[0]} {i2c_slave_rx_register_cntr__0[1]} {i2c_slave_rx_register_cntr__0[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {i2c_slave_tx_byte[0]} {i2c_slave_tx_byte[1]} {i2c_slave_tx_byte[2]} {i2c_slave_tx_byte[3]} {i2c_slave_tx_byte[4]} {i2c_slave_tx_byte[5]} {i2c_slave_tx_byte[6]} {i2c_slave_tx_byte[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 3 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {i2c_slave_tx_register_cntr__0[0]} {i2c_slave_tx_register_cntr__0[1]} {i2c_slave_tx_register_cntr__0[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {i2c_slave_rx_register[0]} {i2c_slave_rx_register[1]} {i2c_slave_rx_register[2]} {i2c_slave_rx_register[3]} {i2c_slave_rx_register[4]} {i2c_slave_rx_register[5]} {i2c_slave_rx_register[6]} {i2c_slave_rx_register[7]} {i2c_slave_rx_register[8]} {i2c_slave_rx_register[9]} {i2c_slave_rx_register[10]} {i2c_slave_rx_register[11]} {i2c_slave_rx_register[12]} {i2c_slave_rx_register[13]} {i2c_slave_rx_register[14]} {i2c_slave_rx_register[15]} {i2c_slave_rx_register[16]} {i2c_slave_rx_register[17]} {i2c_slave_rx_register[18]} {i2c_slave_rx_register[19]} {i2c_slave_rx_register[20]} {i2c_slave_rx_register[21]} {i2c_slave_rx_register[22]} {i2c_slave_rx_register[23]} {i2c_slave_rx_register[24]} {i2c_slave_rx_register[25]} {i2c_slave_rx_register[26]} {i2c_slave_rx_register[27]} {i2c_slave_rx_register[28]} {i2c_slave_rx_register[29]} {i2c_slave_rx_register[30]} {i2c_slave_rx_register[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {i2c_slave_rx_byte[0]} {i2c_slave_rx_byte[1]} {i2c_slave_rx_byte[2]} {i2c_slave_rx_byte[3]} {i2c_slave_rx_byte[4]} {i2c_slave_rx_byte[5]} {i2c_slave_rx_byte[6]} {i2c_slave_rx_byte[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list i2c_slave_rx_dv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list i2c_slave_tx_read]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list inst_I2C_Slave/rw_state]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CLK_IBUF_BUFG]
