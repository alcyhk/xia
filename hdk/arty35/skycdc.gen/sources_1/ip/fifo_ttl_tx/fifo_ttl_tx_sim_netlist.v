// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Mon Jun  6 13:57:42 2022
// Host        : computer running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/albert/work/vivado/skycdc/skycdc.gen/sources_1/ip/fifo_ttl_tx/fifo_ttl_tx_sim_netlist.v
// Design      : fifo_ttl_tx
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_ttl_tx,fifo_generator_v13_2_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_6,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module fifo_ttl_tx
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 24000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 24000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rst;
  wire wr_clk;
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
  wire NLW_U0_valid_UNCONNECTED;
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
  wire [8:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [8:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
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
  (* C_FAMILY = "artix7" *) 
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
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "505" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "504" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "24" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
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
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "24" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_ttl_tx_fifo_generator_v13_2_6 U0
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
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[8:0]),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
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
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYvhEjj3nb5oH8uSNLeXMIy7nJYVR9CgwYrS2YsK1wH0yG7GgJF3h7LWVAsRpUASOB7rHmuPVhb5
Ot5CFu1eFeE97Zpvi2xwlrFd2yOm/xOs4mKX3gkTIBIJmAKj42AUYk/LR9j6mOwXFIQmoZqYXHak
Pq2yC2ljr0hY1gwTFtI=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Z+2GQWpqmewONlHVkL658DHQ1gOkrvPjxsrm0NDcBmt2DgE1WctRC0/WtmZNRR2P9xNPEc1AnD3g
x2bmQ9ClncBm4tJJUerktYV7SZWaAFXLpL0mImalEctnoiL1emAUpqT2xWqYmc7/Up4fedi3U63/
6fZpFkfLPe1f/3mRlu+DKs00gVRP+t6V+01C1oWFsyvdyS5tDx/D7YWjpI8AZn7PAxGanwdNWWSB
/kAFPcC2bUzb0T91+nSe2x7K7ugumFrWpHW6iiuiY86OlLeqrAD5SZsqHhPT9GqJmSzj5PdAcMm2
1N7wj661ojPTxlfvw7ydkwisxeQEZRQ1H8LwwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NWkv++1uc4OUvmLLmKamw2rSfdpVbwBET7oFkV2XGR6y3sZCnAwLR/UY8EXqGYSYtRzQMSec4n13
l7DB/8txjOrwXvZKfRBpPdz4pIT7HDh50CC1gJaraDaEr18dxcLyq6t0fo14o+JyrAxZm7/nDg78
7/uEhQnwCkDeOEnusng=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RPz1UvQF5/1bAGbmkE93ADh5aKEj2NdkJKJJhSjosDEbYcFH8ZSL5Ew53E1CBLn7KjAnpfOLAKVf
fX9beeVP5C5vU0n7ZMu9ISDuX947ttq4eCcbaV78UxB5l1Lj8hlouzML1BQecqW1z0mUCgW7CBoO
kvS93cLpph/VpfSwuTwO3q41V7Gxeshrw2U3zfZGHMUL2TI8fX+U+qCt5oG7UGDkIiE+SZRN8eQK
SY18ZEkuzeSrAbp1xn25WHjeUYF1dwHmcNf4wRKiww67b89Lqk9DBKAL9rsw0KWuua8qjESM8t3w
D+f6RYj2AciBO842MNa2LlXNkWM+oLq1CtukmQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcQzkZp4Sch9TwvI82NYHoYu7Fu4A68g8HQ0GQQvhgP0VPOA5fVtIXlGeuCjshtvB9SbR/JdhJVW
H0AcjAKKgHxZK+en5z2azbfr9d1BbF03MjLpFIxdwUacvQfXpyvYKYFtjplThociLLWtOUmXj84s
4nP0l8PXdvTblIHap6SfZL6Dhv1jlcCTvUTUGoULVvQRU16E+vFCep9sJnLwhCCldBnB5vBZ5TCu
AXnNJpF2Gx4Y+BC9c7XyNRkVfKm11TUyI3pc5OcNWX+42CRvLbMSKG711f5VO+yZsWi9YEWqMTjN
RN18y3FwbJ9g/6K9ZswbGNgjRnn7l2PRbFrMKg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ic0gE1G8ZymuhdpWjbURYCva14oPCOYHWxeY1WbqEo4fRdhM6YimsmNp3RyJRpeG6TFY0iDQtGg1
f5g5G1LTD2KIG+dBZyfKNnTE/ZOWrLJOblPxV8gmBtOye+53NJXzi8+oEuZceCLJxPBg1t44/kD6
M9x687RC58J0HT1/+RsMdCvAGIhlkdNOkb4+dhOoGEPVtNJhV6u4ccNdcnLz1ZaIW6yGByR8UXna
8XH9yb/yWXZzxveULhlxfYe5edpqYlF99QdUnueTFFmCXxIYP4G0xwFM1S929iLWZUS13jbam+X4
5SLDsqw5epDM/DVK5Cv0VD4JajhRoM+fGT/I4Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
W34Gq4IReWdH4guFD03wBoHFTA+s1wgkA3uEFz/xWEihtgcet7BzSoGE0K8FQKLVs+D+mR8yPD8Z
vuUkN7L+imyxs7FeoUUpCBNbo0z5XahETBApULQzISBGdsC2f/p8wwDdoHY5E0UjcHOTr+Pah6x+
Kb/OiJAA3/B3geutymFuXHhdGJVoLS30F7CpbZpHTVoZZBU1TgUTFXAySsVWu7k+NMAoSxDKr4k3
10DyqW8wuvTaTG+NdumVzlwtmHHXVSiGk0//Q/9EJmzEzH0Pi9m/wmiONCYRmb0c/K5YHCIs7xNF
nWpl/fzOUJQequCzR636PCmQz3/wSjGRil3HDQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
iEsUxC8JQZnRxQOm+O4jwBmkm5PoeeMBxaBqVOvKpTXSyjvbLGMDYSb0fxpNvdSJbtZpFIPnAww+
aq3rl7doHEf1kjM2dC4rjvZWa0jWRoJIANcbomcPl6IeiRfAUGCGIDrNDxK+Y3GNvZf2de79ApcB
dTaCVwgrbloNzIJwiJkRY1og57CtPhYfZGFMkwwQ1yHtCyOiuh1DFTM1HOr7jtC54Rj43wY2EpJp
V8vuUqRPQXW8kinGG+26i34AsoOI/xAYSbvXdBHrgwQSzEVIApd8q+QxH+P/twlQ/rFGh9QkEtsf
01rrVJSI2TzVwOQBjP9yRmeHw8y91krSW2dGHHjOd+HVO8Mpbdh4nOvQiYQjNK1lqwInPGOH2bM6
kuUfNcfP9+0NlRUDVuuhbzPVr++hGny3Hvo5Aq7bQqtKrYhqiaLWIWoY6mFPGyfIoZrbVClEO/oY
G2CKj5JTQTRFxNUtusbqdXg+69YwdnuXoF9oFfaVJwpFYlKtWBm5LeRv

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YKagekiHOyMnMVPg7PmagWsOMo70GABOzboT0+MRxNHoWf+7KtPwFZmbZAZPMjbv2wgx5vSsG1VZ
GZlduGJPTey/Q2+Yx2fvgCJb2dlR/HDmPB+1X4vVosJEw5nD6m8yWJd0L+NZCG6gtRelGjAxjm68
yPC9qOiRc6jrOM91cmFC6Xi2jeY4t5FHi4zmBceasIzRWIBnat7p0fZ3CZaaY76+K02CE2jND22R
W0XlRGoYVtWNukn5s4Z4AkME8oKdQugjp9rNooVbn7sWp5td9RHT1ZxOWgINwiHb6D9MOnsOSGwz
2K1jXhGDdXe4TOnFPIn6VglS5Y05u1snfUxFlA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54352)
`pragma protect data_block
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
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
