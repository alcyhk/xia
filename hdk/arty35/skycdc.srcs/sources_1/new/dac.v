`timescale 1ns / 1ps
module dac #(
	parameter dac_bw = 16
)(
	input	wire				clk,
	
	input	wire	[15 : 0]	din,
	output	wire				dout
);
	
	
	
	localparam bw_ext = 2;
	localparam bw_tot = dac_bw + bw_ext;
	
	reg						dout_r = 'd0;
	reg						dac_dout = 'd0;
	
	reg signed		[bw_tot-1 : 0]	DAC_acc_1st = 'd0;
	
	
	
	wire signed		[bw_tot-1 : 0]	max_val = (2**(dac_bw - 1) - 1);
	wire signed		[bw_tot-1 : 0]	min_val = -(2**(dac_bw - 1));
	wire signed		[bw_tot-1 : 0]	dac_val = (!dout_r) ? max_val : min_val;
	
	wire signed		[bw_tot-1 : 0]	in_ext = {{bw_ext{din[dac_bw - 1]}}, din};
	
	wire signed		[bw_tot-1 : 0]	delta_s0_c0 = in_ext + dac_val;
	wire signed		[bw_tot-1 : 0]	delta_s0_c1 = DAC_acc_1st + delta_s0_c0;
	always@(posedge clk)begin
		
		
		
			DAC_acc_1st <= delta_s0_c1;
		
	end
	
	always@(posedge clk)begin
		
		
		
		
			dout_r		<= delta_s0_c1[bw_tot-1];
			dac_dout	<= ~dout_r;
		
	end
	
	assign dout = dout_r;
	
	
endmodule