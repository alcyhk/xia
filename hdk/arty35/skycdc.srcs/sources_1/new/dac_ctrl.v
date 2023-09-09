`timescale 1ns / 1ps
module dac_ctrl(
     input wire clk    
    ,input wire ROUTE_TS_87
    ,input wire [2:0]GRID_DAC_ADDR 
    ,input wire [15:0]GRID_DAC_DATA
    ,input wire GRID_DAC_ON_OFF
    ,output reg [7:0]dac_o
    );
     wire [7:0]dac_out;
always@(posedge clk)dac_o <= dac_out;
reg req_dac_load = 0;
reg ack_dac_load = 0;
always@(*)begin
    if(req_dac_load == 0 && ack_dac_load == 0 && ROUTE_TS_87)begin
        req_dac_load <= 1;
    end else if(req_dac_load == 1 && ack_dac_load == 1)begin
        req_dac_load <= 0;
    end
end
always@(posedge clk)begin
    if(req_dac_load == 1 && ack_dac_load == 0)begin
        ack_dac_load <= 1;
    end else if(req_dac_load == 0 && ack_dac_load == 1)begin
        ack_dac_load <= 0;
    end
end  
reg[2:0]dac_addr = 'd0;
reg[15:0]dac_data = 'd0;
reg dac_onOff = 'd0;
always @(*)begin
    if(ack_dac_load)begin
        dac_addr <= GRID_DAC_ADDR; 
        dac_data <= GRID_DAC_DATA;
        dac_onOff <= GRID_DAC_ON_OFF;
        
    end
end
always @(*)begin
    if(ack_dac_load)begin
        case ({dac_onOff,dac_addr})
            
            
            
            
            
            
            
            
            'h8:din_0 <= dac_data;
            'h9:din_1 <= dac_data;
            'ha:din_2 <= dac_data;
            'hb:din_3 <= dac_data;
            'hc:din_4 <= dac_data;
            'hd:din_5 <= dac_data;
            'he:din_6 <= dac_data;
            'hf:din_7 <= dac_data;
            
            
            
            
            
            
            
            
        default:;
        endcase
    end
end
reg [15:0]din_0 = 'h8000;
reg [15:0]din_1 = 'h8000;
reg [15:0]din_2 = 'h8000;
reg [15:0]din_3 = 'h8000;
reg [15:0]din_4 = 'h8000;
reg [15:0]din_5 = 'h8000;
reg [15:0]din_6 = 'h8000;
reg [15:0]din_7 = 'h8000;
dac dac_inst0(.clk(clk),.din(din_0),.dout(dac_out[0]));
dac dac_inst1(.clk(clk),.din(din_1),.dout(dac_out[1]));
dac dac_inst2(.clk(clk),.din(din_2),.dout(dac_out[2]));
dac dac_inst3(.clk(clk),.din(din_3),.dout(dac_out[3]));
dac dac_inst4(.clk(clk),.din(din_4),.dout(dac_out[4]));
dac dac_inst5(.clk(clk),.din(din_5),.dout(dac_out[5]));
dac dac_inst6(.clk(clk),.din(din_6),.dout(dac_out[6]));
dac dac_inst7(.clk(clk),.din(din_7),.dout(dac_out[7]));
endmodule
