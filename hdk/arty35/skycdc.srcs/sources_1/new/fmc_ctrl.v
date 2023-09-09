`timescale 1ns / 1ps
module fmc_ctrl(
    input clk,
    input wire ROUTE_TS_86,
	input wire grid_fwc_fifo_display_once,
	input wire grid_fwc_fifo_read_once,
	input wire grid_fwc_fifo_write_once,
	input wire [14:0]grid_fwc_bram_addr,
	input wire [31:0]grid_fwc_data_write,
	input wire [31:0]grid_fwc_start_point,
	input wire [31:0]grid_fwc_end_point,
	output reg grid_fwc_fifo_empty = 'd0,
	output reg grid_fwc_fifo_full = 'd0,
	output reg grid_fwc_act_idle = 'd1,
    inout wire [15:0] fmc_dq,
    output wire fmc_cs, 
    output wire fmc_rs, 
    output wire fmc_rd, 
    output wire fmc_wr, 
    output wire fmc_rst,
    output wire fmc_bl
    );
`define SELF_FMC 
`define SELF_MFIFO 
 	
	 
	 
	 
	 
	 
	 
	 
		
reg req_fwc_idle = 0;
reg ack_fwc_idle = 0;
always@(*)begin
    if(req_fwc_idle == 0 && ack_fwc_idle == 0 && ROUTE_TS_86)begin
        req_fwc_idle <= 1;
    end else if(req_fwc_idle == 1 && ack_fwc_idle == 1)begin
        req_fwc_idle <= 0;
    end
end
always@(posedge clk)begin
    if(req_fwc_idle == 1 && ack_fwc_idle == 0)begin
        ack_fwc_idle <= 1;
    end else if(req_fwc_idle == 0 && ack_fwc_idle == 1)begin
        ack_fwc_idle <= 0;
    end
end
reg grid_fwc_fifo_display_once_r = 'd0; 
reg grid_fwc_fifo_write_once_r = 'd0; 
reg grid_fwc_fifo_read_once_r = 'd0; 
reg [31:0]grid_fwc_data_write_r = 'd0;
reg fwc_act_idle = 'd1;
always@(*)begin
    if(ack_fwc_idle)begin
        grid_fwc_fifo_display_once_r <= grid_fwc_fifo_display_once;
        grid_fwc_fifo_write_once_r <= grid_fwc_fifo_write_once;
        grid_fwc_fifo_read_once_r <= grid_fwc_fifo_read_once;
        grid_fwc_fifo_empty <= mfifoEmpty;
        grid_fwc_fifo_full <= mfifoFull;
        grid_fwc_act_idle <= fwc_act_idle;
        
    end
end
reg [14:0]grid_fwc_bram_addr_r = 'd0;
always@(*)begin
    if(ack_fwc_idle)begin
    	grid_fwc_data_write_r <= grid_fwc_data_write;    
    	grid_fwc_bram_addr_r <= grid_fwc_bram_addr; 
        
        
        {fmc_xs_addr_r,fmc_ys_addr_r}<= grid_fwc_start_point;     
        {fmc_xe_addr_r,fmc_ye_addr_r}<= grid_fwc_end_point;     
    end 
end
reg [2:0]FMC_FIFO_WRITE_COUNT = 'd0;
always@(posedge clk)begin
    if(grid_fwc_fifo_write_once_r && FMC_FIFO_WRITE_COUNT < 'd4)begin 
        FMC_FIFO_WRITE_COUNT <= FMC_FIFO_WRITE_COUNT + 'd1;   
        
    end else if(~grid_fwc_fifo_write_once_r)begin
        FMC_FIFO_WRITE_COUNT <= 'd0;   
        
    end 
end
always@(posedge clk)begin
    case(FMC_FIFO_WRITE_COUNT)
    	0:begin
    		mfifoDataIn <= grid_fwc_data_write_r[31:16];
    		
    		mfifoWr <= 'd0 ;
    	end
        1: mfifoWr <= 'd1;
    	2:begin
    		mfifoDataIn <= grid_fwc_data_write_r[15:0];
    		
    		mfifoWr <= 'd0 ;
    	end
        3: mfifoWr <= 'd1;
        4: mfifoWr <= 'd0;
        default:    mfifoWr <= 'd0 ;
    endcase
end
reg [2:0]FMC_FIFO_READ_COUNT = 'd0;
always@(posedge clk)begin
    if(grid_fwc_fifo_read_once_r && FMC_FIFO_READ_COUNT < 'd5)begin 
        FMC_FIFO_READ_COUNT <= FMC_FIFO_READ_COUNT + 'd1;   
    end else if(~grid_fwc_fifo_read_once_r)begin
        FMC_FIFO_READ_COUNT <= 'd0; 
    end 
end
reg [14:0]bramAddrDisp = 'd0;
always@(posedge clk)begin
    if(grid_fwc_fifo_display_once_r && ~mfifoEmpty)begin
   		mfifoRd <= 'd1;
    end else if(FMC_FIFO_READ_COUNT == 'd0)begin
       	mfifoRd <= 'd0;
    end else if(FMC_FIFO_READ_COUNT == 'd1)begin
    	mfifoRd <= 'd1;
    end else if(FMC_FIFO_READ_COUNT == 'd2)begin
    	mfifoRd <= 'd0 ;
    end else if(FMC_FIFO_READ_COUNT == 'd3)begin
    	bramDataIn <= mfifoDataOut;
    end else if(FMC_FIFO_READ_COUNT == 'd4)begin
    	bramWe <= 'd1;
    end else if(FMC_FIFO_READ_COUNT == 'd5)begin
    	bramWe <= 'd0;
    end else begin
    	mfifoRd <= 'd0 ;
        bramWe <= 'd0;
    end
end
`ifndef SELF_FMC
reg [27:0] fmcCounter = 'd0;
reg fmcStart = 'd0;
always@(posedge clk)begin
	if(~fmcStart && fmcCounter < 20'hfffff)begin
		fmcCounter <= fmcCounter + 1'b1;
		
	end else if(~fmcStart && fmcCounter == 20'hfffff)begin
		fmcCounter <= 'd0;
		fmcStart <= 1'b1;
	end
end
`endif
`ifdef SELF_MFIFO
reg [15:0]mfifoDataIn = 'd0;
reg mfifoRd = 'd0;
reg mfifoWr = 'd0;
wire [15:0]mfifoDataOut;
wire mfifoFull;
wire mfifoEmpty;
mfifo multi_fifo_inst(
    .rst(~fmcStart),
    .clk(clk),
    .full(mfifoFull),
    .empty(mfifoEmpty),
    .din(mfifoDataIn),
    .dout(mfifoDataOut),
    .rd_en(mfifoRd),
    .wr_en(mfifoWr)
    );
wire [14:0]bramAddr;
assign bramAddr = bramAddrDisp;
reg [15:0]bramDataIn = 'd0;
wire [15:0]bramDataOut;
reg bramWe = 'd1;
fmc_bram fmc_bram_inst(
	.addra(bramAddr)
	,.clka(clk)
	,.dina(bramDataIn)
	,.douta(bramDataOut)
	,.wea(bramWe)
	);
`endif
`ifdef SELF_ILA
reg probe0 = 'd0;
reg probe1 = 'd0;
reg probe2 = 'd0;
reg probe3 = 'd0;
reg probe4 = 'd0;
reg [7:0]probe5 = 'd0;
reg [15:0]probe6 = 'd0;
always@(*)begin
	
	
	
	
	
	
	
probe0 <= grid_fwc_fifo_display_once_r;
probe1 <= grid_fwc_fifo_display_once;
probe2 <= ack_fwc_idle;
probe3 <= fwc_act_idle;
probe4 <= mfifoEmpty;
probe5 <= fmc_state;
	
end
ila_fmc ila_fmc_inst(
	.clk(clk)
	,.probe0(probe0)
	,.probe1(probe1)
	,.probe2(probe2)
	,.probe3(probe3)
	,.probe4(probe4)
	,.probe5(probe5)
	,.probe6(probe6)
	
	);
`endif
`ifdef SELF_FMC
    reg [15:0] fmc_dq_r = 'd0;
    reg fmc_dq_rw = 'd1;
    reg fmc_cs_r = 'd1; 
    reg fmc_rs_r = 'd1; 
    reg fmc_rd_r = 'd0; 
    reg fmc_wr_r = 'd1; 
    reg fmc_rst_r = 'd1;
    reg fmc_bl_r = 'd0;
assign fmc_dq = (fmc_dq_rw)?fmc_dq_r:16'bz;
assign fmc_cs = fmc_cs_r;
assign fmc_rs = fmc_rs_r;
assign fmc_rd = fmc_rd_r;
assign fmc_wr = fmc_wr_r;
assign fmc_rst = fmc_rst_r;
assign fmc_bl = fmc_bl_r;
reg [7:0]fmc_state = 'd0;
reg [1:0]fmc_stateCt = 'd0;
reg [23:0]fmc_pos = 'd0;	
reg [15:0]fmc_color = FMC_COLOR_PALE_RED;
localparam FMC_COLOR_PALE_BLUE = 'h7fff;
localparam FMC_COLOR_PALE_RED = 'h8000;
localparam FMC_COLOR_DARK = 'h0;
localparam FMC_STATE_INIT = 'd0;
localparam FMC_STATE_SLPOUT_WAIT = 'd1;
localparam FMC_STATE_DSPON = 'd2;
localparam FMC_STATE_INTERFACE = 'd3;
localparam FMC_STATE_SETXS_U = 'd4;
localparam FMC_STATE_SETXS_L = 'd5;
localparam FMC_STATE_SETXE_U = 'd6;
localparam FMC_STATE_SETXE_L = 'd7;
localparam FMC_STATE_SETYS_U = 'd8;
localparam FMC_STATE_SETYS_L = 'd9;
localparam FMC_STATE_SETYE_U = 'd10;
localparam FMC_STATE_SETYE_L = 'd11;
localparam FMC_STATE_WR_PX_0 = 'd12;
localparam FMC_STATE_WR_PX_1 = 'd13;
localparam FMC_STATE_IDLE = 'd14;
localparam FMC_STATE_START = 'd15;
localparam FMC_STATE_SLPOUT_WAIT_TIME = 'd832;
localparam FMC_CMD_SLPOUT  	   = 'h1100;
localparam FMC_CMD_DSPON   	   = 'h2900;
localparam FMC_CMD_INTERFACE   = 'h3a00;
localparam FMC_CMD_SETXS_U = 'h2a00;
localparam FMC_CMD_SETXS_L = 'h2a01;
localparam FMC_CMD_SETXE_U = 'h2a02;
localparam FMC_CMD_SETXE_L = 'h2a03;
localparam FMC_CMD_SETYS_U = 'h2b00;
localparam FMC_CMD_SETYS_L = 'h2b01;
localparam FMC_CMD_SETYE_U = 'h2b02;
localparam FMC_CMD_SETYE_L = 'h2b03;
localparam FMC_CMD_WR_PX   = 'h2c00;
localparam TMP_FMC_XS_ADDR = 'h0000;
localparam TMP_FMC_XE_ADDR = 'h01e0;
always@(posedge flagFmc_3)begin 
fmcStart <= 'd1;
end
wire flagFmc_0;
wire flagFmc_1;
wire flagFmc_2;
wire flagFmc_3;
 shift_reg #(32)flagFmc_inst0(clk,flagFmc_0,~fmcStart,1'b1,flagFmc_0);
 shift_reg #(32)flagFmc_inst1(flagFmc_0,flagFmc_1,~fmcStart,1'b1,flagFmc_1);
 shift_reg #(32)flagFmc_inst2(flagFmc_1,flagFmc_2,~fmcStart,1'b1,flagFmc_2);
 shift_reg #(31)flagFmc_inst3(flagFmc_2,flagFmc_3,~fmcStart,1'b1,flagFmc_3);
reg slpoutStart = 'd0;
reg fmcSlpoutDone = 'd0;
always@(*)begin
	if(fmc_state == FMC_STATE_SLPOUT_WAIT)slpoutStart <= 'd1;
	else slpoutStart <= 'd0;
end
always@(posedge flagFmcSlpout_1)begin 
fmcSlpoutDone <= 'd1;
end
wire flagFmcSlpout_0;
wire flagFmcSlpout_1;
 shift_reg #(30)flagFmcSlpout_0_inst0(clk,flagFmcSlpout_0,fmcSlpoutStart,1'b1,flagFmcSlpout_0);
 shift_reg #(29)flagFmcSlpout_1_inst1(flagFmcSlpout_0,flagFmcSlpout_1,fmcSlpoutStart,1'b1,flagFmcSlpout_1);
reg [19:0] fmcCounter = 'd0;
reg fmcStart = 'd0;
always@(posedge clk)begin
	
	
	
	
	
	
	
	
	
	
	
	
	
	if(fmc_state == FMC_STATE_WR_PX_1 && fmcCounter < fmc_setpx_area)begin
		if(fmc_stateCt == 'd3)begin
			fmcCounter <= fmcCounter + 'd1;
		end 
	end else if(fmc_state == FMC_STATE_WR_PX_1 && fmcCounter == fmc_setpx_area)begin
		if(fmc_stateCt == 'd3)begin
			fmcCounter <= 'd0;
					
		end
	
	
	
	
	
	end
end
reg [15:0]fmc_xs_addr_r = 'd0;
reg [15:0]fmc_xe_addr_r = 'd0;
reg [15:0]fmc_ys_addr_r = 'd0;
reg [15:0]fmc_ye_addr_r = 'd0;
reg [19:0]fmc_setpx_area = 'd0;
	
 
always@(*)fmc_setpx_area <= (fmc_xe_addr_r-fmc_xs_addr_r+'d1)*(fmc_ye_addr_r-fmc_ys_addr_r+'d1);
always@(posedge clk)begin
	if(fmcStart)fmc_stateCt <= fmc_stateCt + 'd1;
end
always@(posedge clk)begin
    
	
		if (fmc_state == FMC_STATE_INIT)	begin 
			if(fmc_stateCt == 'd0)begin
				
			end else if(fmc_stateCt == 'd1)begin
				
			end else if(fmc_stateCt == 'd2)begin
				fmc_bl_r <= 1;
				fmc_cs_r <= 0;
				fmc_rs_r <= 0;
				fmc_rd_r <= 1;
				fmc_wr_r <= 0;
				fmc_dq_r <=  FMC_CMD_SLPOUT;
			end else if(fmc_stateCt == 'd3)begin
				fmc_wr_r <= 1;
				
				fmc_state <= FMC_STATE_SLPOUT_WAIT;
			end
		
		end else if (fmc_state == FMC_STATE_SLPOUT_WAIT && slpoutStart)	begin  
			if(fmc_stateCt == 'd0)begin
			end else if(fmc_stateCt == 'd1)begin
			end else if(fmc_stateCt == 'd2)begin
			end else if(fmc_stateCt == 'd3)begin
				fmc_state <= FMC_STATE_DSPON;
			end
			
		
		end else if (fmc_state == FMC_STATE_DSPON)	begin  
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_dq_r <=  FMC_CMD_DSPON;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
			end else if(fmc_stateCt == 'd3)begin
				fmc_state <= FMC_STATE_INTERFACE;
			end
			
		
		end else if (fmc_state == FMC_STATE_INTERFACE)	begin 
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_rs_r <= 0;
				fmc_dq_r <=  FMC_CMD_INTERFACE;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
				fmc_wr_r <= 0;
				fmc_dq_r <=  16'h55;
				fmc_rs_r <= 1;
			end else if(fmc_stateCt == 'd3)begin
				fmc_wr_r <= 1;		
				fmc_state <= FMC_STATE_IDLE;
			end
		end else if (fmc_state == FMC_STATE_SETXS_U)	begin 
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_rs_r <= 0;
				fmc_dq_r <=  FMC_CMD_SETXS_U;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
				fmc_wr_r <= 0;
				fmc_dq_r <=  {8'b0,fmc_xs_addr_r[15:8]};
				fmc_rs_r <= 1;
			end else if(fmc_stateCt == 'd3)begin
				fmc_color <= ~fmc_color;
				fmc_wr_r <= 1;		
				fmc_state <= FMC_STATE_SETXS_L;
			end
		end else if (fmc_state == FMC_STATE_SETXS_L)	begin 
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_rs_r <= 0;
				fmc_dq_r <=  FMC_CMD_SETXS_L;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
				fmc_wr_r <= 0;
				fmc_dq_r <=  {8'b0,fmc_xs_addr_r[7:0]};
				fmc_rs_r <= 1;
			end else if(fmc_stateCt == 'd3)begin
				fmc_wr_r <= 1;		
				fmc_state <= FMC_STATE_SETXE_U;
			end
		end else if (fmc_state == FMC_STATE_SETXE_U)	begin 
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_rs_r <= 0;
				fmc_dq_r <=  FMC_CMD_SETXE_U;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
				fmc_wr_r <= 0;
				fmc_dq_r <=  {8'b0,fmc_xe_addr_r[15:8]};
				fmc_rs_r <= 1;
			end else if(fmc_stateCt == 'd3)begin
				fmc_wr_r <= 1;		
				fmc_state <= FMC_STATE_SETXE_L;
			end
		end else if (fmc_state == FMC_STATE_SETXE_L)	begin 
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_rs_r <= 0;
				fmc_dq_r <=  FMC_CMD_SETXE_L;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
				fmc_wr_r <= 0;
				fmc_dq_r <=  {8'b0,fmc_xe_addr_r[7:0]};
				fmc_rs_r <= 1;
			end else if(fmc_stateCt == 'd3)begin
				fmc_wr_r <= 1;		
				fmc_state <= FMC_STATE_SETYS_U;
			end
		end else if (fmc_state == FMC_STATE_SETYS_U)	begin 
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_rs_r <= 0;
				fmc_dq_r <=  FMC_CMD_SETYS_U;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
				fmc_wr_r <= 0;
				fmc_dq_r <=  {8'b0,fmc_ys_addr_r[15:8]};
				fmc_rs_r <= 1;
			end else if(fmc_stateCt == 'd3)begin
				fmc_wr_r <= 1;		
				fmc_state <= FMC_STATE_SETYS_L;
			end
		end else if (fmc_state == FMC_STATE_SETYS_L)	begin 
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_rs_r <= 0;
				fmc_dq_r <=  FMC_CMD_SETYS_L;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
				fmc_wr_r <= 0;
				fmc_dq_r <=  {8'b0,fmc_ys_addr_r[7:0]};
				fmc_rs_r <= 1;
			end else if(fmc_stateCt == 'd3)begin
				fmc_wr_r <= 1;		
				fmc_state <= FMC_STATE_SETYE_U;
			end
		end else if (fmc_state == FMC_STATE_SETYE_U)	begin 
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_rs_r <= 0;
				fmc_dq_r <=  FMC_CMD_SETYE_U;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
				fmc_wr_r <= 0;
				fmc_dq_r <=  {8'b0,fmc_ye_addr_r[15:8]};
				fmc_rs_r <= 1;
			end else if(fmc_stateCt == 'd3)begin
				fmc_wr_r <= 1;		
				fmc_state <= FMC_STATE_SETYE_L;
			end
		end else if (fmc_state == FMC_STATE_SETYE_L)	begin 
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_rs_r <= 0;
				fmc_dq_r <=  FMC_CMD_SETYE_L;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
				fmc_wr_r <= 0;
				fmc_dq_r <=  {8'b0,fmc_ye_addr_r[7:0]};
				fmc_rs_r <= 1;
			end else if(fmc_stateCt == 'd3)begin
				fmc_wr_r <= 1;		
				fmc_state <= FMC_STATE_WR_PX_0;
			end
			
		end else if (fmc_state == FMC_STATE_WR_PX_0)	begin  
			if(fmc_stateCt == 'd0)begin
				fmc_wr_r <= 0;
				fmc_rs_r <= 0;
				fmc_dq_r <=  FMC_CMD_WR_PX;
			end else if(fmc_stateCt == 'd1)begin
				fmc_wr_r <= 1;
			end else if(fmc_stateCt == 'd2)begin
			end else if(fmc_stateCt == 'd3)begin
				fmc_state <= FMC_STATE_WR_PX_1;
				
				
			end
		end else if (fmc_state == FMC_STATE_WR_PX_1)	begin 
			
			if(fmc_stateCt == 'd0)begin
				
				fmc_wr_r <= 0;
				fmc_rs_r <= 1;
				
			end else if(fmc_stateCt == 'd1)begin
			end else if(fmc_stateCt == 'd2)begin
				
				fmc_dq_r <= bramDataOut;
				
				fmc_wr_r <= 0;
			
			end else if(fmc_stateCt == 'd3 && fmcCounter == fmc_setpx_area)begin
				
			 	fmc_state <= FMC_STATE_IDLE;
				
			end else if(fmc_stateCt == 'd3 && fmcCounter < fmc_setpx_area)begin
				fmc_wr_r <= 1;		
				
				bramAddrDisp <= bramAddrDispNext;
			end
			
		end else if (fmc_state == FMC_STATE_IDLE)	begin 
			if(fmc_stateCt == 'd0)begin
				bramAddrDisp <= grid_fwc_bram_addr_r;
			end else if(fmc_stateCt == 'd1)begin
			end else if(fmc_stateCt == 'd2)begin
			end else if(fmc_stateCt == 'd3 && grid_fwc_fifo_display_once_r)begin
				
					
					fmc_state <= FMC_STATE_START;
			end else if(fmc_stateCt == 'd3 && ~grid_fwc_fifo_display_once_r)begin
					fwc_act_idle <= 'd1;
			
			
            
            
            
            
            
               
			end
		end else if (fmc_state == FMC_STATE_START)	begin 
				if(fmc_stateCt == 'd3 && fwc_act_idle)begin
					fmc_state <= FMC_STATE_SETXS_U;
					fwc_act_idle <= 'd0;
				end else if(fmc_stateCt == 'd3 && ~fwc_act_idle)begin
					fmc_state <= FMC_STATE_IDLE;
				end
		end 
	
end
reg [14:0]bramAddrDispNext = 'd0;
always@(posedge clk)begin
	if(bramAddrDisp != 'h7fff)
	bramAddrDispNext <= bramAddrDisp + 'd1;
	else
	bramAddrDispNext <= bramAddrDisp;
	
end
`endif
    
    
    
endmodule
