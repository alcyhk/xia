// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul 28 15:29:52 2022
// Host        : computer running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/albert/work/vivado/arty35/skycdc.gen/sources_1/ip/fifo_generator_0_1/fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_6,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module fifo_generator_0
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
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
  (* C_RD_FREQ = "50" *) 
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
  (* C_WR_FREQ = "50" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_generator_0_fifo_generator_v13_2_6 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54432)
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
