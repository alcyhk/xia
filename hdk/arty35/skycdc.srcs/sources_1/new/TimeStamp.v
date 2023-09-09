module TimeStampGen(
	
	input wire clk,
output reg TS_00,output reg TS_01,output reg TS_02,output reg TS_03,output reg TS_04,output reg TS_05,output reg TS_06,output reg TS_07,output reg TS_08,output reg TS_09,output reg TS_0a,output reg TS_0b,output reg TS_0c,output reg TS_0d,output reg TS_0e,output reg TS_0f,
output reg TS_10,output reg TS_11,output reg TS_12,output reg TS_13,output reg TS_14,output reg TS_15,output reg TS_16,output reg TS_17,output reg TS_18,output reg TS_19,output reg TS_1a,output reg TS_1b,output reg TS_1c,output reg TS_1d,output reg TS_1e,output reg TS_1f,
output reg TS_20,output reg TS_21,output reg TS_22,output reg TS_23,output reg TS_24,output reg TS_25,output reg TS_26,output reg TS_27,output reg TS_28,output reg TS_29,output reg TS_2a,output reg TS_2b,output reg TS_2c,output reg TS_2d,output reg TS_2e,output reg TS_2f,
output reg TS_30,output reg TS_31,output reg TS_32,output reg TS_33,output reg TS_34,output reg TS_35,output reg TS_36,output reg TS_37,output reg TS_38,output reg TS_39,output reg TS_3a,output reg TS_3b,output reg TS_3c,output reg TS_3d,output reg TS_3e,output reg TS_3f,
output reg TS_40,output reg TS_41,output reg TS_42,output reg TS_43,output reg TS_44,output reg TS_45,output reg TS_46,output reg TS_47,output reg TS_48,output reg TS_49,output reg TS_4a,output reg TS_4b,output reg TS_4c,output reg TS_4d,output reg TS_4e,output reg TS_4f,
output reg TS_50,output reg TS_51,output reg TS_52,output reg TS_53,output reg TS_54,output reg TS_55,output reg TS_56,output reg TS_57,output reg TS_58,output reg TS_59,output reg TS_5a,output reg TS_5b,output reg TS_5c,output reg TS_5d,output reg TS_5e,output reg TS_5f,
output reg TS_60,output reg TS_61,output reg TS_62,output reg TS_63,output reg TS_64,output reg TS_65,output reg TS_66,output reg TS_67,output reg TS_68,output reg TS_69,output reg TS_6a,output reg TS_6b,output reg TS_6c,output reg TS_6d,output reg TS_6e,output reg TS_6f,
output reg TS_70,output reg TS_71,output reg TS_72,output reg TS_73,output reg TS_74,output reg TS_75,output reg TS_76,output reg TS_77,output reg TS_78,output reg TS_79,output reg TS_7a,output reg TS_7b,output reg TS_7c,output reg TS_7d,output reg TS_7e,output reg TS_7f,
output reg TS_80,output reg TS_81,output reg TS_82,output reg TS_83,output reg TS_84,output reg TS_85,output reg TS_86,output reg TS_87,output reg TS_88,output reg TS_89,output reg TS_8a,output reg TS_8b,output reg TS_8c,output reg TS_8d,output reg TS_8e,output reg TS_8f,
output reg TS_90,output reg TS_91,output reg TS_92,output reg TS_93,output reg TS_94,output reg TS_95,output reg TS_96,output reg TS_97,output reg TS_98,output reg TS_99,output reg TS_9a,output reg TS_9b,output reg TS_9c,output reg TS_9d,output reg TS_9e,output reg TS_9f,
output reg TS_a0,output reg TS_a1,output reg TS_a2,output reg TS_a3,output reg TS_a4,output reg TS_a5,output reg TS_a6,output reg TS_a7,output reg TS_a8,output reg TS_a9,output reg TS_aa,output reg TS_ab,output reg TS_ac,output reg TS_ad,output reg TS_ae,output reg TS_af,
output reg TS_b0,output reg TS_b1,output reg TS_b2,output reg TS_b3,output reg TS_b4,output reg TS_b5,output reg TS_b6,output reg TS_b7,output reg TS_b8,output reg TS_b9,output reg TS_ba,output reg TS_bb,output reg TS_bc,output reg TS_bd,output reg TS_be,output reg TS_bf,
output reg TS_c0,output reg TS_c1,output reg TS_c2,output reg TS_c3,output reg TS_c4,output reg TS_c5,output reg TS_c6,output reg TS_c7,output reg TS_c8,output reg TS_c9,output reg TS_ca,output reg TS_cb,output reg TS_cc,output reg TS_cd,output reg TS_ce,output reg TS_cf,
output reg TS_d0,output reg TS_d1,output reg TS_d2,output reg TS_d3,output reg TS_d4,output reg TS_d5,output reg TS_d6,output reg TS_d7,output reg TS_d8,output reg TS_d9,output reg TS_da,output reg TS_db,output reg TS_dc,output reg TS_dd,output reg TS_de,output reg TS_df,
output reg TS_e0,output reg TS_e1,output reg TS_e2,output reg TS_e3,output reg TS_e4,output reg TS_e5,output reg TS_e6,output reg TS_e7,output reg TS_e8,output reg TS_e9,output reg TS_ea,output reg TS_eb,output reg TS_ec,output reg TS_ed,output reg TS_ee,output reg TS_ef,
output reg TS_f0,output reg TS_f1,output reg TS_f2,output reg TS_f3,output reg TS_f4,output reg TS_f5,output reg TS_f6,output reg TS_f7,output reg TS_f8,output reg TS_f9,output reg TS_fa,output reg TS_fb,output reg TS_fc,output reg TS_fd,output reg TS_fe,output reg TS_ff
	);
wire reset_self;
reg clkDDR0 = 'd1;
reg clkDDR1 = 'd1;
reg clkDDR2 = 'd1;
reg clkDDR3 = 'd1;
always@(posedge clk)clkDDR0 <= ~clkDDR0; 
always@(posedge clkDDR0)clkDDR1 <= ~clkDDR1; 
always@(posedge clkDDR1)clkDDR2 <= ~clkDDR2; 
always@(posedge clkDDR2)clkDDR3 <= ~clkDDR3; 
DDRCounterGen DDR_Gen_inst(
    .clk(clkDDR3),
    .DDR700us_Start(reset_self)
    );
reg [3:0]timeStamp0;
wire [3:0] timeStamp0Next;
reg [3:0]timeStamp1;
wire [3:0] timeStamp1Next;
 
assign timeStamp0Next = timeStamp0 + 1'd1; 
assign timeStamp1Next = timeStamp1 + 1'd1; 
reg [7:0]timeStampFQ; 
 
initial begin
	timeStamp0 <=0;
	timeStamp1 <=0;
end
always@(posedge clk)begin
if(reset_self)timeStamp0 <= timeStamp0Next;	
	
	 	
end
always@(posedge clk)begin
	if (timeStamp0 == 4'hf && reset_self)begin
		timeStamp1 <= timeStamp1Next;
	end	
	 	
end
always@(posedge clk)begin
 timeStampFQ <= {timeStamp1,timeStamp0};
end
always@(*)TS_00 <= (timeStampFQ == 8'h00)?1'b1:1'b0;
always@(*)TS_01 <= (timeStampFQ == 8'h01)?1'b1:1'b0;
always@(*)TS_02 <= (timeStampFQ == 8'h02)?1'b1:1'b0;
always@(*)TS_03 <= (timeStampFQ == 8'h03)?1'b1:1'b0;
always@(*)TS_04 <= (timeStampFQ == 8'h04)?1'b1:1'b0;
always@(*)TS_05 <= (timeStampFQ == 8'h05)?1'b1:1'b0;
always@(*)TS_06 <= (timeStampFQ == 8'h06)?1'b1:1'b0;
always@(*)TS_07 <= (timeStampFQ == 8'h07)?1'b1:1'b0;
always@(*)TS_08 <= (timeStampFQ == 8'h08)?1'b1:1'b0;
always@(*)TS_09 <= (timeStampFQ == 8'h09)?1'b1:1'b0;
always@(*)TS_0a <= (timeStampFQ == 8'h0a)?1'b1:1'b0;
always@(*)TS_0b <= (timeStampFQ == 8'h0b)?1'b1:1'b0;
always@(*)TS_0c <= (timeStampFQ == 8'h0c)?1'b1:1'b0;
always@(*)TS_0d <= (timeStampFQ == 8'h0d)?1'b1:1'b0;
always@(*)TS_0e <= (timeStampFQ == 8'h0e)?1'b1:1'b0;
always@(*)TS_0f <= (timeStampFQ == 8'h0f)?1'b1:1'b0;
always@(*)TS_10 <= (timeStampFQ == 8'h10)?1'b1:1'b0;
always@(*)TS_11 <= (timeStampFQ == 8'h11)?1'b1:1'b0;
always@(*)TS_12 <= (timeStampFQ == 8'h12)?1'b1:1'b0;
always@(*)TS_13 <= (timeStampFQ == 8'h13)?1'b1:1'b0;
always@(*)TS_14 <= (timeStampFQ == 8'h14)?1'b1:1'b0;
always@(*)TS_15 <= (timeStampFQ == 8'h15)?1'b1:1'b0;
always@(*)TS_16 <= (timeStampFQ == 8'h16)?1'b1:1'b0;
always@(*)TS_17 <= (timeStampFQ == 8'h17)?1'b1:1'b0;
always@(*)TS_18 <= (timeStampFQ == 8'h18)?1'b1:1'b0;
always@(*)TS_19 <= (timeStampFQ == 8'h19)?1'b1:1'b0;
always@(*)TS_1a <= (timeStampFQ == 8'h1a)?1'b1:1'b0;
always@(*)TS_1b <= (timeStampFQ == 8'h1b)?1'b1:1'b0;
always@(*)TS_1c <= (timeStampFQ == 8'h1c)?1'b1:1'b0;
always@(*)TS_1d <= (timeStampFQ == 8'h1d)?1'b1:1'b0;
always@(*)TS_1e <= (timeStampFQ == 8'h1e)?1'b1:1'b0;
always@(*)TS_1f <= (timeStampFQ == 8'h1f)?1'b1:1'b0;
always@(*)TS_20 <= (timeStampFQ == 8'h20)?1'b1:1'b0;
always@(*)TS_21 <= (timeStampFQ == 8'h21)?1'b1:1'b0;
always@(*)TS_22 <= (timeStampFQ == 8'h22)?1'b1:1'b0;
always@(*)TS_23 <= (timeStampFQ == 8'h23)?1'b1:1'b0;
always@(*)TS_24 <= (timeStampFQ == 8'h24)?1'b1:1'b0;
always@(*)TS_25 <= (timeStampFQ == 8'h25)?1'b1:1'b0;
always@(*)TS_26 <= (timeStampFQ == 8'h26)?1'b1:1'b0;
always@(*)TS_27 <= (timeStampFQ == 8'h27)?1'b1:1'b0;
always@(*)TS_28 <= (timeStampFQ == 8'h28)?1'b1:1'b0;
always@(*)TS_29 <= (timeStampFQ == 8'h29)?1'b1:1'b0;
always@(*)TS_2a <= (timeStampFQ == 8'h2a)?1'b1:1'b0;
always@(*)TS_2b <= (timeStampFQ == 8'h2b)?1'b1:1'b0;
always@(*)TS_2c <= (timeStampFQ == 8'h2c)?1'b1:1'b0;
always@(*)TS_2d <= (timeStampFQ == 8'h2d)?1'b1:1'b0;
always@(*)TS_2e <= (timeStampFQ == 8'h2e)?1'b1:1'b0;
always@(*)TS_2f <= (timeStampFQ == 8'h2f)?1'b1:1'b0;
always@(*)TS_30 <= (timeStampFQ == 8'h30)?1'b1:1'b0;
always@(*)TS_31 <= (timeStampFQ == 8'h31)?1'b1:1'b0;
always@(*)TS_32 <= (timeStampFQ == 8'h32)?1'b1:1'b0;
always@(*)TS_33 <= (timeStampFQ == 8'h33)?1'b1:1'b0;
always@(*)TS_34 <= (timeStampFQ == 8'h34)?1'b1:1'b0;
always@(*)TS_35 <= (timeStampFQ == 8'h35)?1'b1:1'b0;
always@(*)TS_36 <= (timeStampFQ == 8'h36)?1'b1:1'b0;
always@(*)TS_37 <= (timeStampFQ == 8'h37)?1'b1:1'b0;
always@(*)TS_38 <= (timeStampFQ == 8'h38)?1'b1:1'b0;
always@(*)TS_39 <= (timeStampFQ == 8'h39)?1'b1:1'b0;
always@(*)TS_3a <= (timeStampFQ == 8'h3a)?1'b1:1'b0;
always@(*)TS_3b <= (timeStampFQ == 8'h3b)?1'b1:1'b0;
always@(*)TS_3c <= (timeStampFQ == 8'h3c)?1'b1:1'b0;
always@(*)TS_3d <= (timeStampFQ == 8'h3d)?1'b1:1'b0;
always@(*)TS_3e <= (timeStampFQ == 8'h3e)?1'b1:1'b0;
always@(*)TS_3f <= (timeStampFQ == 8'h3f)?1'b1:1'b0;
always@(*)TS_40 <= (timeStampFQ == 8'h40)?1'b1:1'b0;
always@(*)TS_41 <= (timeStampFQ == 8'h41)?1'b1:1'b0;
always@(*)TS_42 <= (timeStampFQ == 8'h42)?1'b1:1'b0;
always@(*)TS_43 <= (timeStampFQ == 8'h43)?1'b1:1'b0;
always@(*)TS_44 <= (timeStampFQ == 8'h44)?1'b1:1'b0;
always@(*)TS_45 <= (timeStampFQ == 8'h45)?1'b1:1'b0;
always@(*)TS_46 <= (timeStampFQ == 8'h46)?1'b1:1'b0;
always@(*)TS_47 <= (timeStampFQ == 8'h47)?1'b1:1'b0;
always@(*)TS_48 <= (timeStampFQ == 8'h48)?1'b1:1'b0;
always@(*)TS_49 <= (timeStampFQ == 8'h49)?1'b1:1'b0;
always@(*)TS_4a <= (timeStampFQ == 8'h4a)?1'b1:1'b0;
always@(*)TS_4b <= (timeStampFQ == 8'h4b)?1'b1:1'b0;
always@(*)TS_4c <= (timeStampFQ == 8'h4c)?1'b1:1'b0;
always@(*)TS_4d <= (timeStampFQ == 8'h4d)?1'b1:1'b0;
always@(*)TS_4e <= (timeStampFQ == 8'h4e)?1'b1:1'b0;
always@(*)TS_4f <= (timeStampFQ == 8'h4f)?1'b1:1'b0;
always@(*)TS_50 <= (timeStampFQ == 8'h50)?1'b1:1'b0;
always@(*)TS_51 <= (timeStampFQ == 8'h51)?1'b1:1'b0;
always@(*)TS_52 <= (timeStampFQ == 8'h52)?1'b1:1'b0;
always@(*)TS_53 <= (timeStampFQ == 8'h53)?1'b1:1'b0;
always@(*)TS_54 <= (timeStampFQ == 8'h54)?1'b1:1'b0;
always@(*)TS_55 <= (timeStampFQ == 8'h55)?1'b1:1'b0;
always@(*)TS_56 <= (timeStampFQ == 8'h56)?1'b1:1'b0;
always@(*)TS_57 <= (timeStampFQ == 8'h57)?1'b1:1'b0;
always@(*)TS_58 <= (timeStampFQ == 8'h58)?1'b1:1'b0;
always@(*)TS_59 <= (timeStampFQ == 8'h59)?1'b1:1'b0;
always@(*)TS_5a <= (timeStampFQ == 8'h5a)?1'b1:1'b0;
always@(*)TS_5b <= (timeStampFQ == 8'h5b)?1'b1:1'b0;
always@(*)TS_5c <= (timeStampFQ == 8'h5c)?1'b1:1'b0;
always@(*)TS_5d <= (timeStampFQ == 8'h5d)?1'b1:1'b0;
always@(*)TS_5e <= (timeStampFQ == 8'h5e)?1'b1:1'b0;
always@(*)TS_5f <= (timeStampFQ == 8'h5f)?1'b1:1'b0;
always@(*)TS_60 <= (timeStampFQ == 8'h60)?1'b1:1'b0;
always@(*)TS_61 <= (timeStampFQ == 8'h61)?1'b1:1'b0;
always@(*)TS_62 <= (timeStampFQ == 8'h62)?1'b1:1'b0;
always@(*)TS_63 <= (timeStampFQ == 8'h63)?1'b1:1'b0;
always@(*)TS_64 <= (timeStampFQ == 8'h64)?1'b1:1'b0;
always@(*)TS_65 <= (timeStampFQ == 8'h65)?1'b1:1'b0;
always@(*)TS_66 <= (timeStampFQ == 8'h66)?1'b1:1'b0;
always@(*)TS_67 <= (timeStampFQ == 8'h67)?1'b1:1'b0;
always@(*)TS_68 <= (timeStampFQ == 8'h68)?1'b1:1'b0;
always@(*)TS_69 <= (timeStampFQ == 8'h69)?1'b1:1'b0;
always@(*)TS_6a <= (timeStampFQ == 8'h6a)?1'b1:1'b0;
always@(*)TS_6b <= (timeStampFQ == 8'h6b)?1'b1:1'b0;
always@(*)TS_6c <= (timeStampFQ == 8'h6c)?1'b1:1'b0;
always@(*)TS_6d <= (timeStampFQ == 8'h6d)?1'b1:1'b0;
always@(*)TS_6e <= (timeStampFQ == 8'h6e)?1'b1:1'b0;
always@(*)TS_6f <= (timeStampFQ == 8'h6f)?1'b1:1'b0;
always@(*)TS_70 <= (timeStampFQ == 8'h70)?1'b1:1'b0;
always@(*)TS_71 <= (timeStampFQ == 8'h71)?1'b1:1'b0;
always@(*)TS_72 <= (timeStampFQ == 8'h72)?1'b1:1'b0;
always@(*)TS_73 <= (timeStampFQ == 8'h73)?1'b1:1'b0;
always@(*)TS_74 <= (timeStampFQ == 8'h74)?1'b1:1'b0;
always@(*)TS_75 <= (timeStampFQ == 8'h75)?1'b1:1'b0;
always@(*)TS_76 <= (timeStampFQ == 8'h76)?1'b1:1'b0;
always@(*)TS_77 <= (timeStampFQ == 8'h77)?1'b1:1'b0;
always@(*)TS_78 <= (timeStampFQ == 8'h78)?1'b1:1'b0;
always@(*)TS_79 <= (timeStampFQ == 8'h79)?1'b1:1'b0;
always@(*)TS_7a <= (timeStampFQ == 8'h7a)?1'b1:1'b0;
always@(*)TS_7b <= (timeStampFQ == 8'h7b)?1'b1:1'b0;
always@(*)TS_7c <= (timeStampFQ == 8'h7c)?1'b1:1'b0;
always@(*)TS_7d <= (timeStampFQ == 8'h7d)?1'b1:1'b0;
always@(*)TS_7e <= (timeStampFQ == 8'h7e)?1'b1:1'b0;
always@(*)TS_7f <= (timeStampFQ == 8'h7f)?1'b1:1'b0;
always@(*)TS_80 <= (timeStampFQ == 8'h80)?1'b1:1'b0;
always@(*)TS_81 <= (timeStampFQ == 8'h81)?1'b1:1'b0;
always@(*)TS_82 <= (timeStampFQ == 8'h82)?1'b1:1'b0;
always@(*)TS_83 <= (timeStampFQ == 8'h83)?1'b1:1'b0;
always@(*)TS_84 <= (timeStampFQ == 8'h84)?1'b1:1'b0;
always@(*)TS_85 <= (timeStampFQ == 8'h85)?1'b1:1'b0;
always@(*)TS_86 <= (timeStampFQ == 8'h86)?1'b1:1'b0;
always@(*)TS_87 <= (timeStampFQ == 8'h87)?1'b1:1'b0;
always@(*)TS_88 <= (timeStampFQ == 8'h88)?1'b1:1'b0;
always@(*)TS_89 <= (timeStampFQ == 8'h89)?1'b1:1'b0;
always@(*)TS_8a <= (timeStampFQ == 8'h8a)?1'b1:1'b0;
always@(*)TS_8b <= (timeStampFQ == 8'h8b)?1'b1:1'b0;
always@(*)TS_8c <= (timeStampFQ == 8'h8c)?1'b1:1'b0;
always@(*)TS_8d <= (timeStampFQ == 8'h8d)?1'b1:1'b0;
always@(*)TS_8e <= (timeStampFQ == 8'h8e)?1'b1:1'b0;
always@(*)TS_8f <= (timeStampFQ == 8'h8f)?1'b1:1'b0;
always@(*)TS_90 <= (timeStampFQ == 8'h90)?1'b1:1'b0;
always@(*)TS_91 <= (timeStampFQ == 8'h91)?1'b1:1'b0;
always@(*)TS_92 <= (timeStampFQ == 8'h92)?1'b1:1'b0;
always@(*)TS_93 <= (timeStampFQ == 8'h93)?1'b1:1'b0;
always@(*)TS_94 <= (timeStampFQ == 8'h94)?1'b1:1'b0;
always@(*)TS_95 <= (timeStampFQ == 8'h95)?1'b1:1'b0;
always@(*)TS_96 <= (timeStampFQ == 8'h96)?1'b1:1'b0;
always@(*)TS_97 <= (timeStampFQ == 8'h97)?1'b1:1'b0;
always@(*)TS_98 <= (timeStampFQ == 8'h98)?1'b1:1'b0;
always@(*)TS_99 <= (timeStampFQ == 8'h99)?1'b1:1'b0;
always@(*)TS_9a <= (timeStampFQ == 8'h9a)?1'b1:1'b0;
always@(*)TS_9b <= (timeStampFQ == 8'h9b)?1'b1:1'b0;
always@(*)TS_9c <= (timeStampFQ == 8'h9c)?1'b1:1'b0;
always@(*)TS_9d <= (timeStampFQ == 8'h9d)?1'b1:1'b0;
always@(*)TS_9e <= (timeStampFQ == 8'h9e)?1'b1:1'b0;
always@(*)TS_9f <= (timeStampFQ == 8'h9f)?1'b1:1'b0;
always@(*)TS_a0 <= (timeStampFQ == 8'ha0)?1'b1:1'b0;
always@(*)TS_a1 <= (timeStampFQ == 8'ha1)?1'b1:1'b0;
always@(*)TS_a2 <= (timeStampFQ == 8'ha2)?1'b1:1'b0;
always@(*)TS_a3 <= (timeStampFQ == 8'ha3)?1'b1:1'b0;
always@(*)TS_a4 <= (timeStampFQ == 8'ha4)?1'b1:1'b0;
always@(*)TS_a5 <= (timeStampFQ == 8'ha5)?1'b1:1'b0;
always@(*)TS_a6 <= (timeStampFQ == 8'ha6)?1'b1:1'b0;
always@(*)TS_a7 <= (timeStampFQ == 8'ha7)?1'b1:1'b0;
always@(*)TS_a8 <= (timeStampFQ == 8'ha8)?1'b1:1'b0;
always@(*)TS_a9 <= (timeStampFQ == 8'ha9)?1'b1:1'b0;
always@(*)TS_aa <= (timeStampFQ == 8'haa)?1'b1:1'b0;
always@(*)TS_ab <= (timeStampFQ == 8'hab)?1'b1:1'b0;
always@(*)TS_ac <= (timeStampFQ == 8'hac)?1'b1:1'b0;
always@(*)TS_ad <= (timeStampFQ == 8'had)?1'b1:1'b0;
always@(*)TS_ae <= (timeStampFQ == 8'hae)?1'b1:1'b0;
always@(*)TS_af <= (timeStampFQ == 8'haf)?1'b1:1'b0;
always@(*)TS_b0 <= (timeStampFQ == 8'hb0)?1'b1:1'b0;
always@(*)TS_b1 <= (timeStampFQ == 8'hb1)?1'b1:1'b0;
always@(*)TS_b2 <= (timeStampFQ == 8'hb2)?1'b1:1'b0;
always@(*)TS_b3 <= (timeStampFQ == 8'hb3)?1'b1:1'b0;
always@(*)TS_b4 <= (timeStampFQ == 8'hb4)?1'b1:1'b0;
always@(*)TS_b5 <= (timeStampFQ == 8'hb5)?1'b1:1'b0;
always@(*)TS_b6 <= (timeStampFQ == 8'hb6)?1'b1:1'b0;
always@(*)TS_b7 <= (timeStampFQ == 8'hb7)?1'b1:1'b0;
always@(*)TS_b8 <= (timeStampFQ == 8'hb8)?1'b1:1'b0;
always@(*)TS_b9 <= (timeStampFQ == 8'hb9)?1'b1:1'b0;
always@(*)TS_ba <= (timeStampFQ == 8'hba)?1'b1:1'b0;
always@(*)TS_bb <= (timeStampFQ == 8'hbb)?1'b1:1'b0;
always@(*)TS_bc <= (timeStampFQ == 8'hbc)?1'b1:1'b0;
always@(*)TS_bd <= (timeStampFQ == 8'hbd)?1'b1:1'b0;
always@(*)TS_be <= (timeStampFQ == 8'hbe)?1'b1:1'b0;
always@(*)TS_bf <= (timeStampFQ == 8'hbf)?1'b1:1'b0;
always@(*)TS_c0 <= (timeStampFQ == 8'hc0)?1'b1:1'b0;
always@(*)TS_c1 <= (timeStampFQ == 8'hc1)?1'b1:1'b0;
always@(*)TS_c2 <= (timeStampFQ == 8'hc2)?1'b1:1'b0;
always@(*)TS_c3 <= (timeStampFQ == 8'hc3)?1'b1:1'b0;
always@(*)TS_c4 <= (timeStampFQ == 8'hc4)?1'b1:1'b0;
always@(*)TS_c5 <= (timeStampFQ == 8'hc5)?1'b1:1'b0;
always@(*)TS_c6 <= (timeStampFQ == 8'hc6)?1'b1:1'b0;
always@(*)TS_c7 <= (timeStampFQ == 8'hc7)?1'b1:1'b0;
always@(*)TS_c8 <= (timeStampFQ == 8'hc8)?1'b1:1'b0;
always@(*)TS_c9 <= (timeStampFQ == 8'hc9)?1'b1:1'b0;
always@(*)TS_ca <= (timeStampFQ == 8'hca)?1'b1:1'b0;
always@(*)TS_cb <= (timeStampFQ == 8'hcb)?1'b1:1'b0;
always@(*)TS_cc <= (timeStampFQ == 8'hcc)?1'b1:1'b0;
always@(*)TS_cd <= (timeStampFQ == 8'hcd)?1'b1:1'b0;
always@(*)TS_ce <= (timeStampFQ == 8'hce)?1'b1:1'b0;
always@(*)TS_cf <= (timeStampFQ == 8'hcf)?1'b1:1'b0;
always@(*)TS_d0 <= (timeStampFQ == 8'hd0)?1'b1:1'b0;
always@(*)TS_d1 <= (timeStampFQ == 8'hd1)?1'b1:1'b0;
always@(*)TS_d2 <= (timeStampFQ == 8'hd2)?1'b1:1'b0;
always@(*)TS_d3 <= (timeStampFQ == 8'hd3)?1'b1:1'b0;
always@(*)TS_d4 <= (timeStampFQ == 8'hd4)?1'b1:1'b0;
always@(*)TS_d5 <= (timeStampFQ == 8'hd5)?1'b1:1'b0;
always@(*)TS_d6 <= (timeStampFQ == 8'hd6)?1'b1:1'b0;
always@(*)TS_d7 <= (timeStampFQ == 8'hd7)?1'b1:1'b0;
always@(*)TS_d8 <= (timeStampFQ == 8'hd8)?1'b1:1'b0;
always@(*)TS_d9 <= (timeStampFQ == 8'hd9)?1'b1:1'b0;
always@(*)TS_da <= (timeStampFQ == 8'hda)?1'b1:1'b0;
always@(*)TS_db <= (timeStampFQ == 8'hdb)?1'b1:1'b0;
always@(*)TS_dc <= (timeStampFQ == 8'hdc)?1'b1:1'b0;
always@(*)TS_dd <= (timeStampFQ == 8'hdd)?1'b1:1'b0;
always@(*)TS_de <= (timeStampFQ == 8'hde)?1'b1:1'b0;
always@(*)TS_df <= (timeStampFQ == 8'hdf)?1'b1:1'b0;
always@(*)TS_e0 <= (timeStampFQ == 8'he0)?1'b1:1'b0;
always@(*)TS_e1 <= (timeStampFQ == 8'he1)?1'b1:1'b0;
always@(*)TS_e2 <= (timeStampFQ == 8'he2)?1'b1:1'b0;
always@(*)TS_e3 <= (timeStampFQ == 8'he3)?1'b1:1'b0;
always@(*)TS_e4 <= (timeStampFQ == 8'he4)?1'b1:1'b0;
always@(*)TS_e5 <= (timeStampFQ == 8'he5)?1'b1:1'b0;
always@(*)TS_e6 <= (timeStampFQ == 8'he6)?1'b1:1'b0;
always@(*)TS_e7 <= (timeStampFQ == 8'he7)?1'b1:1'b0;
always@(*)TS_e8 <= (timeStampFQ == 8'he8)?1'b1:1'b0;
always@(*)TS_e9 <= (timeStampFQ == 8'he9)?1'b1:1'b0;
always@(*)TS_ea <= (timeStampFQ == 8'hea)?1'b1:1'b0;
always@(*)TS_eb <= (timeStampFQ == 8'heb)?1'b1:1'b0;
always@(*)TS_ec <= (timeStampFQ == 8'hec)?1'b1:1'b0;
always@(*)TS_ed <= (timeStampFQ == 8'hed)?1'b1:1'b0;
always@(*)TS_ee <= (timeStampFQ == 8'hee)?1'b1:1'b0;
always@(*)TS_ef <= (timeStampFQ == 8'hef)?1'b1:1'b0;
always@(*)TS_f0 <= (timeStampFQ == 8'hf0)?1'b1:1'b0;
always@(*)TS_f1 <= (timeStampFQ == 8'hf1)?1'b1:1'b0;
always@(*)TS_f2 <= (timeStampFQ == 8'hf2)?1'b1:1'b0;
always@(*)TS_f3 <= (timeStampFQ == 8'hf3)?1'b1:1'b0;
always@(*)TS_f4 <= (timeStampFQ == 8'hf4)?1'b1:1'b0;
always@(*)TS_f5 <= (timeStampFQ == 8'hf5)?1'b1:1'b0;
always@(*)TS_f6 <= (timeStampFQ == 8'hf6)?1'b1:1'b0;
always@(*)TS_f7 <= (timeStampFQ == 8'hf7)?1'b1:1'b0;
always@(*)TS_f8 <= (timeStampFQ == 8'hf8)?1'b1:1'b0;
always@(*)TS_f9 <= (timeStampFQ == 8'hf9)?1'b1:1'b0;
always@(*)TS_fa <= (timeStampFQ == 8'hfa)?1'b1:1'b0;
always@(*)TS_fb <= (timeStampFQ == 8'hfb)?1'b1:1'b0;
always@(*)TS_fc <= (timeStampFQ == 8'hfc)?1'b1:1'b0;
always@(*)TS_fd <= (timeStampFQ == 8'hfd)?1'b1:1'b0;
always@(*)TS_fe <= (timeStampFQ == 8'hfe)?1'b1:1'b0;
always@(*)TS_ff <= (timeStampFQ == 8'hff)?1'b1:1'b0;
endmodule