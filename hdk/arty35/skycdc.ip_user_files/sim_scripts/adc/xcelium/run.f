-makelib xcelium_lib/xpm -sv \
  "/home/albert/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/albert/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/home/albert/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../skycdc.gen/sources_1/ip/adc/adc.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

