// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Sat Sep  9 19:33:29 2023
// Host        : computer running 64-bit Ubuntu 23.04
// Command     : write_verilog -force -mode synth_stub
//               /home/albert/work/vivado/forGit/arty35/skycdc.gen/sources_1/ip/mmcm/mmcm_stub.v
// Design      : mmcm
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module mmcm(clk_out0, clk_out2, clk_out3, clk_out5, reset, clk)
/* synthesis syn_black_box black_box_pad_pin="clk_out0,clk_out2,clk_out3,clk_out5,reset,clk" */;
  output clk_out0;
  output clk_out2;
  output clk_out3;
  output clk_out5;
  input reset;
  input clk;
endmodule
