module DDRCounterGen(clk,DDR700us_Start );
input wire clk;
output reg DDR700us_Start;
initial DDR700us_Start <= 'd0;
wire itr700Clk0;
wire itr700Clk1;
wire itr700Clk2;
wire itr700Clk3;
wire itr700Clk4;
shift_reg #(32)shift_itr700Clk_inst0(clk,itr700Clk0,~DDR700us_Start,1'b1,itr700Clk0);
shift_reg #(32)shift_itr700Clk_inst1(itr700Clk0,itr700Clk1,~DDR700us_Start,1'b1,itr700Clk1);
shift_reg #(32)shift_itr700Clk_inst2(itr700Clk1,itr700Clk2,~DDR700us_Start,1'b1,itr700Clk2);
shift_reg #(32)shift_itr700Clk_inst3(itr700Clk2,itr700Clk3,~DDR700us_Start,1'b1,itr700Clk3);
shift_reg #(16)shift_itr700Clk_inst4(itr700Clk3,itr700Clk4,~DDR700us_Start,1'b1,itr700Clk4);
reg unlatch = 'd0;
always@(posedge itr700Clk4)begin 
DDR700us_Start <= 'd1;
end
endmodule