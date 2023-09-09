-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Tue Nov 15 10:16:55 2022
-- Host        : computer running 64-bit Ubuntu 22.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/albert/work/vivado/arty35/skycdc.gen/sources_1/ip/cordic_rotate/cordic_rotate_stub.vhdl
-- Design      : cordic_rotate
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cordic_rotate is
  Port ( 
    aclk : in STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_phase_tready : out STD_LOGIC;
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_cartesian_tvalid : in STD_LOGIC;
    s_axis_cartesian_tready : out STD_LOGIC;
    s_axis_cartesian_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_dout_tvalid : out STD_LOGIC;
    m_axis_dout_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end cordic_rotate;

architecture stub of cordic_rotate is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,s_axis_phase_tvalid,s_axis_phase_tready,s_axis_phase_tdata[31:0],s_axis_cartesian_tvalid,s_axis_cartesian_tready,s_axis_cartesian_tdata[63:0],m_axis_dout_tvalid,m_axis_dout_tdata[63:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "cordic_v6_0_17,Vivado 2021.2";
begin
end;
