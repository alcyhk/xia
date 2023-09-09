 `default_nettype none
module top(   
   
    input wire clk,
    
    inout wire g_twi_int,
    output wire g_twi_scl,
    inout wire g_twi_sda,
    output wire g_twi_rst,
    
    inout wire [15:0] g_fmc_dq,
    output wire g_fmc_cs, 
    output wire g_fmc_rs, 
    output wire g_fmc_rd, 
    output wire g_fmc_wr, 
    output wire g_fmc_rst,
    output wire g_fmc_bl,
    
    output  wire    [23:0]  g_gpios,
    input   wire    [11:0]   g_gpios_in,
    
    output  wire            g_ddr3_reset_n,
    output  wire    [0:0]   g_ddr3_cke,
    output  wire    [0:0]   g_ddr3_ck_p, 
    output  wire    [0:0]   g_ddr3_ck_n,
    output  wire    [0:0]   g_ddr3_cs_n,
    output  wire            g_ddr3_ras_n, 
    output  wire            g_ddr3_cas_n, 
    output  wire            g_ddr3_we_n,
    output  wire    [2:0]   g_ddr3_ba,
    output  wire    [13:0]  g_ddr3_addr,
    output  wire    [0:0]   g_ddr3_odt,
    output  wire    [1:0]   g_ddr3_dm,
    inout   wire    [1:0]   g_ddr3_dqs_p,
    inout   wire    [1:0]   g_ddr3_dqs_n,
    inout   wire    [15:0]  g_ddr3_dq,
    
    
    output wire g_C,
    inout wire g_dq3,
    inout wire g_dq0,
    inout wire g_dq1,
    inout wire g_dq2,
    output wire g_s
    ,output wire uart0_txd
    ,input wire uart0_rxd
    ,output wire uart1_txd
    ,input wire uart1_rxd
    ,output wire uart2_txd
    ,input wire uart2_rxd
    ,output wire uart3_txd
    ,input wire uart3_rxd
    
    
    ,output wire g_mmc_C
    ,output wire g_mmc_mosi
    ,input wire g_mmc_miso
    ,output wire g_mmc_s
    
    
    ,input wire [8:0] g_ck_an_p
    ,input wire [8:0] g_ck_an_n
    ,input wire g_vp_in
    ,input wire g_vn_in
    
    ,output wire [7:0] g_dac
    
    
    ,input wire g_spi_miso
    ,output wire g_spi_mosi
    ,output wire g_spi_cs0
    ,output wire g_spi_cs1
    ,output wire g_spi_cs2
    ,output wire g_spi_sck
    
    ,inout wire g_twi_m_sda0
    ,output wire g_twi_m_scl0
    ,inout wire g_twi_m_sda1
    ,output wire g_twi_m_scl1
    
    ,output wire g_mmc_vcc
    
    
    
    
    
    
     );
assign g_mmc_vcc = 1;
`include "param.vh"
`define DEF_UART_TX0
`define DEF_UART_TX1
`define DEF_UART_TX2
`define DEF_UART_TX3
`define DEF_UART_RX0
`define DEF_UART_RX1
`define DEF_UART_RX2
`define DEF_UART_RX3
`define DEF_TCH
`define DEF_FMC
`define DEF_ARITH
`define DEF_DDR3
`define DEF_GPIO
`define DEF_ADC
`define DEF_DAC
`define DEF_MMC
`define DEF_SPI
`define DEF_TWI
wire reset_fifo;
localparam BRAM_SIZE =12;
wire ROUTE_TS_00;wire ROUTE_TS_01;wire ROUTE_TS_02;wire ROUTE_TS_03;wire ROUTE_TS_04;wire ROUTE_TS_05;wire ROUTE_TS_06;wire ROUTE_TS_07;wire ROUTE_TS_08;wire ROUTE_TS_09;wire ROUTE_TS_0a;wire ROUTE_TS_0b;wire ROUTE_TS_0c;wire ROUTE_TS_0d;wire ROUTE_TS_0e;wire ROUTE_TS_0f;
wire ROUTE_TS_10;wire ROUTE_TS_11;wire ROUTE_TS_12;wire ROUTE_TS_13;wire ROUTE_TS_14;wire ROUTE_TS_15;wire ROUTE_TS_16;wire ROUTE_TS_17;wire ROUTE_TS_18;wire ROUTE_TS_19;wire ROUTE_TS_1a;wire ROUTE_TS_1b;wire ROUTE_TS_1c;wire ROUTE_TS_1d;wire ROUTE_TS_1e;wire ROUTE_TS_1f;
wire ROUTE_TS_20;wire ROUTE_TS_21;wire ROUTE_TS_22;wire ROUTE_TS_23;wire ROUTE_TS_24;wire ROUTE_TS_25;wire ROUTE_TS_26;wire ROUTE_TS_27;wire ROUTE_TS_28;wire ROUTE_TS_29;wire ROUTE_TS_2a;wire ROUTE_TS_2b;wire ROUTE_TS_2c;wire ROUTE_TS_2d;wire ROUTE_TS_2e;wire ROUTE_TS_2f;
wire ROUTE_TS_30;wire ROUTE_TS_31;wire ROUTE_TS_32;wire ROUTE_TS_33;wire ROUTE_TS_34;wire ROUTE_TS_35;wire ROUTE_TS_36;wire ROUTE_TS_37;wire ROUTE_TS_38;wire ROUTE_TS_39;wire ROUTE_TS_3a;wire ROUTE_TS_3b;wire ROUTE_TS_3c;wire ROUTE_TS_3d;wire ROUTE_TS_3e;wire ROUTE_TS_3f;
wire ROUTE_TS_40;wire ROUTE_TS_41;wire ROUTE_TS_42;wire ROUTE_TS_43;wire ROUTE_TS_44;wire ROUTE_TS_45;wire ROUTE_TS_46;wire ROUTE_TS_47;wire ROUTE_TS_48;wire ROUTE_TS_49;wire ROUTE_TS_4a;wire ROUTE_TS_4b;wire ROUTE_TS_4c;wire ROUTE_TS_4d;wire ROUTE_TS_4e;wire ROUTE_TS_4f;
wire ROUTE_TS_50;wire ROUTE_TS_51;wire ROUTE_TS_52;wire ROUTE_TS_53;wire ROUTE_TS_54;wire ROUTE_TS_55;wire ROUTE_TS_56;wire ROUTE_TS_57;wire ROUTE_TS_58;wire ROUTE_TS_59;wire ROUTE_TS_5a;wire ROUTE_TS_5b;wire ROUTE_TS_5c;wire ROUTE_TS_5d;wire ROUTE_TS_5e;wire ROUTE_TS_5f;
wire ROUTE_TS_60;wire ROUTE_TS_61;wire ROUTE_TS_62;wire ROUTE_TS_63;wire ROUTE_TS_64;wire ROUTE_TS_65;wire ROUTE_TS_66;wire ROUTE_TS_67;wire ROUTE_TS_68;wire ROUTE_TS_69;wire ROUTE_TS_6a;wire ROUTE_TS_6b;wire ROUTE_TS_6c;wire ROUTE_TS_6d;wire ROUTE_TS_6e;wire ROUTE_TS_6f;
wire ROUTE_TS_70;wire ROUTE_TS_71;wire ROUTE_TS_72;wire ROUTE_TS_73;wire ROUTE_TS_74;wire ROUTE_TS_75;wire ROUTE_TS_76;wire ROUTE_TS_77;wire ROUTE_TS_78;wire ROUTE_TS_79;wire ROUTE_TS_7a;wire ROUTE_TS_7b;wire ROUTE_TS_7c;wire ROUTE_TS_7d;wire ROUTE_TS_7e;wire ROUTE_TS_7f;
wire ROUTE_TS_80;wire ROUTE_TS_81;wire ROUTE_TS_82;wire ROUTE_TS_83;wire ROUTE_TS_84;wire ROUTE_TS_85;wire ROUTE_TS_86;wire ROUTE_TS_87;wire ROUTE_TS_88;wire ROUTE_TS_89;wire ROUTE_TS_8a;wire ROUTE_TS_8b;wire ROUTE_TS_8c;wire ROUTE_TS_8d;wire ROUTE_TS_8e;wire ROUTE_TS_8f;
wire ROUTE_TS_90;wire ROUTE_TS_91;wire ROUTE_TS_92;wire ROUTE_TS_93;wire ROUTE_TS_94;wire ROUTE_TS_95;wire ROUTE_TS_96;wire ROUTE_TS_97;wire ROUTE_TS_98;wire ROUTE_TS_99;wire ROUTE_TS_9a;wire ROUTE_TS_9b;wire ROUTE_TS_9c;wire ROUTE_TS_9d;wire ROUTE_TS_9e;wire ROUTE_TS_9f;
wire ROUTE_TS_a0;wire ROUTE_TS_a1;wire ROUTE_TS_a2;wire ROUTE_TS_a3;wire ROUTE_TS_a4;wire ROUTE_TS_a5;wire ROUTE_TS_a6;wire ROUTE_TS_a7;wire ROUTE_TS_a8;wire ROUTE_TS_a9;wire ROUTE_TS_aa;wire ROUTE_TS_ab;wire ROUTE_TS_ac;wire ROUTE_TS_ad;wire ROUTE_TS_ae;wire ROUTE_TS_af;
wire ROUTE_TS_b0;wire ROUTE_TS_b1;wire ROUTE_TS_b2;wire ROUTE_TS_b3;wire ROUTE_TS_b4;wire ROUTE_TS_b5;wire ROUTE_TS_b6;wire ROUTE_TS_b7;wire ROUTE_TS_b8;wire ROUTE_TS_b9;wire ROUTE_TS_ba;wire ROUTE_TS_bb;wire ROUTE_TS_bc;wire ROUTE_TS_bd;wire ROUTE_TS_be;wire ROUTE_TS_bf;
wire ROUTE_TS_c0;wire ROUTE_TS_c1;wire ROUTE_TS_c2;wire ROUTE_TS_c3;wire ROUTE_TS_c4;wire ROUTE_TS_c5;wire ROUTE_TS_c6;wire ROUTE_TS_c7;wire ROUTE_TS_c8;wire ROUTE_TS_c9;wire ROUTE_TS_ca;wire ROUTE_TS_cb;wire ROUTE_TS_cc;wire ROUTE_TS_cd;wire ROUTE_TS_ce;wire ROUTE_TS_cf;
wire ROUTE_TS_d0;wire ROUTE_TS_d1;wire ROUTE_TS_d2;wire ROUTE_TS_d3;wire ROUTE_TS_d4;wire ROUTE_TS_d5;wire ROUTE_TS_d6;wire ROUTE_TS_d7;wire ROUTE_TS_d8;wire ROUTE_TS_d9;wire ROUTE_TS_da;wire ROUTE_TS_db;wire ROUTE_TS_dc;wire ROUTE_TS_dd;wire ROUTE_TS_de;wire ROUTE_TS_df;
wire ROUTE_TS_e0;wire ROUTE_TS_e1;wire ROUTE_TS_e2;wire ROUTE_TS_e3;wire ROUTE_TS_e4;wire ROUTE_TS_e5;wire ROUTE_TS_e6;wire ROUTE_TS_e7;wire ROUTE_TS_e8;wire ROUTE_TS_e9;wire ROUTE_TS_ea;wire ROUTE_TS_eb;wire ROUTE_TS_ec;wire ROUTE_TS_ed;wire ROUTE_TS_ee;wire ROUTE_TS_ef;
wire ROUTE_TS_f0;wire ROUTE_TS_f1;wire ROUTE_TS_f2;wire ROUTE_TS_f3;wire ROUTE_TS_f4;wire ROUTE_TS_f5;wire ROUTE_TS_f6;wire ROUTE_TS_f7;wire ROUTE_TS_f8;wire ROUTE_TS_f9;wire ROUTE_TS_fa;wire ROUTE_TS_fb;wire ROUTE_TS_fc;wire ROUTE_TS_fd;wire ROUTE_TS_fe;wire ROUTE_TS_ff;
TimeStampGen TimeStampGen_inst(
.TS_00(ROUTE_TS_00),.TS_01(ROUTE_TS_01),.TS_02(ROUTE_TS_02),.TS_03(ROUTE_TS_03),.TS_04(ROUTE_TS_04),.TS_05(ROUTE_TS_05),.TS_06(ROUTE_TS_06),.TS_07(ROUTE_TS_07),.TS_08(ROUTE_TS_08),.TS_09(ROUTE_TS_09),.TS_0a(ROUTE_TS_0a),.TS_0b(ROUTE_TS_0b),.TS_0c(ROUTE_TS_0c),.TS_0d(ROUTE_TS_0d),.TS_0e(ROUTE_TS_0e),.TS_0f(ROUTE_TS_0f),
.TS_10(ROUTE_TS_10),.TS_11(ROUTE_TS_11),.TS_12(ROUTE_TS_12),.TS_13(ROUTE_TS_13),.TS_14(ROUTE_TS_14),.TS_15(ROUTE_TS_15),.TS_16(ROUTE_TS_16),.TS_17(ROUTE_TS_17),.TS_18(ROUTE_TS_18),.TS_19(ROUTE_TS_19),.TS_1a(ROUTE_TS_1a),.TS_1b(ROUTE_TS_1b),.TS_1c(ROUTE_TS_1c),.TS_1d(ROUTE_TS_1d),.TS_1e(ROUTE_TS_1e),.TS_1f(ROUTE_TS_1f),
.TS_20(ROUTE_TS_20),.TS_21(ROUTE_TS_21),.TS_22(ROUTE_TS_22),.TS_23(ROUTE_TS_23),.TS_24(ROUTE_TS_24),.TS_25(ROUTE_TS_25),.TS_26(ROUTE_TS_26),.TS_27(ROUTE_TS_27),.TS_28(ROUTE_TS_28),.TS_29(ROUTE_TS_29),.TS_2a(ROUTE_TS_2a),.TS_2b(ROUTE_TS_2b),.TS_2c(ROUTE_TS_2c),.TS_2d(ROUTE_TS_2d),.TS_2e(ROUTE_TS_2e),.TS_2f(ROUTE_TS_2f),
.TS_30(ROUTE_TS_30),.TS_31(ROUTE_TS_31),.TS_32(ROUTE_TS_32),.TS_33(ROUTE_TS_33),.TS_34(ROUTE_TS_34),.TS_35(ROUTE_TS_35),.TS_36(ROUTE_TS_36),.TS_37(ROUTE_TS_37),.TS_38(ROUTE_TS_38),.TS_39(ROUTE_TS_39),.TS_3a(ROUTE_TS_3a),.TS_3b(ROUTE_TS_3b),.TS_3c(ROUTE_TS_3c),.TS_3d(ROUTE_TS_3d),.TS_3e(ROUTE_TS_3e),.TS_3f(ROUTE_TS_3f),
.TS_40(ROUTE_TS_40),.TS_41(ROUTE_TS_41),.TS_42(ROUTE_TS_42),.TS_43(ROUTE_TS_43),.TS_44(ROUTE_TS_44),.TS_45(ROUTE_TS_45),.TS_46(ROUTE_TS_46),.TS_47(ROUTE_TS_47),.TS_48(ROUTE_TS_48),.TS_49(ROUTE_TS_49),.TS_4a(ROUTE_TS_4a),.TS_4b(ROUTE_TS_4b),.TS_4c(ROUTE_TS_4c),.TS_4d(ROUTE_TS_4d),.TS_4e(ROUTE_TS_4e),.TS_4f(ROUTE_TS_4f),
.TS_50(ROUTE_TS_50),.TS_51(ROUTE_TS_51),.TS_52(ROUTE_TS_52),.TS_53(ROUTE_TS_53),.TS_54(ROUTE_TS_54),.TS_55(ROUTE_TS_55),.TS_56(ROUTE_TS_56),.TS_57(ROUTE_TS_57),.TS_58(ROUTE_TS_58),.TS_59(ROUTE_TS_59),.TS_5a(ROUTE_TS_5a),.TS_5b(ROUTE_TS_5b),.TS_5c(ROUTE_TS_5c),.TS_5d(ROUTE_TS_5d),.TS_5e(ROUTE_TS_5e),.TS_5f(ROUTE_TS_5f),
.TS_60(ROUTE_TS_60),.TS_61(ROUTE_TS_61),.TS_62(ROUTE_TS_62),.TS_63(ROUTE_TS_63),.TS_64(ROUTE_TS_64),.TS_65(ROUTE_TS_65),.TS_66(ROUTE_TS_66),.TS_67(ROUTE_TS_67),.TS_68(ROUTE_TS_68),.TS_69(ROUTE_TS_69),.TS_6a(ROUTE_TS_6a),.TS_6b(ROUTE_TS_6b),.TS_6c(ROUTE_TS_6c),.TS_6d(ROUTE_TS_6d),.TS_6e(ROUTE_TS_6e),.TS_6f(ROUTE_TS_6f),
.TS_70(ROUTE_TS_70),.TS_71(ROUTE_TS_71),.TS_72(ROUTE_TS_72),.TS_73(ROUTE_TS_73),.TS_74(ROUTE_TS_74),.TS_75(ROUTE_TS_75),.TS_76(ROUTE_TS_76),.TS_77(ROUTE_TS_77),.TS_78(ROUTE_TS_78),.TS_79(ROUTE_TS_79),.TS_7a(ROUTE_TS_7a),.TS_7b(ROUTE_TS_7b),.TS_7c(ROUTE_TS_7c),.TS_7d(ROUTE_TS_7d),.TS_7e(ROUTE_TS_7e),.TS_7f(ROUTE_TS_7f),
.TS_80(ROUTE_TS_80),.TS_81(ROUTE_TS_81),.TS_82(ROUTE_TS_82),.TS_83(ROUTE_TS_83),.TS_84(ROUTE_TS_84),.TS_85(ROUTE_TS_85),.TS_86(ROUTE_TS_86),.TS_87(ROUTE_TS_87),.TS_88(ROUTE_TS_88),.TS_89(ROUTE_TS_89),.TS_8a(ROUTE_TS_8a),.TS_8b(ROUTE_TS_8b),.TS_8c(ROUTE_TS_8c),.TS_8d(ROUTE_TS_8d),.TS_8e(ROUTE_TS_8e),.TS_8f(ROUTE_TS_8f),
.TS_90(ROUTE_TS_90),.TS_91(ROUTE_TS_91),.TS_92(ROUTE_TS_92),.TS_93(ROUTE_TS_93),.TS_94(ROUTE_TS_94),.TS_95(ROUTE_TS_95),.TS_96(ROUTE_TS_96),.TS_97(ROUTE_TS_97),.TS_98(ROUTE_TS_98),.TS_99(ROUTE_TS_99),.TS_9a(ROUTE_TS_9a),.TS_9b(ROUTE_TS_9b),.TS_9c(ROUTE_TS_9c),.TS_9d(ROUTE_TS_9d),.TS_9e(ROUTE_TS_9e),.TS_9f(ROUTE_TS_9f),
.TS_a0(ROUTE_TS_a0),.TS_a1(ROUTE_TS_a1),.TS_a2(ROUTE_TS_a2),.TS_a3(ROUTE_TS_a3),.TS_a4(ROUTE_TS_a4),.TS_a5(ROUTE_TS_a5),.TS_a6(ROUTE_TS_a6),.TS_a7(ROUTE_TS_a7),.TS_a8(ROUTE_TS_a8),.TS_a9(ROUTE_TS_a9),.TS_aa(ROUTE_TS_aa),.TS_ab(ROUTE_TS_ab),.TS_ac(ROUTE_TS_ac),.TS_ad(ROUTE_TS_ad),.TS_ae(ROUTE_TS_ae),.TS_af(ROUTE_TS_af),
.TS_b0(ROUTE_TS_b0),.TS_b1(ROUTE_TS_b1),.TS_b2(ROUTE_TS_b2),.TS_b3(ROUTE_TS_b3),.TS_b4(ROUTE_TS_b4),.TS_b5(ROUTE_TS_b5),.TS_b6(ROUTE_TS_b6),.TS_b7(ROUTE_TS_b7),.TS_b8(ROUTE_TS_b8),.TS_b9(ROUTE_TS_b9),.TS_ba(ROUTE_TS_ba),.TS_bb(ROUTE_TS_bb),.TS_bc(ROUTE_TS_bc),.TS_bd(ROUTE_TS_bd),.TS_be(ROUTE_TS_be),.TS_bf(ROUTE_TS_bf),
.TS_c0(ROUTE_TS_c0),.TS_c1(ROUTE_TS_c1),.TS_c2(ROUTE_TS_c2),.TS_c3(ROUTE_TS_c3),.TS_c4(ROUTE_TS_c4),.TS_c5(ROUTE_TS_c5),.TS_c6(ROUTE_TS_c6),.TS_c7(ROUTE_TS_c7),.TS_c8(ROUTE_TS_c8),.TS_c9(ROUTE_TS_c9),.TS_ca(ROUTE_TS_ca),.TS_cb(ROUTE_TS_cb),.TS_cc(ROUTE_TS_cc),.TS_cd(ROUTE_TS_cd),.TS_ce(ROUTE_TS_ce),.TS_cf(ROUTE_TS_cf),
.TS_d0(ROUTE_TS_d0),.TS_d1(ROUTE_TS_d1),.TS_d2(ROUTE_TS_d2),.TS_d3(ROUTE_TS_d3),.TS_d4(ROUTE_TS_d4),.TS_d5(ROUTE_TS_d5),.TS_d6(ROUTE_TS_d6),.TS_d7(ROUTE_TS_d7),.TS_d8(ROUTE_TS_d8),.TS_d9(ROUTE_TS_d9),.TS_da(ROUTE_TS_da),.TS_db(ROUTE_TS_db),.TS_dc(ROUTE_TS_dc),.TS_dd(ROUTE_TS_dd),.TS_de(ROUTE_TS_de),.TS_df(ROUTE_TS_df),
.TS_e0(ROUTE_TS_e0),.TS_e1(ROUTE_TS_e1),.TS_e2(ROUTE_TS_e2),.TS_e3(ROUTE_TS_e3),.TS_e4(ROUTE_TS_e4),.TS_e5(ROUTE_TS_e5),.TS_e6(ROUTE_TS_e6),.TS_e7(ROUTE_TS_e7),.TS_e8(ROUTE_TS_e8),.TS_e9(ROUTE_TS_e9),.TS_ea(ROUTE_TS_ea),.TS_eb(ROUTE_TS_eb),.TS_ec(ROUTE_TS_ec),.TS_ed(ROUTE_TS_ed),.TS_ee(ROUTE_TS_ee),.TS_ef(ROUTE_TS_ef),
.TS_f0(ROUTE_TS_f0),.TS_f1(ROUTE_TS_f1),.TS_f2(ROUTE_TS_f2),.TS_f3(ROUTE_TS_f3),.TS_f4(ROUTE_TS_f4),.TS_f5(ROUTE_TS_f5),.TS_f6(ROUTE_TS_f6),.TS_f7(ROUTE_TS_f7),.TS_f8(ROUTE_TS_f8),.TS_f9(ROUTE_TS_f9),.TS_fa(ROUTE_TS_fa),.TS_fb(ROUTE_TS_fb),.TS_fc(ROUTE_TS_fc),.TS_fd(ROUTE_TS_fd),.TS_fe(ROUTE_TS_fe),.TS_ff(ROUTE_TS_ff),
.clk(clkFast)
);
wire clkFast;
 
 wire g_clk_ddr_w;
 wire clkSlow;
 
 wire g_clk_ddr_dqs_w;
wire g_clk_w;
ClockAndReset ClockAndReset_inst(
    .clk(clk)
    
    
    ,.clkFast(clkFast)
    
    ,.clkSDR(g_clk_ddr_w)
    ,.clkSlow(clkSlow)
    
    ,.clkSDR_90(g_clk_ddr_dqs_w)
    
    );
reg clkBram = 'd1;
always@(posedge clkFast)clkBram <= ~clkBram;
reg clkCalc = 'd1;
always@(posedge clkBram)clkCalc <= ~clkCalc;
assign g_clk_w = clkSlow;
reg[15:0]ROM_ADDR_FROM_GRID = 'd0;
reg OP_JMP_FLAG_FROM_GRID = 'd0;
    wire [7:0]romLLL;
    wire [7:0]romLLU;
    wire [7:0]romLUL;
    wire [7:0]romLUU;
    wire [7:0]romULL;
    wire [7:0]romULU;
    wire [7:0]romUUL;
    wire [7:0]romUUU;
BramLoader BramLoader_inst(
    .clkBram(clkBram),
    .ROUTE_TS_01(ROUTE_TS_01),
    .OP_JMP_FLAG_FROM_GRID(OP_JMP_FLAG_FROM_GRID),
    .ROM_ADDR_FROM_GRID(ROM_ADDR_FROM_GRID),
    .romLLL(romLLL),
    .romLLU(romLLU),
    .romLUL(romLUL),
    .romLUU(romLUU),
    .romULL(romULL),
    .romULU(romULU),
    .romUUL(romUUL),
    .romUUU(romUUU)
);
`ifdef DEF_ILA
reg [31:0]ila_probe0;
reg ila_probe1;
reg [31:0]ila_probe2;
reg ila_probe3;
reg [31:0]ila_probe4;
always@(*)ila_probe1 <= GRID_FWC_FIFO_DISPLAY_ONCE;
always@(*)ila_probe3 <= 1'b1;
ila_top ila_top_inst(
    .clk(clkSlow)
    ,.probe0(ila_probe0)
    ,.probe1(ila_probe1)
    ,.probe2(ila_probe2)
    ,.probe3(ila_probe3)
    ,.probe4(ila_probe4)
);
`endif
reg [5:0]SG_1BIT_MUX = 'd0;
always@(posedge clkBram) begin
    SG_1BIT_MUX <= SG_1BIT_MUX + 'd1;
end
reg [2:0]SG_8BIT_MUX = 'd0;
always@(*) begin
    if(SG_1BIT_MUX < 'd8)SG_8BIT_MUX <= 'd0;
    else if(SG_1BIT_MUX < 'd16)SG_8BIT_MUX <= 'd1;
    else if(SG_1BIT_MUX < 'd24)SG_8BIT_MUX <= 'd2;
    else if(SG_1BIT_MUX < 'd32)SG_8BIT_MUX <= 'd3;
    else if(SG_1BIT_MUX < 'd40)SG_8BIT_MUX <= 'd4;
    else if(SG_1BIT_MUX < 'd48)SG_8BIT_MUX <= 'd5;
    else if(SG_1BIT_MUX < 'd56)SG_8BIT_MUX <= 'd6;
    else SG_8BIT_MUX <= 'd7;
    
end
`ifdef  DEF_UART_TX0
reg GRID_UART_TX0_SET_ONCE = 'd0;
reg [7:0]GRID_UART_TX0_BYTE = 'd0;
always@(*) if(SG_1BIT_MUX == SG_1BIT_G0_UART_TX0) GRID_UART_TX0_SET_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_UART_TX0];
always@(*) if(SG_8BIT_MUX == 'd0)GRID_UART_TX0_BYTE <= getMatrix32[SG_8BIT_GROUP_SET_TX0][7:0];
CtrlUartTx CtrlUartTx0_inst(
    
    .ROUTE_TS_e1(ROUTE_TS_e1),
    
    .clkUart(clkSlow),
    .GRID_UART_TX0_SET_ONCE(GRID_UART_TX0_SET_ONCE),
    .GRID_UART_TX0_BYTE(GRID_UART_TX0_BYTE),
    .uart0_txd(uart0_txd)
    );
`endif
`ifdef  DEF_UART_TX1
reg GRID_UART_TX1_SET_ONCE = 'd0;
reg [7:0]GRID_UART_TX1_BYTE = 'd0;
always@(*) if(SG_1BIT_MUX == SG_1BIT_G0_UART_TX1)GRID_UART_TX1_SET_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_UART_TX1];
always@(*) if(SG_8BIT_MUX == 'd1)GRID_UART_TX1_BYTE <= getMatrix32[SG_8BIT_GROUP_SET_TX1][15:8];
CtrlUartTx CtrlUartTx1_inst(
    
    .ROUTE_TS_e1(ROUTE_TS_e3),
    
    .clkUart(clkSlow),
    .GRID_UART_TX0_SET_ONCE(GRID_UART_TX1_SET_ONCE),
    .GRID_UART_TX0_BYTE(GRID_UART_TX1_BYTE),
    .uart0_txd(uart1_txd)
    );
`endif
`ifdef  DEF_UART_TX2
reg GRID_UART_TX2_SET_ONCE = 'd0;
reg [7:0]GRID_UART_TX2_BYTE = 'd0;
always@(*) if(SG_1BIT_MUX == SG_1BIT_G0_UART_TX2)GRID_UART_TX2_SET_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_UART_TX2];
always@(*) if(SG_8BIT_MUX == 'd2)GRID_UART_TX2_BYTE <= getMatrix32[SG_8BIT_GROUP_SET_TX2][23:16];
CtrlUartTx CtrlUartTx2_inst(
    
    .ROUTE_TS_e1(ROUTE_TS_e5),
    
    .clkUart(clkSlow),
    .GRID_UART_TX0_SET_ONCE(GRID_UART_TX2_SET_ONCE),
    .GRID_UART_TX0_BYTE(GRID_UART_TX2_BYTE),
    .uart0_txd(uart2_txd)
    );
`endif
`ifdef  DEF_UART_TX3
reg GRID_UART_TX3_SET_ONCE = 'd0;
reg [7:0]GRID_UART_TX3_BYTE = 'd0;
always@(*) if(SG_1BIT_MUX == SG_1BIT_G0_UART_TX3)GRID_UART_TX3_SET_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_UART_TX3];
always@(*) if(SG_8BIT_MUX == 'd3)GRID_UART_TX3_BYTE <= getMatrix32[SG_8BIT_GROUP_SET_TX3][31:24];
CtrlUartTx CtrlUartTX3_inst(
    
    .ROUTE_TS_e1(ROUTE_TS_e7),
    
    .clkUart(clkSlow),
    .GRID_UART_TX0_SET_ONCE(GRID_UART_TX3_SET_ONCE),
    .GRID_UART_TX0_BYTE(GRID_UART_TX3_BYTE),
    .uart0_txd(uart3_txd)
    );
`endif
`ifdef DEF_UART_RX0
wire [7:0]GRID_UART_RX0_BYTE;
always@(*) if(SG_8BIT_MUX == 'd4)getMatrix32_PHY[PM_8BIT_GROUP_GET_RX0_PHY][7:0] <= GRID_UART_RX0_BYTE;
reg UART_TOP_RX0_REC_SET = 'd0;
wire UART_TOP_RX0_EMPTY;
always@(*) if(SG_1BIT_MUX == SG_1BIT_G0_UART_RX0_REC_SET) UART_TOP_RX0_REC_SET <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_UART_RX0_REC_SET];
always@(*) if(SG_1BIT_MUX == (PM_1BIT_G0_UART_RX0_EMPTY+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_UART_RX0_EMPTY] <= UART_TOP_RX0_EMPTY;
CtrlUartRx CtrlUartRx0_inst(
    
    .ROUTE_TS_e2(ROUTE_TS_e2),
    .clkUart(clkSlow),
    .UART_TOP_RX0_REC_SET(UART_TOP_RX0_REC_SET),
    .GRID_UART_RX0_BYTE(GRID_UART_RX0_BYTE),
    .UART_TOP_RX0_EMPTY(UART_TOP_RX0_EMPTY),
    .uart0_rxd(uart0_rxd)
    );
`endif
`ifdef DEF_UART_RX1
wire [7:0]GRID_UART_RX1_BYTE;
always@(*)if(SG_8BIT_MUX == 'd5) getMatrix32_PHY[PM_8BIT_GROUP_GET_RX1_PHY][15:8] <= GRID_UART_RX1_BYTE;
reg UART_TOP_RX1_REC_SET = 'd0;
wire UART_TOP_RX1_EMPTY;
always@(*) if(SG_1BIT_MUX == SG_1BIT_G0_UART_RX1_REC_SET)UART_TOP_RX1_REC_SET <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_UART_RX1_REC_SET];
always@(*) if(SG_1BIT_MUX == (PM_1BIT_G0_UART_RX1_EMPTY+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_UART_RX1_EMPTY] <= UART_TOP_RX1_EMPTY;
CtrlUartRx CtrlUartRx1_inst(
    
    .ROUTE_TS_e2(ROUTE_TS_e4),
    .clkUart(clkSlow),
    .UART_TOP_RX0_REC_SET(UART_TOP_RX1_REC_SET),
    .GRID_UART_RX0_BYTE(GRID_UART_RX1_BYTE),
    .UART_TOP_RX0_EMPTY(UART_TOP_RX1_EMPTY),
    .uart0_rxd(uart1_rxd)
    );
`endif
`ifdef DEF_UART_RX2
wire [7:0]GRID_UART_RX2_BYTE;
always@(*)if(SG_8BIT_MUX == 'd6) getMatrix32_PHY[PM_8BIT_GROUP_GET_RX2_PHY][23:16] <= GRID_UART_RX2_BYTE;
reg UART_TOP_RX2_REC_SET = 'd0;
wire UART_TOP_RX2_EMPTY;
always@(*) if(SG_1BIT_MUX == SG_1BIT_G0_UART_RX2_REC_SET)UART_TOP_RX2_REC_SET <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_UART_RX2_REC_SET];
always@(*) if(SG_1BIT_MUX == (PM_1BIT_G0_UART_RX2_EMPTY+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_UART_RX2_EMPTY] <= UART_TOP_RX2_EMPTY;
CtrlUartRx CtrlUartRX2_inst(
    
    .ROUTE_TS_e2(ROUTE_TS_e6),
    .clkUart(clkSlow),
    .UART_TOP_RX0_REC_SET(UART_TOP_RX2_REC_SET),
    .GRID_UART_RX0_BYTE(GRID_UART_RX2_BYTE),
    .UART_TOP_RX0_EMPTY(UART_TOP_RX2_EMPTY),
    .uart0_rxd(uart2_rxd)
    );
`endif
`ifdef DEF_UART_RX3
wire [7:0]GRID_UART_RX3_BYTE;
always@(*)if(SG_8BIT_MUX == 'd7) getMatrix32_PHY[PM_8BIT_GROUP_GET_RX3_PHY][31:24] <= GRID_UART_RX3_BYTE;
reg UART_TOP_RX3_REC_SET = 'd0;
wire UART_TOP_RX3_EMPTY;
always@(*) if(SG_1BIT_MUX == SG_1BIT_G0_UART_RX3_REC_SET)UART_TOP_RX3_REC_SET <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_UART_RX3_REC_SET];
always@(*) if(SG_1BIT_MUX == (PM_1BIT_G0_UART_RX3_EMPTY+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_UART_RX3_EMPTY] <= UART_TOP_RX3_EMPTY;
CtrlUartRx CtrlUartRX3_inst(
    
    .ROUTE_TS_e2(ROUTE_TS_e8),
    .clkUart(clkSlow),
    .UART_TOP_RX0_REC_SET(UART_TOP_RX3_REC_SET),
    .GRID_UART_RX0_BYTE(GRID_UART_RX3_BYTE),
    .UART_TOP_RX0_EMPTY(UART_TOP_RX3_EMPTY),
    .uart0_rxd(uart3_rxd)
    );
`endif
`ifdef  DEF_ARITH
reg [31:0]GRID_ARITH_0A = 'd0;
reg [31:0]GRID_ARITH_0B = 'd0;
reg [31:0]GRID_CALC_SELECT0 = 'd0;
wire [31:0]GRID_ARITH_0C;
always@(*)if(opIndex0 == SG_PARA0_A0)GRID_ARITH_0A <= getMatrix32[SG_PARA0_A0];
always@(*)if(opIndex0 == SG_PARA0_B0)GRID_ARITH_0B <= getMatrix32[SG_PARA0_B0];
always@(*)if(opIndex0 == SG_PARA0_S)GRID_CALC_SELECT0 <= getMatrix32[SG_PARA0_S];
always@(*) if(opIndex1 == PM_PARA0_C)getMatrix32_PHY[PM_PARA0_C] <= GRID_ARITH_0C;
Arithmetic Arithmetic_inst(
    .clkCalc(clkCalc),
    .ROUTE_TS_70(ROUTE_TS_50),
    .GRID_ARITH_0A(GRID_ARITH_0A),
    .GRID_ARITH_0B(GRID_ARITH_0B),
    .GRID_CALC_SELECT0(GRID_CALC_SELECT0),
    .GRID_ARITH_0C(GRID_ARITH_0C)
       
    );
`endif
`ifdef  DEF_GPIO
reg [31:0] GRID_GPIO_OUT = 'd0;
always@(*) if(opIndex0 == SG_GPIO_GROUP_SET)GRID_GPIO_OUT <= getMatrix32[SG_GPIO_GROUP_SET];
wire [31:0] GRID_GPIO_IN;
always@(*) if(opIndex1 == PM_GPIO_GROUP_GET)getMatrix32_PHY[PM_GPIO_GROUP_GET] <= GRID_GPIO_IN;
wire [31:0]g_gpios_w; 
wire [31:0]g_gpios_in_w;
assign g_gpios = g_gpios_w[23:0];
assign g_gpios_in_w = {20'b0,g_gpios_in};
gpio_ctrl gpio_ctrl_inst(
    .clk(clkSlow)    
    ,.ROUTE_TS_85(ROUTE_TS_65)
    ,.GRID_GPIO(GRID_GPIO_OUT)
    ,.GRID_GPIO_IN(GRID_GPIO_IN)
    
    ,.gpios(g_gpios_w)
    ,.gpios_in(g_gpios_in_w)
);
`endif
`ifdef  DEF_ADC
reg [6:0] GRID_ADC_ADDR = 'd0;
always@(*) if(opIndex0 == SG_ADC_ADDR)GRID_ADC_ADDR <= getMatrix32[SG_ADC_ADDR][6:0];
wire [15:0]GRID_ADC_DATA;
always@(*) if(opIndex1 == PM_ADC_DATA)getMatrix32_PHY[PM_ADC_DATA] <= {16'b0,GRID_ADC_DATA};
   
   
   
   
    
adc_ctrl adc_ctrl_inst(
     .clk(clkSlow)    
    ,.ROUTE_TS_86(ROUTE_TS_66)
    ,.GRID_ADC_ADDR(GRID_ADC_ADDR)    
    ,.GRID_ADC_DATA(GRID_ADC_DATA)
    ,.ck_an_p(g_ck_an_p)
    ,.ck_an_n(g_ck_an_n)
    ,.vp_in(g_vp_in)
    ,.vn_in(g_vn_in)
);
`endif
`ifdef  DEF_DAC
    reg [2:0]GRID_DAC_ADDR = 'd0; 
    reg [15:0]GRID_DAC_DATA = 'd0;
    reg GRID_DAC_ON_OFF = 'd0;
    
always@(*) if(opIndex0 == SG_DAC_ADDR)GRID_DAC_ADDR <= getMatrix32[SG_DAC_ADDR][2:0];
always@(*) if(opIndex0 == SG_DAC_DATA)GRID_DAC_DATA <= getMatrix32[SG_DAC_DATA][15:0];
always@(*) if(SG_1BIT_MUX == SG_1BIT_DAC_ON_OFF)GRID_DAC_ON_OFF <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_DAC_ON_OFF];
   
    dac_ctrl dac_ctrl_inst(
     .clk(clkSlow)
    ,.ROUTE_TS_87(ROUTE_TS_67)
    ,.GRID_DAC_ADDR(GRID_DAC_ADDR) 
    ,.GRID_DAC_DATA(GRID_DAC_DATA)
    ,.GRID_DAC_ON_OFF(GRID_DAC_ON_OFF)
    ,.dac_o(g_dac)
    );
`endif
`ifdef  DEF_SPI
reg SPI_RUN_ONCE_FROM_GRID = 'd0;
reg GRID_SPI_SET_GET = 'd0;
wire [7:0]GRID_SPI_DATA_GET; 
reg [7:0]GRID_SPI_DATA_SET = 'd0; 
reg [1:0]GRID_SPI_CS_SET = 'd0; 
wire GRID_SPI_IDLE;
always@(*) if(opIndex0 == SG_SPI_DATA_SET)GRID_SPI_DATA_SET <= getMatrix32[SG_SPI_DATA_SET][7:0];
always@(*) if(SG_1BIT_MUX == SG_1BIT_SPI_SET_GET)GRID_SPI_SET_GET <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_SPI_SET_GET];
always@(*) if(SG_1BIT_MUX == SG_1BIT_SPI_RUN_ONCE)SPI_RUN_ONCE_FROM_GRID <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_SPI_RUN_ONCE];
always@(*) if(opIndex1 == PM_SPI_DATA_GET)getMatrix32_PHY[PM_SPI_DATA_GET] <= {24'b0,GRID_SPI_DATA_GET};
always@(*) if(opIndex0 == SG_2BIT_GROUP_SET_SPI_OP)GRID_SPI_CS_SET <= getMatrix32[SG_2BIT_GROUP_SET_SPI_OP][1:0];
always@(*) if(SG_1BIT_MUX == (PM_1BIT_G0_SPI_IDLE+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_SPI_IDLE] <= GRID_SPI_IDLE;
 spi_ctrl spi_ctrl_inst
(
    .I_clk(clkSlow)
    ,.ROUTE_TS_88(ROUTE_TS_68)
    ,.SPI_RUN_ONCE_FROM_GRID(SPI_RUN_ONCE_FROM_GRID)
    ,.GRID_SPI_SET_GET(GRID_SPI_SET_GET)
    ,.GRID_SPI_DATA_SET(GRID_SPI_DATA_SET) 
    ,.GRID_SPI_DATA_GET(GRID_SPI_DATA_GET) 
    ,.GRID_SPI_IDLE(GRID_SPI_IDLE)
    ,.GRID_SPI_CS_SET(GRID_SPI_CS_SET)
    
    ,.I_spi_miso(g_spi_miso)
    ,.O_spi_sck(g_spi_sck)
    ,.O_spi_cs0(g_spi_cs0)
    ,.O_spi_cs1(g_spi_cs1)
    ,.O_spi_cs2(g_spi_cs2)
    ,.O_spi_mosi(g_spi_mosi)    
);
`endif
`ifdef  DEF_TWI
reg TWI_M_RUN_ONCE_FROM_GRID = 'd0;
reg GRID_TWI_M_SET_GET = 'd0;
reg GRID_TWI_M_START_TAG = 'd0;
reg GRID_TWI_M_END_TAG = 'd0;
reg GRID_TWI_M_CS = 'd0;
wire [7:0]GRID_TWI_M_DATA_GET;
reg [7:0]GRID_TWI_M_DATA_SET = 'd0;
wire GRID_TWI_M_IDLE;
always@(*) if(opIndex0 == SG_TWI_M_DATA_SET)GRID_TWI_M_DATA_SET <= getMatrix32[SG_TWI_M_DATA_SET][7:0];
always@(*) if(SG_1BIT_MUX == SG_1BIT_TWI_M_SET_GET)GRID_TWI_M_SET_GET <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_TWI_M_SET_GET];
always@(*) if(SG_1BIT_MUX == SG_1BIT_TWI_M_RUN_ONCE)TWI_M_RUN_ONCE_FROM_GRID <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_TWI_M_RUN_ONCE];
always@(*) if(opIndex1 == PM_TWI_M_DATA_GET)getMatrix32_PHY[PM_TWI_M_DATA_GET] <= {24'b0,GRID_TWI_M_DATA_GET};
always@(*) if(opIndex0 == SG_2BIT_GROUP_SET_TWI_M_CS){GRID_TWI_M_START_TAG,GRID_TWI_M_END_TAG, GRID_TWI_M_CS} <= getMatrix32[SG_2BIT_GROUP_SET_TWI_M_CS][2:0];
always@(*) if(SG_1BIT_MUX == (PM_1BIT_G0_TWI_M_IDLE+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_TWI_M_IDLE] <= GRID_TWI_M_IDLE;
twi_master_ctrl twi_master_ctrl_inst
(
    .clk(clkSlow)
    
    ,.ROUTE_TS_89(ROUTE_TS_69)
    
    ,.grid_twi_run_once(TWI_M_RUN_ONCE_FROM_GRID)
    ,.grid_twi_m_start_tag(GRID_TWI_M_START_TAG)
    ,.grid_twi_m_end_tag(GRID_TWI_M_END_TAG)
    ,.grid_twi_rw(GRID_TWI_M_SET_GET)
    ,.grid_twi_data_read(GRID_TWI_M_DATA_GET)
    ,.grid_twi_data_write(GRID_TWI_M_DATA_SET)
    ,.GRID_TWI_M_CS(GRID_TWI_M_CS)
    ,.GRID_TWI_M_IDLE(GRID_TWI_M_IDLE)
    ,.twi_scl0(g_twi_m_scl0)
    ,.twi_sda0(g_twi_m_sda0)
    ,.twi_scl1(g_twi_m_scl1)
    ,.twi_sda1(g_twi_m_sda1)
);
`endif
reg [3:0]opcode;
always@(*)opcode <=romUUU[7:4];
localparam GRID_SIZE = 64; 
localparam GRID_INDEX = 6; 
reg [GRID_INDEX-1:0]opIndex0;
always@(*)opIndex0 <=romULL[GRID_INDEX-1:0];
reg [GRID_INDEX-1:0]opIndex1;
always@(*)opIndex1 <=romLLL[GRID_INDEX-1:0];
reg [31:0]setMatrix32[0:GRID_SIZE-1];
reg [31:0]getMatrix32[0:GRID_SIZE-1];
reg [31:0]getMatrix32_PHY[0:GRID_SIZE-1];
genvar i;
generate
    for(i=0; i<GRID_SIZE; i=i+1) begin:BLOCK0
        initial setMatrix32[i] <= 0;
    end
endgenerate
generate
    for(i=0; i<GRID_SIZE; i=i+1) begin:BLOCK2
        initial getMatrix32_PHY[i] <= 0;
    end
endgenerate
reg req_sg_parse = 0;
reg ack_sg_parse = 0;
always@(*)begin
    if(req_sg_parse == 0 && ack_sg_parse == 0 && ROUTE_TS_30)begin
        req_sg_parse <= 1;
    end else if(req_sg_parse == 1 && ack_sg_parse == 1)begin
        req_sg_parse <= 0;
    end
end
always@(posedge clkBram)begin
    if(req_sg_parse == 1 && ack_sg_parse == 0)begin
        ack_sg_parse <= 1;
    end else if(req_sg_parse == 0 && ack_sg_parse == 1)begin
        ack_sg_parse <= 0;
    end
end
  
        always@(*)if(ack_sg_parse)getMatrix32[opIndex0] <= setMatrix32[opIndex0];               
   
reg req_runtime_eva = 0;
reg ack_runtime_eva = 0;
always@(*)begin
    if(req_runtime_eva == 0 && ack_runtime_eva == 0 && ROUTE_TS_20)begin
        req_runtime_eva <= 1;
    end else if(req_runtime_eva == 1 && ack_runtime_eva == 1)begin
        req_runtime_eva <= 0;
    end
end
always@(posedge clkBram)begin
    if(req_runtime_eva == 1 && ack_runtime_eva == 0)begin
        ack_runtime_eva <= 1;
    end else if(req_runtime_eva == 0 && ack_runtime_eva == 1)begin
        ack_runtime_eva <= 0;
    end
end
always@(*)begin
    if(ack_runtime_eva)begin   
        case(opcode)
            OP_SET: begin
                setMatrix32[opIndex0] <= {romLUU,romLUL,romLLU,romLLL};                
            end
            OP_CPY: begin 
                setMatrix32[opIndex0] <= getMatrix32[opIndex1];                 
            end
            OP_PHY: begin 
               setMatrix32[opIndex0] <= getMatrix32_PHY[opIndex1];      
            end  
            
            
            
            
            
            
            default:;
        endcase
     end
end
reg ROM_ADDR_COND = 'd0;
always@(*)if(opIndex0 == SG_ROM_ADDR)ROM_ADDR_FROM_GRID <= getMatrix32[SG_ROM_ADDR][15:0];
always@(*)if(opIndex0 == SG_ROM_ADDR_COND) ROM_ADDR_COND <= getMatrix32[SG_ROM_ADDR_COND][0];
always@(*) OP_JMP_FLAG_FROM_GRID <= (opcode == OP_JMP && ROM_ADDR_COND)?'d1:'d0;
`ifdef DEF_DDR3
reg [31:0] GRID_DDR_DATA_WRITE_5 = 'h0;
reg [31:0] GRID_DDR_DATA_WRITE_4 = 'h0;
reg [31:0] GRID_DDR_DATA_WRITE_3 = 'h0;
reg [31:0] GRID_DDR_DATA_WRITE_2 = 'h0;
reg [31:0] GRID_DDR_DATA_WRITE_1 = 'h0;
reg [31:0] GRID_DDR_DATA_WRITE_0 = 'h0;
wire [31:0] GRID_DDR_DATA_READ_5;
wire [31:0] GRID_DDR_DATA_READ_4;
wire [31:0] GRID_DDR_DATA_READ_3;
wire [31:0] GRID_DDR_DATA_READ_2;
wire [31:0] GRID_DDR_DATA_READ_1;
wire [31:0] GRID_DDR_DATA_READ_0;
always@(*)if(opIndex0 == SG_DDR_WRITE_0) GRID_DDR_DATA_WRITE_0 <= getMatrix32[SG_DDR_WRITE_0];
always@(*)if(opIndex0 == SG_DDR_WRITE_1) GRID_DDR_DATA_WRITE_1 <= getMatrix32[SG_DDR_WRITE_1];
always@(*)if(opIndex0 == SG_DDR_WRITE_2) GRID_DDR_DATA_WRITE_2 <= getMatrix32[SG_DDR_WRITE_2];
always@(*)if(opIndex0 == SG_DDR_WRITE_3) GRID_DDR_DATA_WRITE_3 <= getMatrix32[SG_DDR_WRITE_3];
always@(*)if(opIndex0 == SG_DDR_WRITE_4) GRID_DDR_DATA_WRITE_4 <= getMatrix32[SG_DDR_WRITE_4];
always@(*)if(opIndex0 == SG_DDR_WRITE_5) GRID_DDR_DATA_WRITE_5 <= getMatrix32[SG_DDR_WRITE_5];
always@(*)if(opIndex1 == PM_DDR_READ_0) getMatrix32_PHY[PM_DDR_READ_0] <= GRID_DDR_DATA_READ_0;
always@(*)if(opIndex1 == PM_DDR_READ_1) getMatrix32_PHY[PM_DDR_READ_1] <= GRID_DDR_DATA_READ_1;
always@(*)if(opIndex1 == PM_DDR_READ_2) getMatrix32_PHY[PM_DDR_READ_2] <= GRID_DDR_DATA_READ_2;
always@(*)if(opIndex1 == PM_DDR_READ_3) getMatrix32_PHY[PM_DDR_READ_3] <= GRID_DDR_DATA_READ_3;
always@(*)if(opIndex1 == PM_DDR_READ_4) getMatrix32_PHY[PM_DDR_READ_4] <= GRID_DDR_DATA_READ_4;
always@(*)if(opIndex1 == PM_DDR_READ_5) getMatrix32_PHY[PM_DDR_READ_5] <= GRID_DDR_DATA_READ_5;
localparam DDR3_DATA_BANK = 3'b0;
      reg [2:0]GRID_DDR_READ_WRITE = 'd4;
      
      
      
      reg [23:0]GRID_DDR_ADDR = 'd0;
always@(*)if(opIndex0 == SG_DDR_ADDR) GRID_DDR_ADDR <= getMatrix32[SG_DDR_ADDR][23:0];
 always@(*)if(SG_8BIT_MUX == 'd0)GRID_DDR_READ_WRITE <= getMatrix32[SG_8BIT_GROUP_SET_DDR_OP][2:0];
ddr3_ctrl ddr3_ctrl_inst(
     
   
     .ROUTE_TS_80(ROUTE_TS_60),
     
     .data_read_write(GRID_DDR_READ_WRITE),
   
     
     
     
       .data_addr(GRID_DDR_ADDR),  
    
     
     .data_write_5(GRID_DDR_DATA_WRITE_5),
     .data_write_4(GRID_DDR_DATA_WRITE_4),
     .data_write_3(GRID_DDR_DATA_WRITE_3),
     .data_write_2(GRID_DDR_DATA_WRITE_2),
     .data_write_1(GRID_DDR_DATA_WRITE_1),
     .data_write_0(GRID_DDR_DATA_WRITE_0),
     
     .data_read_5(GRID_DDR_DATA_READ_5),
     .data_read_4(GRID_DDR_DATA_READ_4),
     .data_read_3(GRID_DDR_DATA_READ_3),
     .data_read_2(GRID_DDR_DATA_READ_2),
     .data_read_1(GRID_DDR_DATA_READ_1),
     .data_read_0(GRID_DDR_DATA_READ_0),
     
        
    
    
    
    
    
    
    
    
        
        
    
    
    
    
    
    
    
    
     
     .clk_ddr_w(g_clk_ddr_w),     
     
     .clk_ddr_dqs_w(g_clk_ddr_dqs_w),
     
      
      
      
      
    
    .ddr3_reset_n(g_ddr3_reset_n),
    .ddr3_cke(g_ddr3_cke),
    .ddr3_ck_p(g_ddr3_ck_p), 
     .ddr3_ck_n(g_ddr3_ck_n),
     .ddr3_cs_n(g_ddr3_cs_n),
    .ddr3_ras_n(g_ddr3_ras_n), 
    .ddr3_cas_n(g_ddr3_cas_n), 
    .ddr3_we_n(g_ddr3_we_n),
    .ddr3_ba(g_ddr3_ba),
    .ddr3_addr(g_ddr3_addr),
    .ddr3_odt(g_ddr3_odt),
    .ddr3_dm(g_ddr3_dm),
    .ddr3_dqs_p(g_ddr3_dqs_p),
    .ddr3_dqs_n(g_ddr3_dqs_n),
    .ddr3_dq(g_ddr3_dq)  
    
     );
`endif
`ifdef DEF_NOR
always@(*)if(SG_1BIT_MUX == SG_1BIT_G0_NOR_QSPI_RO)GRID_NOR_QSPI_READ_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_NOR_QSPI_RO];
always@(*)if(SG_1BIT_MUX == SG_1BIT_G0_NOR_FIFO_RO)GRID_NOR_FIFO_READ_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_NOR_FIFO_RO];
always@(*)GRID_NOR_IN_ADDR <= getMatrix32[SG_NOR_ADDR];
always@(*)getMatrix32_PHY[PM_NOR_DATA] <= GRID_NOR_OUT_DATA; 
always@(*)if(SG_1BIT_MUX == (PM_1BIT_G0_FIFO_QSPI+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_FIFO_QSPI] <= GRID_NOR_FIFO_QSPI;
reg clkNor = 'd1;
always@(posedge clkCalc)clkNor <= ~clkNor; 
wire GRID_NOR_FIFO_QSPI;
wire [31:0]GRID_NOR_OUT_DATA;
reg [31:0]GRID_NOR_IN_ADDR = 'd0;
reg GRID_NOR_QSPI_READ_ONCE = 'd0;
reg GRID_NOR_FIFO_READ_ONCE = 'd0;
nor_ctrl nor_ctrl_inst(
     .C_O(clkNor)    
    ,.C(g_C)
    ,.HOLD_DQ3(g_dq3)
    ,.DQ0(g_dq0)
    ,.DQ1(g_dq1)
    ,.VPP_W_DQ2(g_dq2)
    ,.S(g_s)
    ,.ROUTE_TS_83(ROUTE_TS_61)
    ,.fifo_qspi(GRID_NOR_FIFO_QSPI)
    ,.grid_out_data(GRID_NOR_OUT_DATA)
    ,.grid_in_addr(GRID_NOR_IN_ADDR)
    ,.qspiReadSetOnce(GRID_NOR_QSPI_READ_ONCE)
    ,.fifoReadSetOnce(GRID_NOR_FIFO_READ_ONCE)
    
    
    
    );
`endif
`ifdef DEF_MMC
reg [1:0]GRID_MMC_ACT_RWI = 'd0;
reg GRID_MMC_FIFO_READ_ONCE = 'd0;
reg GRID_MMC_FIFO_WRITE_ONCE = 'd0;
reg [31:0]GRID_MMC_ADDR = 'd0;
wire [31:0]GRID_MMC_DATA_READ;
reg [31:0]GRID_MMC_DATA_WRITE = 'd0;
wire GRID_MMC_FIFOW_FULL;
wire GRID_MMC_FIFOW_EMPTY;
wire GRID_MMC_FIFOR_FULL;
wire GRID_MMC_FIFOR_EMPTY;
wire GRID_MMC_ACT_IDLE;
always@(*)if(SG_1BIT_MUX == SG_1BIT_G0_MMC_FIFO_RO)GRID_MMC_FIFO_READ_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_MMC_FIFO_RO];
always@(*)if(SG_1BIT_MUX == SG_1BIT_G0_MMC_FIFO_WO)GRID_MMC_FIFO_WRITE_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_MMC_FIFO_WO];
always@(*)if(opIndex0 == SG_MMC_ADDR)GRID_MMC_ADDR <= getMatrix32[SG_MMC_ADDR];
always@(*)if(opIndex1 == PM_MMC_DATA_READ)getMatrix32_PHY[PM_MMC_DATA_READ] <= GRID_MMC_DATA_READ; 
always@(*)if(opIndex0 == SG_MMC_DATA_WRITE)GRID_MMC_DATA_WRITE <= getMatrix32[SG_MMC_DATA_WRITE];
always@(*)if(SG_1BIT_MUX == (PM_1BIT_G0_MMC_FIFOW_FULL+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_MMC_FIFOW_FULL] <= GRID_MMC_FIFOW_FULL;
always@(*)if(SG_1BIT_MUX == (PM_1BIT_G0_MMC_FIFOW_EMPTY+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_MMC_FIFOW_EMPTY] <= GRID_MMC_FIFOW_EMPTY;
always@(*)if(SG_1BIT_MUX == (PM_1BIT_G0_MMC_FIFOR_FULL+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_MMC_FIFOR_FULL] <= GRID_MMC_FIFOR_FULL;
always@(*)if(SG_1BIT_MUX == (PM_1BIT_G0_MMC_FIFOR_EMPTY+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_MMC_FIFOR_EMPTY] <= GRID_MMC_FIFOR_EMPTY;
always@(*)if(SG_1BIT_MUX == (PM_1BIT_G0_MMC_ACT_IDLE+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_MMC_ACT_IDLE] <= GRID_MMC_ACT_IDLE;
always@(*)if(SG_8BIT_MUX == 'd0)GRID_MMC_ACT_RWI <= getMatrix32[SG_2BIT_GROUP_SET_MMC_OP][1:0];
mmc_ctrl mmc_ctrl_inst(
    
    .ROUTE_TS_84(ROUTE_TS_62)
    ,.grid_mmc_act_rwi(GRID_MMC_ACT_RWI) 
    ,.grid_mmc_addr(GRID_MMC_ADDR)
    ,.grid_mmc_data_read(GRID_MMC_DATA_READ)
    ,.grid_mmc_data_write(GRID_MMC_DATA_WRITE)
    ,.grid_mmc_fifo_read_once(GRID_MMC_FIFO_READ_ONCE)
    ,.grid_mmc_fifo_write_once(GRID_MMC_FIFO_WRITE_ONCE)
    ,.grid_mmc_fifow_full(GRID_MMC_FIFOW_FULL)
    ,.grid_mmc_fifow_empty(GRID_MMC_FIFOW_EMPTY)
    ,.grid_mmc_fifor_full(GRID_MMC_FIFOR_FULL)
    ,.grid_mmc_fifor_empty(GRID_MMC_FIFOR_EMPTY)
    ,.grid_mmc_act_idle(GRID_MMC_ACT_IDLE)
    ,.clk(g_clk_w)    
    ,.C(g_mmc_C)
    ,.MOSI(g_mmc_mosi)
    ,.MISO(g_mmc_miso)
    ,.S(g_mmc_s)
    
    );
`endif
`ifdef DEF_FMC
reg GRID_FWC_FIFO_DISPLAY_ONCE = 'd0;
reg GRID_FWC_FIFO_WRITE_ONCE = 'd0;
reg GRID_FWC_FIFO_READ_ONCE = 'd0;
reg [14:0]GRID_FWC_BRAM_ADDR = 'd0;
reg [31:0]GRID_FWC_DATA_WRITE = 'd0;
reg [31:0]GRID_FWC_START_POINT = 'd0;
reg [31:0]GRID_FWC_END_POINT = 'd0;
wire GRID_FWC_FIFO_EMPTY;
wire GRID_FWC_FIFO_FULL;
wire GRID_FWC_ACT_IDLE;
always@(*)if(SG_1BIT_MUX == SG_1BIT_G0_FMC_DO)GRID_FWC_FIFO_DISPLAY_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_FMC_DO];
always@(*)if(SG_1BIT_MUX == SG_1BIT_G0_FMC_WO)GRID_FWC_FIFO_WRITE_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_FMC_WO];
always@(*)if(SG_1BIT_MUX == SG_1BIT_G0_FMC_RO)GRID_FWC_FIFO_READ_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_FMC_RO];
always@(*)if(opIndex0 == SG_FMC_DATA_WRITE)GRID_FWC_DATA_WRITE <= getMatrix32[SG_FMC_DATA_WRITE];
always@(*)if(opIndex0 == SG_FMC_START_POINT)GRID_FWC_START_POINT <= getMatrix32[SG_FMC_START_POINT];
always@(*)if(opIndex0 == SG_FMC_END_POINT)GRID_FWC_END_POINT <= getMatrix32[SG_FMC_END_POINT];
always@(*)if(opIndex0 == SG_FMC_BRAM_ADDR)GRID_FWC_BRAM_ADDR <= getMatrix32[SG_FMC_BRAM_ADDR][14:0];
always@(*)if(SG_1BIT_MUX == (PM_1BIT_G0_FMC_FIFO_EMPTY+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_FMC_FIFO_EMPTY] <= GRID_FWC_FIFO_EMPTY;
always@(*)if(SG_1BIT_MUX == (PM_1BIT_G0_FMC_FIFO_FULL+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_FMC_FIFO_FULL] <= GRID_FWC_FIFO_FULL;
always@(*)if(SG_1BIT_MUX == (PM_1BIT_G0_FMC_ACT_IDLE+'d32))getMatrix32_PHY[PM_1BIT_GROUP_SET][PM_1BIT_G0_FMC_ACT_IDLE] <= GRID_FWC_ACT_IDLE;
fmc_ctrl fmc_ctrl_inst(
    .clk(clkSlow),
    .ROUTE_TS_86(ROUTE_TS_63),
    .grid_fwc_fifo_display_once(GRID_FWC_FIFO_DISPLAY_ONCE),
    .grid_fwc_fifo_write_once(GRID_FWC_FIFO_WRITE_ONCE),
    .grid_fwc_fifo_read_once(GRID_FWC_FIFO_READ_ONCE),
    .grid_fwc_data_write(GRID_FWC_DATA_WRITE),
    .grid_fwc_bram_addr(GRID_FWC_BRAM_ADDR),
    
    .grid_fwc_start_point(GRID_FWC_START_POINT),
    .grid_fwc_end_point(GRID_FWC_END_POINT),
    .grid_fwc_fifo_empty(GRID_FWC_FIFO_EMPTY),
    .grid_fwc_fifo_full(GRID_FWC_FIFO_FULL),
    .grid_fwc_act_idle(GRID_FWC_ACT_IDLE),
    .fmc_dq(g_fmc_dq),
    .fmc_cs(g_fmc_cs), 
    .fmc_rs(g_fmc_rs), 
    .fmc_rd(g_fmc_rd), 
    .fmc_wr(g_fmc_wr), 
    .fmc_rst(g_fmc_rst),
    .fmc_bl(g_fmc_bl)
    );
`endif
`ifdef DEF_TCH
reg GRID_TWI_RUN_ONCE = 'd0;
reg GRID_TWI_RW = 'd0;
reg [15:0]GRID_TWI_REGISTER = 'd0;
reg [31:0]GRID_TWI_DATA_WRITE = 'd0;
wire [31:0]GRID_TWI_DATA_READ;
always@(*)if(SG_1BIT_MUX == SG_1BIT_G0_TWI_RO)GRID_TWI_RUN_ONCE <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_TWI_RO];
always@(*)if(SG_1BIT_MUX == SG_1BIT_G0_TWI_RW)GRID_TWI_RW <= getMatrix32[SG_1BIT_GROUP_SET][SG_1BIT_G0_TWI_RW];
always@(*) if(opIndex0 == SG_TWI_REGISTER)GRID_TWI_REGISTER <= getMatrix32[SG_TWI_REGISTER][15:0];
always@(*) if(opIndex0 == SG_TWI_DATA_WRITE)GRID_TWI_DATA_WRITE <= getMatrix32[SG_TWI_DATA_WRITE];
always@(*) if(opIndex1 == PM_TWI_DATA_READ)getMatrix32_PHY[PM_TWI_DATA_READ] <= GRID_TWI_DATA_READ; 
twi_ctrl twi_ctrl_inst(
    .clk(clkSlow),
    .ROUTE_TS_87(ROUTE_TS_64),
    .grid_twi_run_once(GRID_TWI_RUN_ONCE),
    .grid_twi_rw(GRID_TWI_RW),
    
    .grid_twi_register(GRID_TWI_REGISTER),   
    .grid_twi_data_write(GRID_TWI_DATA_WRITE), 
    .grid_twi_data_read(GRID_TWI_DATA_READ),
    .twi_int(g_twi_int),
    .twi_rst(g_twi_rst),
    .twi_scl(g_twi_scl),
    .twi_sda(g_twi_sda)
    
    );
`endif
endmodule
module shift_reg#(parameter REG_DEPTH = 16)(
     input wire clk,
     input wire rst,
     input wire ena,
     input wire data_in,
     output wire data_out
     );
reg [REG_DEPTH-1:0] data_reg = {REG_DEPTH{1'b0}};
always@(posedge clk)begin
     if(rst)begin
          data_reg = {REG_DEPTH{1'b0}};
     end else if(ena)begin
          data_reg <= {data_reg[REG_DEPTH-2:0],data_in};
     end
end
assign data_out = data_reg[REG_DEPTH-1];
endmodule
module shift_reg_step#(parameter REG_DEPTH = 16)(
     input wire clk,
     input wire rst,
     input wire ena,
     input wire data_in,
     output wire data_out,
     output reg [REG_DEPTH-1:0] data_reg
     );
initial data_reg <= 'd0;
always@(posedge clk)begin
     if(rst)begin
          data_reg = {REG_DEPTH{1'b0}};
     end else if(ena)begin
          data_reg <= {data_reg[REG_DEPTH-2:0],data_in};
     end
end
assign data_out = data_reg[REG_DEPTH-1];
endmodule
module shift_reg_1#(parameter REG_DEPTH = 16)(
     input wire clk,
     input wire rst,
     input wire ena,
     input wire data_in,
     output wire data_out
     );
reg [REG_DEPTH-1:0] data_reg = {REG_DEPTH{1'b0}};
always@(posedge clk)begin
     if(rst)begin
          data_reg = {REG_DEPTH{1'b0}};
     end else if(ena)begin
          data_reg <= {data_reg[REG_DEPTH-1:0],data_in};
     end
end
assign data_out = data_reg[REG_DEPTH-1];
endmodule
