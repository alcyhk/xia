// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Jun  8 10:51:16 2022
// Host        : computer running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/albert/work/vivado/arty35/skycdc.gen/sources_1/ip/fifo_ttl/fifo_ttl_sim_netlist.v
// Design      : fifo_ttl
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_ttl,fifo_generator_v13_2_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_6,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module fifo_ttl
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
  fifo_ttl_fifo_generator_v13_2_6 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 54304)
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
