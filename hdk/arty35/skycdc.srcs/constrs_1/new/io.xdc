#set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets getMatrix32_PHY_1[14][0]]
#set_property ALLOW_COMBINATORIAL_LOOPS true [get_cells getMatrix32_PHY_1[14]_inferred_i_8]

#set_property SEVERITY {Warning}  [get_drc_checks LUTLP-1]

#set_property SEVERITY {Warning} [get_drc_checks NSTD-1]



set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]]

set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]]

set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]]


set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]]

set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]]

set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]]

set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT1]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT2]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT3]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT4]]
set_false_path -from [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT6]] -to [get_clocks -of_objects [get_pins ClockAndReset_inst/mmcm_inst/inst/mmcm_adv_inst/CLKOUT5]]



set_property PACKAGE_PIN E3 [get_ports clk]
set_property PACKAGE_PIN A9 [get_ports uart0_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVTTL [get_ports uart0_rxd]
set_property IOSTANDARD LVTTL [get_ports uart0_txd]
set_property PULLUP true [get_ports uart0_txd]
set_property DRIVE 12 [get_ports uart0_txd]

#create_clock -name clkUart -period 40
#set_input_delay -clock clkUart 30 [get_ports uart0_rxd]
#set_output_delay -clock clkUart 30 [get_ports uart0_txd]


############################################################################################
set_property PACKAGE_PIN R3 [get_ports {g_ddr3_dq[15]}]
set_property PACKAGE_PIN L3 [get_ports {g_ddr3_dq[1]}]
set_property PACKAGE_PIN K3 [get_ports {g_ddr3_dq[2]}]
set_property PACKAGE_PIN L6 [get_ports {g_ddr3_dq[3]}]
set_property PACKAGE_PIN M3 [get_ports {g_ddr3_dq[4]}]
set_property PACKAGE_PIN M1 [get_ports {g_ddr3_dq[5]}]
set_property PACKAGE_PIN L4 [get_ports {g_ddr3_dq[6]}]
set_property PACKAGE_PIN M2 [get_ports {g_ddr3_dq[7]}]
set_property PACKAGE_PIN V4 [get_ports {g_ddr3_dq[8]}]
set_property PACKAGE_PIN K5 [get_ports {g_ddr3_dq[0]}]
set_property PACKAGE_PIN U4 [get_ports {g_ddr3_dq[10]}]
set_property PACKAGE_PIN V5 [get_ports {g_ddr3_dq[11]}]
set_property PACKAGE_PIN V1 [get_ports {g_ddr3_dq[12]}]
set_property PACKAGE_PIN T3 [get_ports {g_ddr3_dq[13]}]
set_property PACKAGE_PIN U3 [get_ports {g_ddr3_dq[14]}]
set_property PACKAGE_PIN N2 [get_ports {g_ddr3_dqs_p[0]}]
set_property PACKAGE_PIN U2 [get_ports {g_ddr3_dqs_p[1]}]
set_property PACKAGE_PIN T5 [get_ports {g_ddr3_dq[9]}]
set_property INTERNAL_VREF 0.675 [get_iobanks 34]


set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[15]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[1]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[2]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[3]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[4]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[5]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[6]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[7]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[8]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[0]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[10]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[11]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[12]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[13]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[14]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dqs_p[0]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dqs_p[1]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dq[9]}]



set_property PACKAGE_PIN T8 [get_ports {g_ddr3_addr[13]}]
set_property PACKAGE_PIN T6 [get_ports {g_ddr3_addr[12]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[13]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[12]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[11]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[10]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[9]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[8]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[7]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[6]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[5]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[4]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[3]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[2]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[1]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_addr[0]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_ba[2]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_ba[1]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_ba[0]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_cke[0]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_cs_n[0]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dm[1]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dm[0]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_odt[0]}]
set_property IOSTANDARD SSTL135 [get_ports g_ddr3_cas_n]
set_property IOSTANDARD SSTL135 [get_ports g_ddr3_ras_n]
set_property IOSTANDARD SSTL135 [get_ports g_ddr3_reset_n]
set_property IOSTANDARD SSTL135 [get_ports g_ddr3_we_n]

set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_ck_p[0]}]


set_property PACKAGE_PIN U6 [get_ports {g_ddr3_addr[11]}]
set_property PACKAGE_PIN R6 [get_ports {g_ddr3_addr[10]}]
set_property PACKAGE_PIN V7 [get_ports {g_ddr3_addr[9]}]
set_property PACKAGE_PIN R8 [get_ports {g_ddr3_addr[8]}]
set_property PACKAGE_PIN U7 [get_ports {g_ddr3_addr[7]}]
set_property PACKAGE_PIN V6 [get_ports {g_ddr3_addr[6]}]
set_property PACKAGE_PIN R7 [get_ports {g_ddr3_addr[5]}]
set_property PACKAGE_PIN N6 [get_ports {g_ddr3_addr[4]}]
set_property PACKAGE_PIN T1 [get_ports {g_ddr3_addr[3]}]
set_property PACKAGE_PIN N4 [get_ports {g_ddr3_addr[2]}]
set_property PACKAGE_PIN M6 [get_ports {g_ddr3_addr[1]}]
set_property PACKAGE_PIN R2 [get_ports {g_ddr3_addr[0]}]
set_property PACKAGE_PIN P2 [get_ports {g_ddr3_ba[2]}]
set_property PACKAGE_PIN P4 [get_ports {g_ddr3_ba[1]}]
set_property PACKAGE_PIN R1 [get_ports {g_ddr3_ba[0]}]
set_property PACKAGE_PIN U9 [get_ports {g_ddr3_ck_p[0]}]
set_property PACKAGE_PIN N5 [get_ports {g_ddr3_cke[0]}]
set_property PACKAGE_PIN U8 [get_ports {g_ddr3_cs_n[0]}]
set_property PACKAGE_PIN U1 [get_ports {g_ddr3_dm[1]}]
set_property PACKAGE_PIN L1 [get_ports {g_ddr3_dm[0]}]
set_property PACKAGE_PIN R5 [get_ports {g_ddr3_odt[0]}]
set_property PACKAGE_PIN M4 [get_ports g_ddr3_cas_n]
set_property PACKAGE_PIN P3 [get_ports g_ddr3_ras_n]
set_property PACKAGE_PIN K6 [get_ports g_ddr3_reset_n]
set_property PACKAGE_PIN P5 [get_ports g_ddr3_we_n]


set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_ck_n[0]}]
set_property PACKAGE_PIN V9 [get_ports {g_ddr3_ck_n[0]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dqs_n[1]}]
set_property IOSTANDARD SSTL135 [get_ports {g_ddr3_dqs_n[0]}]
set_property PACKAGE_PIN N1 [get_ports {g_ddr3_dqs_n[0]}]
set_property PACKAGE_PIN V2 [get_ports {g_ddr3_dqs_n[1]}]

#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets clk_w]

set_property IOSTANDARD LVCMOS33 [get_ports g_C]
set_property IOSTANDARD LVCMOS33 [get_ports g_dq0]
set_property IOSTANDARD LVCMOS33 [get_ports g_dq1]
set_property IOSTANDARD LVCMOS33 [get_ports g_dq2]
set_property IOSTANDARD LVCMOS33 [get_ports g_dq3]
set_property IOSTANDARD LVCMOS33 [get_ports g_s]
set_property PACKAGE_PIN K17 [get_ports g_dq0]
set_property PACKAGE_PIN K18 [get_ports g_dq1]
set_property PACKAGE_PIN L14 [get_ports g_dq2]
set_property PACKAGE_PIN M14 [get_ports g_dq3]
set_property PACKAGE_PIN L13 [get_ports g_s]
set_property PACKAGE_PIN L16 [get_ports g_C]

set_false_path -from [get_pins -hierarchical *ack*]


create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets clkNor_BUFG]

set_property IOSTANDARD LVTTL [get_ports uart1_rxd]
set_property IOSTANDARD LVTTL [get_ports uart1_txd]

set_property IOSTANDARD LVCMOS33 [get_ports g_mmc_C]
set_property IOSTANDARD LVCMOS33 [get_ports g_mmc_miso]
set_property IOSTANDARD LVCMOS33 [get_ports g_mmc_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports g_mmc_s]
#set_property IOSTANDARD LVTTL [get_ports g_mmc_txd]
set_property PACKAGE_PIN D3 [get_ports g_mmc_s]
set_property PACKAGE_PIN F4 [get_ports g_mmc_C]
set_property PACKAGE_PIN F3 [get_ports g_mmc_mosi]
#set_property PACKAGE_PIN A18 [get_ports g_mmc_txd]

set_property PACKAGE_PIN D10 [get_ports uart0_txd]

set_property PULLUP true [get_ports uart1_txd]

set_property IOSTANDARD LVTTL [get_ports uart2_txd]

set_property IOSTANDARD LVTTL [get_ports uart2_rxd]

set_property IOSTANDARD LVTTL [get_ports uart3_txd]

set_property IOSTANDARD LVTTL [get_ports uart3_rxd]

set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[0]}]




set_property PULLUP true [get_ports uart3_txd]
set_property PULLUP true [get_ports uart2_txd]



set_property PACKAGE_PIN U13 [get_ports g_fmc_bl]
set_property IOSTANDARD LVCMOS33 [get_ports g_fmc_bl]
set_property PACKAGE_PIN D13 [get_ports g_fmc_cs]
set_property PACKAGE_PIN B11 [get_ports g_fmc_rd]
set_property PACKAGE_PIN A18 [get_ports g_fmc_rst]
set_property IOSTANDARD LVCMOS33 [get_ports g_fmc_cs]
set_property IOSTANDARD LVCMOS33 [get_ports g_fmc_rd]
set_property IOSTANDARD LVCMOS33 [get_ports g_fmc_rs]
set_property IOSTANDARD LVCMOS33 [get_ports g_fmc_rst]
set_property IOSTANDARD LVCMOS33 [get_ports g_fmc_wr]
set_property PACKAGE_PIN T13 [get_ports {g_fmc_dq[15]}]
set_property PACKAGE_PIN V14 [get_ports {g_fmc_dq[13]}]
set_property PACKAGE_PIN U14 [get_ports {g_fmc_dq[11]}]
set_property PACKAGE_PIN J15 [get_ports {g_fmc_dq[9]}]
set_property PACKAGE_PIN K15 [get_ports {g_fmc_dq[7]}]
set_property PACKAGE_PIN J18 [get_ports {g_fmc_dq[5]}]
set_property PACKAGE_PIN J17 [get_ports {g_fmc_dq[3]}]
set_property PACKAGE_PIN K16 [get_ports {g_fmc_dq[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_fmc_dq[0]}]

set_property PACKAGE_PIN E2 [get_ports g_twi_int]
set_property PACKAGE_PIN V11 [get_ports g_twi_scl]
set_property PACKAGE_PIN D2 [get_ports g_twi_rst]
set_property IOSTANDARD LVCMOS33 [get_ports g_twi_int]
set_property IOSTANDARD LVCMOS33 [get_ports g_twi_rst]
set_property IOSTANDARD LVCMOS33 [get_ports g_twi_scl]
set_property IOSTANDARD LVCMOS33 [get_ports g_twi_sda]

set_property PACKAGE_PIN E1 [get_ports {g_gpios[0]}]
set_property PACKAGE_PIN G6 [get_ports {g_gpios[1]}]
set_property PACKAGE_PIN F6 [get_ports {g_gpios[2]}]
set_property PACKAGE_PIN G4 [get_ports {g_gpios[3]}]
set_property PACKAGE_PIN G3 [get_ports {g_gpios[4]}]
set_property PACKAGE_PIN J4 [get_ports {g_gpios[5]}]
set_property PACKAGE_PIN H4 [get_ports {g_gpios[6]}]
set_property PACKAGE_PIN J3 [get_ports {g_gpios[7]}]
set_property PACKAGE_PIN J2 [get_ports {g_gpios[8]}]
set_property PACKAGE_PIN K2 [get_ports {g_gpios[9]}]
set_property PACKAGE_PIN K1 [get_ports {g_gpios[10]}]
set_property PACKAGE_PIN H6 [get_ports {g_gpios[11]}]
set_property PACKAGE_PIN H5 [get_ports {g_gpios[12]}]
set_property PACKAGE_PIN J5 [get_ports {g_gpios[13]}]
set_property PACKAGE_PIN T9 [get_ports {g_gpios[14]}]
set_property PACKAGE_PIN T10 [get_ports {g_gpios[15]}]

set_property PACKAGE_PIN D9 [get_ports {g_gpios_in[0]}]
set_property PACKAGE_PIN C9 [get_ports {g_gpios_in[1]}]
set_property PACKAGE_PIN B9 [get_ports {g_gpios_in[2]}]
set_property PACKAGE_PIN B8 [get_ports {g_gpios_in[3]}]
set_property PACKAGE_PIN A8 [get_ports {g_gpios_in[4]}]
set_property PACKAGE_PIN C11 [get_ports {g_gpios_in[5]}]
set_property PACKAGE_PIN C10 [get_ports {g_gpios_in[6]}]
set_property PACKAGE_PIN A10 [get_ports {g_gpios_in[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[0]}]
set_property PACKAGE_PIN N15 [get_ports uart1_rxd]
set_property PACKAGE_PIN M16 [get_ports uart1_txd]
set_property PACKAGE_PIN V17 [get_ports uart2_rxd]
set_property PACKAGE_PIN U18 [get_ports uart2_txd]
set_property PACKAGE_PIN R17 [get_ports uart3_rxd]
set_property PACKAGE_PIN P17 [get_ports uart3_txd]


set_property PACKAGE_PIN C5 [get_ports {g_ck_an_n[0]}]
set_property PACKAGE_PIN C6 [get_ports {g_ck_an_p[0]}]
set_property PACKAGE_PIN A5 [get_ports {g_ck_an_n[1]}]
set_property PACKAGE_PIN A6 [get_ports {g_ck_an_p[1]}]
set_property PACKAGE_PIN B4 [get_ports {g_ck_an_n[2]}]
set_property PACKAGE_PIN C4 [get_ports {g_ck_an_p[2]}]
set_property PACKAGE_PIN A1 [get_ports {g_ck_an_n[3]}]
set_property PACKAGE_PIN B1 [get_ports {g_ck_an_p[3]}]
set_property PACKAGE_PIN B2 [get_ports {g_ck_an_n[4]}]
set_property PACKAGE_PIN B3 [get_ports {g_ck_an_p[4]}]
set_property PACKAGE_PIN C14 [get_ports {g_ck_an_n[5]}]
set_property PACKAGE_PIN D14 [get_ports {g_ck_an_p[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_n[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_n[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_n[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_n[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_n[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_n[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_p[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_p[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_p[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_p[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_p[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_p[0]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[15]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_dac[5]}]

set_property PACKAGE_PIN U11 [get_ports {g_dac[0]}]
set_property PACKAGE_PIN V16 [get_ports {g_dac[1]}]
set_property PACKAGE_PIN M13 [get_ports {g_dac[2]}]
set_property PACKAGE_PIN R10 [get_ports {g_dac[3]}]
set_property PACKAGE_PIN R11 [get_ports {g_dac[4]}]
set_property PACKAGE_PIN R13 [get_ports {g_dac[5]}]
set_property PACKAGE_PIN R15 [get_ports {g_dac[6]}]
set_property PACKAGE_PIN P15 [get_ports {g_dac[7]}]



set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_p[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_p[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_p[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_n[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_n[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_ck_an_n[8]}]
set_property PACKAGE_PIN B7 [get_ports {g_ck_an_p[6]}]
set_property PACKAGE_PIN B6 [get_ports {g_ck_an_n[6]}]
set_property PACKAGE_PIN E6 [get_ports {g_ck_an_p[7]}]
set_property PACKAGE_PIN E5 [get_ports {g_ck_an_n[7]}]
set_property PACKAGE_PIN A4 [get_ports {g_ck_an_p[8]}]
set_property PACKAGE_PIN A3 [get_ports {g_ck_an_n[8]}]

#set_property IOSTANDARD LVCMOS33 [get_ports g_spi_cs]
set_property IOSTANDARD LVCMOS33 [get_ports g_spi_miso]
set_property IOSTANDARD LVCMOS33 [get_ports g_spi_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports g_spi_sck]
set_property PACKAGE_PIN G1 [get_ports g_spi_miso]
#set_property PACKAGE_PIN C1 [get_ports g_spi_cs]

#set_property IOSTANDARD LVCMOS33 [get_ports g_i2c_scl]
#set_property IOSTANDARD LVCMOS33 [get_ports g_i2c_sda]
#set_property PACKAGE_PIN M18 [get_ports g_i2c_sda]
#set_property PACKAGE_PIN L18 [get_ports g_i2c_scl]

set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g_gpios_in[8]}]
set_property PACKAGE_PIN R16 [get_ports {g_gpios_in[8]}]
set_property PACKAGE_PIN N16 [get_ports {g_gpios_in[9]}]
set_property PACKAGE_PIN N14 [get_ports {g_gpios_in[10]}]
set_property PACKAGE_PIN U17 [get_ports {g_gpios_in[11]}]

set_property PACKAGE_PIN V15 [get_ports {g_gpios[16]}]
set_property PACKAGE_PIN U16 [get_ports {g_gpios[17]}]
set_property PACKAGE_PIN P14 [get_ports {g_gpios[18]}]
set_property PACKAGE_PIN T11 [get_ports {g_gpios[19]}]
set_property PACKAGE_PIN R12 [get_ports {g_gpios[20]}]
set_property PACKAGE_PIN T14 [get_ports {g_gpios[21]}]
set_property PACKAGE_PIN T15 [get_ports {g_gpios[22]}]
set_property PACKAGE_PIN T16 [get_ports {g_gpios[23]}]

set_property IOSTANDARD LVCMOS33 [get_ports g_spi_cs0]
set_property IOSTANDARD LVCMOS33 [get_ports g_spi_cs1]
set_property IOSTANDARD LVCMOS33 [get_ports g_spi_cs2]
set_property PACKAGE_PIN T18 [get_ports g_spi_cs1]
set_property PACKAGE_PIN R18 [get_ports g_spi_cs2]
set_property PACKAGE_PIN C1 [get_ports g_spi_cs0]

set_property PACKAGE_PIN M18 [get_ports g_twi_m_sda0]
set_property IOSTANDARD LVCMOS33 [get_ports g_twi_m_sda0]
set_property IOSTANDARD LVCMOS33 [get_ports g_twi_m_scl0]
set_property PACKAGE_PIN L18 [get_ports g_twi_m_scl0]

set_property IOSTANDARD LVCMOS33 [get_ports g_twi_m_scl1]
set_property IOSTANDARD LVCMOS33 [get_ports g_twi_m_sda1]
set_property PACKAGE_PIN N17 [get_ports g_twi_m_scl1]
set_property PACKAGE_PIN P18 [get_ports g_twi_m_sda1]

set_property PACKAGE_PIN F1 [get_ports g_spi_sck]

set_property PACKAGE_PIN H1 [get_ports g_spi_mosi]

set_property PACKAGE_PIN G13 [get_ports g_fmc_rs]
set_property PACKAGE_PIN B18 [get_ports g_fmc_wr]
set_property PACKAGE_PIN A11 [get_ports {g_fmc_dq[0]}]
set_property PACKAGE_PIN D12 [get_ports {g_fmc_dq[2]}]
set_property PACKAGE_PIN V12 [get_ports {g_fmc_dq[14]}]
set_property PACKAGE_PIN U12 [get_ports {g_fmc_dq[12]}]
set_property PACKAGE_PIN C15 [get_ports {g_fmc_dq[10]}]
set_property PACKAGE_PIN D15 [get_ports {g_fmc_dq[8]}]
set_property PACKAGE_PIN E16 [get_ports {g_fmc_dq[6]}]
set_property PACKAGE_PIN E15 [get_ports {g_fmc_dq[4]}]
set_property PACKAGE_PIN V10 [get_ports g_twi_sda]

set_property PACKAGE_PIN G2 [get_ports g_mmc_miso]


set_property IOSTANDARD LVCMOS33 [get_ports g_mmc_vcc]

set_property DRIVE 12 [get_ports g_mmc_vcc]
set_property SLEW SLOW [get_ports g_mmc_vcc]
set_property PACKAGE_PIN D4 [get_ports g_mmc_vcc]
