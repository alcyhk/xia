// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Tue Nov 15 09:26:04 2022
// Host        : computer running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top multiplier -prefix
//               multiplier_ multiplier_stub.v
// Design      : multiplier
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_17,Vivado 2021.2" *)
module multiplier(CLK, A, B, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[31:0],B[31:0],P[31:0]" */;
  input CLK;
  input [31:0]A;
  input [31:0]B;
  output [31:0]P;
endmodule
