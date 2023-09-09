// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Mon Oct 17 11:16:08 2022
// Host        : computer running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top mfifo -prefix
//               mfifo_ mfifo_stub.v
// Design      : mfifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_6,Vivado 2021.2" *)
module mfifo(clk, rst, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,din[15:0],wr_en,rd_en,dout[15:0],full,empty" */;
  input clk;
  input rst;
  input [15:0]din;
  input wr_en;
  input rd_en;
  output [15:0]dout;
  output full;
  output empty;
endmodule
