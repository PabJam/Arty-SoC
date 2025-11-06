// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Thu Nov  6 12:28:06 2025
// Host        : DESKTOP-E28LK6R running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Projekte/Arty/hw/hw.gen/sources_1/ip/UART_Fifo_2/UART_Fifo_sim_netlist.v
// Design      : UART_Fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "UART_Fifo,fifo_generator_v13_2_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_13,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module UART_Fifo
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    valid);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_mode = "slave core_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) (* x_interface_mode = "slave FIFO_WRITE" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) (* x_interface_mode = "slave FIFO_READ" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire srst;
  wire valid;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [4:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [4:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "5" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "14" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "5" *) 
  (* C_RD_DEPTH = "16" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "4" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "1" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "5" *) 
  (* C_WR_DEPTH = "16" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "4" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  UART_Fifo_fifo_generator_v13_2_13 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[4:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[4:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[4:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
gydSV72FvW4hnoyUt6yZFJHfJqjRQWPUfYIuDKP0fpjrPOkLRbJGBr4Z9msYTvoIHRlYtXJ2YMY0
d1TIQb+FK4gKsTRru9wr397OxuFBsTRf4e+ZjpYZEdsnqYWcgMSzhN4yhPvO06GyZO15y/LKBxa8
3OKwxVlOLYXhv+sxdXg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WHB6Zbfa5Qi47krP9T4L8UnPOlr881dWx7UcYaZfNGIQQM0gadcoXbhucIpRaUuyOKxv6yhKveRN
h0l+N9+KX6rbZ6+TRhP9JAMuPhlpI7T42QtRv5zx9+m3ct5S0NMszbFaK8zeTAYra5BGP7BHmtkr
MpKfLK5sFyaTE/A7ACtAace9MwFTHDZdl9uUs4aY6KJlm6GaypKduiqkNugukJp5vlFPX/ZapJqG
KMtMhI6grhcuYb1FJrwRZ4jW7hs9HxddSdGLzsZ0HsBcO/qaCPTst+ZA0YIQfd5ULlFmPqq39FfO
p1P+2hEH2n+LycbMj5cn4Dxfqv2R8eucM78R3w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
SmAzQA1VEuJXtJi5vXa2Jg7YvRqAJs6PX9HTZ1YqrJw4VfonBW3726gJ81BjlizpMkcf/Uk5sFIK
aPedVhEs4xCIZylz7gXYDshtytOA/pXUID2qV9nXr8qfI+FydSADUF3ScYDZmlkclFqlZrGq6DQ7
da3lJAzt2h/iR+cczrA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iAph5JWb/chMQpLPX1UoLjQDxN5l2I8McM/k2xN5wRht7HXoE6F5yV8luDjn3zkI6vnfUYo7BaI1
mogRRx+R3XcwxvhHr+lngh4+/YLVex1TFncl+kiUMAsu3M/FjFSiqGMVMdKTNLDqr35DuZJVyuiF
lTwXob/KkbQDJiJjBEoxbt+968rKRKRyJGcqIjm4mqRBdqMcgo3HOJFG74SFsWAQrxvXfBhdLSG3
OfoLfls9XDojBjp7G83k0h82g1eeWgBfydm/OcX9o48Pst93NvI4ua8WShZL8MCvRWYqWZrrjrWi
cfUjXAF5SDACjq1/OU6arz/Idz6/a7AP/jmexw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BY49GZBxBT/gjZDPyaSWlti/sctckoR7jK6NuWdhnF9tiyNfVU7BqjjwxSnyMi0Uucv1BKHXC18h
8hQbFWnNtrq71ilURotXux7sssHlVJ2i1CsJWU18DOcBWxm2ai89uwvxDJh3TJkBJixB5KPvsDhL
lWOjTvZWPoR+Ixy+Tzo+U5Vx7z7SOakRwTrn3u7+c3vmCEBphE+HKeJExhBAoOEd0SXK5iwXaByW
D7Wb7zq6NNUmnCyaJ2BG9kGxLVsf+md7SlocuaFsYyaRZhwPyTucxIlz1tLYwcytKzx0ovoax3no
nYgzlzP/F0/PDWk9BqXgr/tuclc4EZYX0cf4ng==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qGnCvL35qO7cbUEKCL50yDv1UvezcqBz601zctKop1954QlcjemzZWZHg1zJ00nJaToNdH2S8AKX
n8hNJvbQ+x5HEGL5DoSU9m5qjXd8xxocnZ0yzuZX/dGCT8kDn3gWJR2Gz13pT+w2LQUno1fX+MsC
ehgwvjBBT6GeYjdxHi+aybQUP9AblSxX/z3vh857SGCPohEWvghOgORCHAe45YD+ZWnL62FLxMM2
c+Ozq/Au/Q4q1Yzlzcfv8Mnsvg7OqOeEamQHbuYOfdkJUuYqOwsskEWW348u7FXtsf8m7P3pZyyz
IWyTDAW4igGguMPLHfbtK/twZx8ScJQmOKzglg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hz+6K8+wh5/fukU4ZWNDXGsq6hreSVCSPP67nA6kUz9Vpjy4TtTnOrrl1BWY0ivEC7Ldyw8VI60A
VO/WPlt409LdAZdMZGsEZ1JuTZ0m9LPcgu9CPCyoMECctmd8LHE+otY6etTmYABB9syY61rk2hrv
RgbcyT/HCK9TzWxSm+XMqvx2nvagCLkMDPh/JZv51fj2zcKaBPnxsz8rnDipaeo0fEyVRC3Y1F/V
U3RmXojBjIumPHSJkQ537dENJEIA0Ra65u8EM/+ItUn1bcryLcIbKy1xGadrHmHdHRUoRcAodO2C
B48bNVeL0VnGg8P9ACIB04lMNzn5p6A1tPOb4Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
YDpb+UeT0rJ543Q8wCo2xSS3gpVAT+JoStgBlV5IMjJoUOWkiOPn691FGChmDi3BTq5NxC73KHHR
1galACCjeTGq6cv+0Zc2Ocm1oobdrnSPHp7TMDr5Zle8FX6WywJCiGdoWBODggZSlbOASIK/PVfY
cZM2z60M6RSvzsi3TnYHiKYHpju8THVoSgRd6r31GcbiSy9TjjARERXan0OVc79jGuAg90mmDEEq
91eqmn6NZ9yLI2fgBjFUZbtFCpmJ8WGxOL1h39niWnRK3ZXnk8jcpnZUlxLbYTPO0Z3vVr1zrvcn
RVQloU0OLqg7M95zSs7NtX5Vzvb6jGbMehWV+WMMyxWmxL2XOwsAwPSeX2dI2r77pioY7X6VzH7f
/JxMAnq9udra3WGPsUkD1G0CvPkCC3zdxjpVaflY37ztX9UONhKtzMQa8lJc1IL8GhXRY3R9Lg2c
HIeXSGkpNNuFDqKT6Khe/6Casq+SjFJq+IH9IUtz6RUZTkbFb0Xhgm2P

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q+63zFEYw/LeMgxa7g8g79GGvSyIKDKD8RvvC4DHDQuGObf6n9OGZX4e17v/E/+EDEwUhsWQHFDI
Lp/aH+6fNRmhu9BEWVjxq2WRrQSl4eQjfIaSOXu2dlYh3JjRJwiUp4LteVh8RFAf5t5sRQO4dRIK
x+h28yliSgibaWEAv5FaJQ1EFbNwmgedAaSYjgf2A3afBUcBh5Uy9VHbW/zRzdhhJdsVNBjZYcFy
CVLOcf1toCRp8J4U5FlnFMOzFegUbdXFQhq2VmIhPRxWjrfTk6iR4BcMEN9UMij/5IHRAeBdksyD
CqEKsyFxosbI5KVMRZ1Ln75Zipn0JdsGekHkxg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DPUa5DLPYRWvbPnX0U412yoWvvvHyuq43DrYmDJGTK0cR5U4U6th8icYgizC1/hUAEzt19kM/hVa
zZh7bXSWACYLpcfhPY8dRTVGDZVjpbkraw0ceBryLP7jc6Jt5JdNw88tZtZpprCB7nQ25lUL82Hf
WTwL1ZqgGIvtfHhxO0JF5L5ES5giedwQ6u5ffXG3UB6ELcpQD1NvpW5lAz4mfXyvVDCAPZN581TF
tlAy79iKbPKlJ2zFn1BS2cuRIHHe2JRxwPo+0n5VD5CXVgg+lCYxTnCxI8CdyFaTumbs4IfAKwVI
wSN/btbwDUhW9hAHWHIRo+BpdJ4qeGcTDPKtsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mf5hcf6JE6yLm0jNCQnHMVmogjLlPz6re0FwG67yvOJ3FuEorru0emIeAKEwgOoxjUYNWvcM7QAH
/UEeB2EIdjLl6glPAUda0HjtaCU2rdncVdM8k6DSMBggc4yo18Qx5F+1TD/RoBgoo0jNkMdDy6wJ
JHjqlN+R01z3yYIMQ9f2z6ZaYncbBYEp4+YAb7g1D7CSMxP5cFRpQznRpYp0JwqJfT9CHzlKgdab
8B288NxeLM66iYodiTS+GSRGLGtDWXpz9yeiuiPe6kJxae2GJyHIMSfluO/0Slc3m24DQNdbojf8
jdc0G2UnrDe5mCUTfYiDmpOWTUJOdYo0FK0N2g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 82368)
`pragma protect data_block
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
vYw7
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
