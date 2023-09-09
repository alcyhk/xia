`timescale 1ns / 1ps
module twi_ctrl(
    input wire clk,
    
    input wire ROUTE_TS_87,
    input wire grid_twi_run_once,
    input wire grid_twi_rw,
    
    input wire [15:0]grid_twi_register,   
    input wire [31:0]grid_twi_data_write, 
    output reg [31:0]grid_twi_data_read = 'd0, 
    inout wire twi_int,
    output wire twi_scl,
    inout wire twi_sda,
    output wire twi_rst
   
    );
reg req_twi_idle = 0;
reg ack_twi_idle = 0;
always@(*)begin
    if(req_twi_idle == 0 && ack_twi_idle == 0 && ROUTE_TS_87)begin
        req_twi_idle <= 1;
    end else if(req_twi_idle == 1 && ack_twi_idle == 1)begin
        req_twi_idle <= 0;
    end
end
always@(posedge clkSlowQuarter)begin
    if(req_twi_idle == 1 && ack_twi_idle == 0)begin
        ack_twi_idle <= 1;
    end else if(req_twi_idle == 0 && ack_twi_idle == 1)begin
        ack_twi_idle <= 0;
    end
end
reg grid_twi_run_once_r = 'd0; 
reg grid_twi_rw_r = 'd0; 
reg flagTwiIdle = 'd0;
always@(*)begin
    if(ack_twi_idle && flagTwiIdle)begin
        grid_twi_run_once_r <= grid_twi_run_once;
        
        grid_twi_rw_r <= grid_twi_rw;
        
        
    end
end
reg [15:0]grid_twi_register_r = 'h814e;   
reg [31:0]grid_twi_data_write_r = 'd0; 
reg [31:0]grid_twi_data_read_r = 'd0; 
always@(*)begin
    if(ack_twi_idle && flagTwiIdle)begin
        grid_twi_register_r <= grid_twi_register;        
        grid_twi_data_write_r <= grid_twi_data_write;        
        
    end 
end
reg flagReadReady = 'd1;
always@(*)begin
    if(ack_twi_idle && flagReadReady)begin     
        grid_twi_data_read <= grid_twi_data_read_r;        
    end 
end
`define SELF_TWI 
`define SELF_ILA 
        
`ifdef SELF_ILA
reg probe0 = 'd0;
reg probe1 = 'd0;
reg [15:0]probe2 = 'd0;
reg [31:0]probe3 = 'd0;
reg [31:0]probe4 = 'd0;
always@(*)begin
    
    
    
    
    
    
    if(ack_twi_idle)begin
    probe0 <= ack_twi_idle;
    probe1 <= grid_twi_run_once_r;
    probe2 <= grid_twi_register_r;
    probe3 <= {24'b0,state};
    probe4 <= grid_twi_data_read_r;
    end
    
    
    
    
    
    
    
    
    
    
end
ila_twi ila_twi_inst(
    .clk(clk)
    ,.probe0(probe0)
    ,.probe1(probe1)
    ,.probe2(probe2)
    ,.probe3(probe3)
    ,.probe4(probe4)
    
    );
`endif
`ifdef SELF_TWI
reg [7:0]twiData[0:3];
reg reg_int = 'd1;
reg reg_cs = 'd0;
reg mode_twi = 'd1;
reg twi_scl_r = 'd1;
reg mode_int = 'd1;
reg reg_sda = 'd1;
reg [7:0]twiVal = 'd0;
assign twi_sda = (mode_twi)?reg_sda:1'bz;
assign twi_int = (mode_int)?reg_int:1'bz;
assign twi_scl = twi_scl_r;
assign twi_rst = reg_cs;
localparam TWI_VAL_W = 8'h28;
localparam TWI_VAL_REG_H = 8'h81; 
localparam TWI_VAL_REG_L = 8'h4e; 
localparam TWI_VAL_R = 8'h29;
localparam SPEED = 8'd100;
reg twiInit0Start = 'd0;
reg twiInit0Done = 'd0;
always@(*)begin
    if(state == TWI_STATE_INIT_0)twiInit0Start <= 'd1;
    else twiInit0Start <= 'd0;
end
always@(posedge flagTwiInit0_2)begin 
twiInit0Done <= 'd1;
end
reg clkSlowHalf = 'd1;
always@(posedge clk)begin 
    clkSlowHalf <= ~clkSlowHalf;
end
reg clkSlowQuarter = 'd1;
always@(posedge clkSlowHalf)begin 
    clkSlowQuarter <= ~clkSlowQuarter;
end
wire flagTwiInit0_0;
wire flagTwiInit0_1;
wire flagTwiInit0_2;
 shift_reg #(15)flagTwiInit0_inst0(clkSlowQuarter,flagTwiInit0_0,twiInit0Start,1'b1,flagTwiInit0_0);
 shift_reg #(10)flagTwiInit0_inst1(flagTwiInit0_0,flagTwiInit0_1,twiInit0Start,1'b1,flagTwiInit0_1);
 shift_reg #(4) flagTwiInit0_inst2(flagTwiInit0_1,flagTwiInit0_2,twiInit0Start,1'b1,flagTwiInit0_2);
reg twiInit1Start = 'd0;
reg twiInit1Done = 'd0;
always@(*)begin
    if(state == TWI_STATE_INIT_1)twiInit1Start <= 'd1;
    else twiInit1Start <= 'd0;
end
always@(posedge flagTwiInit1_2)begin 
twiInit1Done <= 'd1;
end
wire flagTwiInit1_0;
wire flagTwiInit1_1;
wire flagTwiInit1_2;
 shift_reg #(50)flagTwiInit1_inst0(clkSlowQuarter,flagTwiInit1_0,twiInit1Start,1'b1,flagTwiInit1_0);
 shift_reg #(30)flagTwiInit1_inst1(flagTwiInit1_0,flagTwiInit1_1,twiInit1Start,1'b1,flagTwiInit1_1);
 shift_reg #(10)flagTwiInit1_inst2(flagTwiInit1_1,flagTwiInit1_2,twiInit1Start,1'b1,flagTwiInit1_2);
reg twiInit2Start = 'd0;
reg twiInit2Done = 'd0;
always@(*)begin
    if(state == TWI_STATE_INIT_2)twiInit2Start <= 'd1;
    else twiInit2Start <= 'd0;
end
always@(posedge flagTwiInit2_3)begin 
twiInit2Done <= 'd1;
end
wire flagTwiInit2_0;
wire flagTwiInit2_1;
wire flagTwiInit2_2;
wire flagTwiInit2_3;
 shift_reg #(40)flagTwiInit2_inst0(clkSlowQuarter,flagTwiInit2_0,twiInit2Start,1'b1,flagTwiInit2_0);
 shift_reg #(30)flagTwiInit2_inst1(flagTwiInit2_0,flagTwiInit2_1,twiInit2Start,1'b1,flagTwiInit2_1);
 shift_reg #(25)flagTwiInit2_inst2(flagTwiInit2_1,flagTwiInit2_2,twiInit2Start,1'b1,flagTwiInit2_2);
 shift_reg #(10)flagTwiInit2_inst3(flagTwiInit2_2,flagTwiInit2_3,twiInit2Start,1'b1,flagTwiInit2_3);
reg twiSpeedStart = 'd0;
always@(*)begin
    if(state == TWI_STATE_IDLE)twiSpeedStart <= 'd1;
end
wire flagTwiSpeed;
 
 shift_reg #(10)flagTwiSpeed_0_inst0(clkSlowQuarter,flagTwiSpeed,twiSpeedStart,1'b1,flagTwiSpeed);
 
localparam TWI_STATE_INIT_0 = 'd0;
localparam TWI_STATE_INIT_1 = 'd1;
localparam TWI_STATE_INIT_2 = 'd2;
localparam TWI_STATE_START_0 = 'd3;
localparam TWI_STATE_START_1 = 'd4;
localparam TWI_STATE_BYTE_7_0 = 'd5;
localparam TWI_STATE_BYTE_7_1 = 'd6;
localparam TWI_STATE_BYTE_7_2 = 'd7;
localparam TWI_STATE_BYTE_6_0 = 'd8;
localparam TWI_STATE_BYTE_6_1 = 'd9;
localparam TWI_STATE_BYTE_6_2 = 'd10;
localparam TWI_STATE_BYTE_5_0 = 'd11;
localparam TWI_STATE_BYTE_5_1 = 'd12;
localparam TWI_STATE_BYTE_5_2 = 'd13;
localparam TWI_STATE_BYTE_4_0 = 'd14;
localparam TWI_STATE_BYTE_4_1 = 'd15;
localparam TWI_STATE_BYTE_4_2 = 'd16;
localparam TWI_STATE_BYTE_3_0 = 'd17;
localparam TWI_STATE_BYTE_3_1 = 'd18;
localparam TWI_STATE_BYTE_3_2 = 'd19;
localparam TWI_STATE_BYTE_2_0 = 'd20;
localparam TWI_STATE_BYTE_2_1 = 'd21;
localparam TWI_STATE_BYTE_2_2 = 'd22;
localparam TWI_STATE_BYTE_1_0 = 'd23;
localparam TWI_STATE_BYTE_1_1 = 'd24;
localparam TWI_STATE_BYTE_1_2 = 'd25;
localparam TWI_STATE_BYTE_0_0 = 'd26;
localparam TWI_STATE_BYTE_0_1 = 'd27;
localparam TWI_STATE_BYTE_0_2 = 'd28;
localparam TWI_STATE_ACK_0 = 'd29;
localparam TWI_STATE_ACK_1 = 'd30;
localparam TWI_STATE_ACK_2 = 'd31;
localparam TWI_STATE_HALT = 'd32;
localparam TWI_STATE_END_0 = 'd89;
localparam TWI_STATE_END_1 = 'd90;
localparam TWI_STATE_IDLE = 'd255;
reg [7:0]numOfData = 'd4;
reg [7:0]actualData = 'd8;
reg [7:0]currentData = 'd0;
localparam ACTUAL_DATA_ADDR = 'd0;
localparam ACTUAL_DATA_REGH = 'd1;
localparam ACTUAL_DATA_REGL = 'd2;
localparam ACTUAL_DATA_ADDR29 = 'd3;
localparam ACTUAL_DATA_DATA0 = 'd4;
localparam ACTUAL_DATA_DATA1 = 'd5;
localparam ACTUAL_DATA_DATA2 = 'd6;
localparam ACTUAL_DATA_DATA3 = 'd7;
reg [7:0]twiValCurr = 'd0;
reg [7:0]twiValAddr = 'd0;
reg [7:0]twiValRegH = 'd0;
reg [7:0]twiValRegL = 'd0;
    
    
    
    
reg [7:0]state = 'd0;
reg flagRunOnce = 'd0;
always@(posedge clkSlowQuarter)begin
            
    
        
        if (state == TWI_STATE_INIT_0 && twiInit0Done)  begin
            
            
            reg_cs <= 1;
    
            
            state <= TWI_STATE_INIT_1;
            
        
        end else if (state == TWI_STATE_INIT_1 && twiInit1Done) begin
            reg_int <= 0;
            reg_cs <= 1;
            state <= TWI_STATE_INIT_2;
            
        
        end else if (state == TWI_STATE_INIT_2 && twiInit2Done) begin
            
            
            mode_int <= 0;
            flagTwiIdle <= 'd1;
            state <= TWI_STATE_IDLE;
            
        end else if (state == TWI_STATE_IDLE && flagTwiSpeed)   begin
            twiValCurr <= TWI_VAL_W;
            currentData <= 'd0;
            
            if(grid_twi_run_once_r && ~flagRunOnce)begin
                flagRunOnce <= 'd1;
                flagTwiIdle <= 'd0;
                state <= TWI_STATE_START_0;
            end else if(~grid_twi_run_once_r)begin
                flagRunOnce <= 'd0;
                flagTwiIdle <= 'd1;
            end
        end else if (state == TWI_STATE_START_0 && flagTwiSpeed)    begin
            reg_sda <= 0;
            twi_scl_r <= 1;
            
            state <= TWI_STATE_START_1;
            
        end else if (state == TWI_STATE_START_1 && flagTwiSpeed)    begin
            reg_sda <= 0;
            twi_scl_r <= 0;
            
            
            state <= TWI_STATE_BYTE_7_0;
            
        end else if (state == TWI_STATE_BYTE_7_0 && flagTwiSpeed)   begin
            if(currentData >= 'd4 && ~grid_twi_rw_r) mode_twi <= 0;
            else mode_twi <= 1;
            reg_sda <= twiValCurr[7];
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_7_1;
            
        end else if (state == TWI_STATE_BYTE_7_1 && flagTwiSpeed)   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_7_2;
            
        end else if (state == TWI_STATE_BYTE_7_2 && flagTwiSpeed)   begin
            
            twiVal[7] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_6_0;
            
        end else if (state == TWI_STATE_BYTE_6_0 && flagTwiSpeed)   begin
            reg_sda <= twiValCurr[6];
            
            state <= TWI_STATE_BYTE_6_1;
            
        end else if (state == TWI_STATE_BYTE_6_1 && flagTwiSpeed)   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_6_2;
            
        end else if (state == TWI_STATE_BYTE_6_2 && flagTwiSpeed)   begin
            
            twiVal[6] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_5_0;
            
        end else if (state == TWI_STATE_BYTE_5_0 && flagTwiSpeed)   begin
            reg_sda <= twiValCurr[5];
            
            state <= TWI_STATE_BYTE_5_1;
            
        end else if (state == TWI_STATE_BYTE_5_1 && flagTwiSpeed)   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_5_2;
            
        end else if (state == TWI_STATE_BYTE_5_2 && flagTwiSpeed)   begin
            
            twiVal[5] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_4_0;
            
        end else if (state == TWI_STATE_BYTE_4_0 && flagTwiSpeed)   begin
            reg_sda <= twiValCurr[4];
            
            state <= TWI_STATE_BYTE_4_1;
            
        end else if (state == TWI_STATE_BYTE_4_1 && flagTwiSpeed)   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_4_2;
            
        end else if (state == TWI_STATE_BYTE_4_2 && flagTwiSpeed)   begin
            
            twiVal[4] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_3_0;
            
        end else if (state == TWI_STATE_BYTE_3_0 && flagTwiSpeed)   begin
            reg_sda <= twiValCurr[3];
            
            state <= TWI_STATE_BYTE_3_1;
            
        end else if (state == TWI_STATE_BYTE_3_1 && flagTwiSpeed)   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_3_2;
            
        end else if (state == TWI_STATE_BYTE_3_2 && flagTwiSpeed)   begin
            
            twiVal[3] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_2_0;
            
        end else if (state == TWI_STATE_BYTE_2_0 && flagTwiSpeed)   begin
            reg_sda <= twiValCurr[2];
            
            state <= TWI_STATE_BYTE_2_1;
            
        end else if (state == TWI_STATE_BYTE_2_1 && flagTwiSpeed)   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_2_2;
            
        end else if (state == TWI_STATE_BYTE_2_2 && flagTwiSpeed)   begin
            
            twiVal[2] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_1_0;
            
        end else if (state == TWI_STATE_BYTE_1_0 && flagTwiSpeed)   begin
            reg_sda <= twiValCurr[1];
            
            state <= TWI_STATE_BYTE_1_1;
            
        end else if (state == TWI_STATE_BYTE_1_1 && flagTwiSpeed)   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_1_2;
            
        end else if (state == TWI_STATE_BYTE_1_2 && flagTwiSpeed)   begin
            
            twiVal[1] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_0_0;
            
        end else if (state == TWI_STATE_BYTE_0_0 && flagTwiSpeed)   begin
            reg_sda <= twiValCurr[0];
            
            state <= TWI_STATE_BYTE_0_1;
            
        end else if (state == TWI_STATE_BYTE_0_1 && flagTwiSpeed)   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_0_2;
            
        end else if (state == TWI_STATE_BYTE_0_2 && flagTwiSpeed)   begin
            
            twiVal[0] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_ACK_0;
            
        end else if (state == TWI_STATE_ACK_0 && flagTwiSpeed)  begin
            if(currentData >= 'd4 && ~grid_twi_rw_r)begin 
            mode_twi <= 1;
            reg_sda <= 0;
            end else mode_twi <= 0;
            
            twi_scl_r <= 0;
            state <= TWI_STATE_ACK_1;
            
        end else if (state == TWI_STATE_ACK_1 && flagTwiSpeed)  begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_ACK_2;
            
        end else if (state == TWI_STATE_ACK_2 && flagTwiSpeed)  begin
            
            
            twi_scl_r <= 0;
            state <= TWI_STATE_HALT;
            flagReadReady <= 'd0;
           
            
        end else if (state == TWI_STATE_HALT && flagTwiSpeed)   begin
            
            
            
            if(currentData == 'd0)begin
                twi_scl_r <= 0;
                currentData <= currentData + 'd1;
                
                twiValCurr <= grid_twi_register_r[15:8];
                
                state <= TWI_STATE_BYTE_7_0;
            end else if(currentData == 'd1)begin
                twi_scl_r <= 0;
                
                currentData <= currentData + 'd1;
                
                twiValCurr <= grid_twi_register_r[7:0];
                state <= TWI_STATE_BYTE_7_0;
            end else if(currentData == 'd2 && grid_twi_rw_r)begin
                
                
                
                
                
                currentData <= 'd4;
                twi_scl_r <= 0;
                state <= TWI_STATE_BYTE_7_0;
                twiValCurr <= grid_twi_data_write_r[31:24];
            end else if(currentData == 'd2 && ~grid_twi_rw_r)begin
                currentData <= currentData + 'd1;
                twiValCurr <= TWI_VAL_R;
                reg_sda <= 1;
                mode_twi <= 1;
                state <= TWI_STATE_END_0;
             
            end else if(currentData == 'd3)begin
                currentData <= currentData + 'd1;
                twi_scl_r <= 0;
                state <= TWI_STATE_BYTE_7_0;
                
            
            
            
            
            
            
            
            
            end else if(currentData == 'd4)begin
                currentData <= currentData + 'd1;
                twiData[0] <= twiVal;
                grid_twi_data_read_r[31:24] <= twiVal;
                twiValCurr <= grid_twi_data_write_r[23:16]; 
                twi_scl_r <= 0;
                
                state <= TWI_STATE_BYTE_7_0;
            end else if(currentData == 'd5)begin
                currentData <= currentData + 'd1;
                twiData[1] <= twiVal;
                grid_twi_data_read_r[23:16] <= twiVal;
                twiValCurr <= grid_twi_data_write_r[15:8]; 
                twi_scl_r <= 0;
                
                state <= TWI_STATE_BYTE_7_0;
            end else if(currentData == 'd6)begin
                currentData <= currentData + 'd1;
                twiData[2] <= twiVal;
                grid_twi_data_read_r[15:8] <= twiVal;
                twiValCurr <= grid_twi_data_write_r[7:0]; 
                twi_scl_r <= 0;
                
                state <= TWI_STATE_BYTE_7_0;
            end else if(currentData == 'd7)begin
                twiData[3] <= twiVal;
                grid_twi_data_read_r[7:0] <= twiVal;
                reg_sda <= 1;
                mode_twi <= 1;
                state <= TWI_STATE_END_0;
            end
            
            
            
            
            
            
        
        end else if (state == TWI_STATE_END_0 && flagTwiSpeed)  begin
            
            
            twi_scl_r <= 1;
            flagReadReady <= 'd1;
            
            state <= TWI_STATE_END_1;
            
        end else if (state == TWI_STATE_END_1 && flagTwiSpeed)  begin
            
            
            
            
            if(currentData == 'd7)begin
                state <= TWI_STATE_IDLE;
                flagTwiIdle <= 'd1;
            end else state <= TWI_STATE_START_0;
            
            
        
        
        
            
        
        
        
        
        
            
            
            
        
        
        
        
        
            
        
        
        
        
            
        
        
        end
        
end
`endif
    
    
    
endmodule
