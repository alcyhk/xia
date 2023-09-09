`timescale 1ns / 1ps
module twi_master_ctrl(
    input wire clk,
    input wire ROUTE_TS_89,
    input wire grid_twi_run_once,
    input wire grid_twi_rw,
    input wire grid_twi_m_start_tag,
    input wire grid_twi_m_end_tag,
    input wire GRID_TWI_M_CS,
    
    input wire [7:0]grid_twi_data_write, 
    output reg [7:0]grid_twi_data_read = 'd0, 
    output reg GRID_TWI_M_IDLE,
    output wire twi_scl0,
    inout wire twi_sda0,
     output wire twi_scl1,
    inout wire twi_sda1
   
    );
assign twi_scl0 = GRID_TWI_M_CS?1'b1:twi_scl;
assign twi_sda0 = GRID_TWI_M_CS?1'b1:twi_sda;
assign twi_scl1 = GRID_TWI_M_CS?twi_scl:1'b1;
assign twi_sda1 = GRID_TWI_M_CS?twi_sda:1'b1;
 wire twi_scl;
 wire twi_sda;
reg req_twi_idle = 0;
reg ack_twi_idle = 0;
always@(*)begin
    if(req_twi_idle == 0 && ack_twi_idle == 0 && ROUTE_TS_89)begin
        req_twi_idle <= 1;
    end else if(req_twi_idle == 1 && ack_twi_idle == 1)begin
        req_twi_idle <= 0;
    end
end
always@(posedge clk)begin
    if(req_twi_idle == 1 && ack_twi_idle == 0)begin
        ack_twi_idle <= 1;
    end else if(req_twi_idle == 0 && ack_twi_idle == 1)begin
        ack_twi_idle <= 0;
    end
end
reg grid_twi_run_once_r = 'd0; 
reg grid_twi_rw_r = 'd0; 
reg grid_twi_m_start_tag_r = 'd0;
reg grid_twi_m_end_tag_r = 'd0;
reg flagTwiIdle = 'd0;
always@(*)begin
    if(ack_twi_idle && flagTwiIdle)begin
        grid_twi_run_once_r <= grid_twi_run_once;
        
        grid_twi_rw_r <= grid_twi_rw;
        
        grid_twi_m_end_tag_r <= grid_twi_m_end_tag;
        grid_twi_m_start_tag_r <= grid_twi_m_start_tag;
        
    end
end
reg [7:0]grid_twi_data_write_r = 'd0; 
reg [7:0]grid_twi_data_read_r = 'd0; 
always@(*)begin
    if(ack_twi_idle && flagTwiIdle)begin
        grid_twi_data_write_r <= grid_twi_data_write;        
        
    end 
end
reg flagReadReady = 'd1;
always@(*)begin
    if(ack_twi_idle && flagReadReady)begin     
        grid_twi_data_read <= grid_twi_data_read_r;        
    end 
end
reg flagTwiIdle_grid = 'd1;
always@(*)begin
    if(ack_twi_idle)begin     
        GRID_TWI_M_IDLE <= flagTwiIdle_grid;        
    end 
end
`define SELF_TWI 
        
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
reg reg_cs = 'd0;
reg mode_twi = 'd1;
reg twi_scl_r = 'd1;
reg mode_int = 'd1;
reg reg_sda = 'd1;
reg [7:0]twiVal = 'd0;
assign twi_sda = (mode_twi)?reg_sda:1'bz;
assign twi_scl = twi_scl_r;
localparam SPEED = 8'd100;
localparam TWI_STATE_IDLE = 'd0;
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
localparam TWI_STATE_END_0 = 'd33;
localparam TWI_STATE_END_1 = 'd34;
reg [7:0]twiValCurr = 'd0;
reg [7:0]currentData = 'd0;
reg clk2 = 'd1;
reg clk4 = 'd1;
always@(posedge clk)clk2 <= ~clk2;
always@(posedge clk2)clk4 <= ~clk4;
wire flagTwiSpeed;
 shift_reg #(50)flagTwiSpeed_0_inst0(clk4,flagTwiSpeed,1'b1,1'b1,flagTwiSpeed);
reg [7:0]state = 'd0;
reg flagRunOnce = 'd0;
always@(posedge flagTwiSpeed)begin
            
        if (state == TWI_STATE_IDLE )   begin
            reg_cs <= 1;
            
            twiValCurr <= grid_twi_data_write_r;
            currentData <= 'd0;
            
            
            if(grid_twi_run_once_r && ~flagRunOnce && grid_twi_m_start_tag_r)begin
                flagRunOnce <= 'd1;
                flagTwiIdle <= 'd0;
                flagTwiIdle_grid <= 'd0;
                state <= TWI_STATE_START_0;
            end else if(grid_twi_run_once_r && ~flagRunOnce && ~grid_twi_m_start_tag_r)begin
                flagRunOnce <= 'd1;
                flagTwiIdle <= 'd0;
                flagTwiIdle_grid <= 'd0;
                state <= TWI_STATE_BYTE_7_0;
            end else if(~grid_twi_run_once_r)begin
                flagRunOnce <= 'd0;
                flagTwiIdle <= 'd1;
                flagTwiIdle_grid <= 'd1;
            end
        end else if (state == TWI_STATE_START_0 )    begin
            reg_sda <= 0;
            twi_scl_r <= 1;
            
            state <= TWI_STATE_START_1;
            
        end else if (state == TWI_STATE_START_1 )    begin
            reg_sda <= 0;
            twi_scl_r <= 0;
            
            
            state <= TWI_STATE_BYTE_7_0;
            
        end else if (state == TWI_STATE_BYTE_7_0 )   begin
            if(~grid_twi_rw_r) mode_twi <= 0;
            else mode_twi <= 1;
            reg_sda <= twiValCurr[7];
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_7_1;
            
        end else if (state == TWI_STATE_BYTE_7_1 )   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_7_2;
            
        end else if (state == TWI_STATE_BYTE_7_2 )   begin
            
            twiVal[7] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_6_0;
            
        end else if (state == TWI_STATE_BYTE_6_0 )   begin
            reg_sda <= twiValCurr[6];
            
            state <= TWI_STATE_BYTE_6_1;
            
        end else if (state == TWI_STATE_BYTE_6_1 )   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_6_2;
            
        end else if (state == TWI_STATE_BYTE_6_2 )   begin
            
            twiVal[6] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_5_0;
            
        end else if (state == TWI_STATE_BYTE_5_0 )   begin
            reg_sda <= twiValCurr[5];
            
            state <= TWI_STATE_BYTE_5_1;
            
        end else if (state == TWI_STATE_BYTE_5_1 )   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_5_2;
            
        end else if (state == TWI_STATE_BYTE_5_2 )   begin
            
            twiVal[5] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_4_0;
            
        end else if (state == TWI_STATE_BYTE_4_0 )   begin
            reg_sda <= twiValCurr[4];
            
            state <= TWI_STATE_BYTE_4_1;
            
        end else if (state == TWI_STATE_BYTE_4_1 )   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_4_2;
            
        end else if (state == TWI_STATE_BYTE_4_2 )   begin
            
            twiVal[4] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_3_0;
            
        end else if (state == TWI_STATE_BYTE_3_0 )   begin
            reg_sda <= twiValCurr[3];
            
            state <= TWI_STATE_BYTE_3_1;
            
        end else if (state == TWI_STATE_BYTE_3_1 )   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_3_2;
            
        end else if (state == TWI_STATE_BYTE_3_2 )   begin
            
            twiVal[3] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_2_0;
            
        end else if (state == TWI_STATE_BYTE_2_0 )   begin
            reg_sda <= twiValCurr[2];
            
            state <= TWI_STATE_BYTE_2_1;
            
        end else if (state == TWI_STATE_BYTE_2_1 )   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_2_2;
            
        end else if (state == TWI_STATE_BYTE_2_2 )   begin
            
            twiVal[2] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_1_0;
            
        end else if (state == TWI_STATE_BYTE_1_0 )   begin
            reg_sda <= twiValCurr[1];
            
            state <= TWI_STATE_BYTE_1_1;
            
        end else if (state == TWI_STATE_BYTE_1_1 )   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_1_2;
            
        end else if (state == TWI_STATE_BYTE_1_2 )   begin
            
            twiVal[1] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_BYTE_0_0;
            
        end else if (state == TWI_STATE_BYTE_0_0 )   begin
            reg_sda <= twiValCurr[0];
            
            state <= TWI_STATE_BYTE_0_1;
            
        end else if (state == TWI_STATE_BYTE_0_1 )   begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_BYTE_0_2;
            
        end else if (state == TWI_STATE_BYTE_0_2 )   begin
            
            twiVal[0] <= twi_sda;
            twi_scl_r <= 0;
            state <= TWI_STATE_ACK_0;
            
        end else if (state == TWI_STATE_ACK_0 )  begin
            if( ~grid_twi_rw_r)begin 
            mode_twi <= 1;
            reg_sda <= 0;
            end else mode_twi <= 0;
            
            twi_scl_r <= 0;
            state <= TWI_STATE_ACK_1;
            
        end else if (state == TWI_STATE_ACK_1 )  begin
            
            twi_scl_r <= 1;
            state <= TWI_STATE_ACK_2;
            
        end else if (state == TWI_STATE_ACK_2 )  begin
            
            twi_scl_r <= 0;
            state <= TWI_STATE_HALT;
            flagReadReady <= 'd0;
           
            
        end else if (state == TWI_STATE_HALT )   begin
            
                grid_twi_data_read_r <= twiVal;
                reg_sda <= 1;
                mode_twi <= 1;
                
                if(grid_twi_m_end_tag_r)begin
                 state <= TWI_STATE_END_0;
                end else begin   
                 flagReadReady <= 'd1;
                 state <= TWI_STATE_IDLE;
                 flagTwiIdle <= 'd1;
                end
        
        end else if (state == TWI_STATE_END_0 )  begin
            
            
            twi_scl_r <= 1;
            flagReadReady <= 'd1;
            
            state <= TWI_STATE_END_1;
            
        end else if (state == TWI_STATE_END_1 )  begin
            
            
            
            
                state <= TWI_STATE_IDLE;
                flagTwiIdle <= 'd1;
        end
           
end
`endif
    
    
    
endmodule