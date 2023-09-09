-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Sat Sep  9 19:33:29 2023
-- Host        : computer running 64-bit Ubuntu 23.04
-- Command     : write_vhdl -force -mode synth_stub
--               /home/albert/work/vivado/forGit/arty35/skycdc.gen/sources_1/ip/mmcm/mmcm_stub.vhdl
-- Design      : mmcm
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mmcm is
  Port ( 
    clk_out0 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    clk_out5 : out STD_LOGIC;
    reset : in STD_LOGIC;
    clk : in STD_LOGIC
  );

end mmcm;

architecture stub of mmcm is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out0,clk_out2,clk_out3,clk_out5,reset,clk";
begin
end;
