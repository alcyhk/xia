`timescale 1ns / 1ns
module ddr3_ctrl
(
     
    input  wire           ROUTE_TS_80,
    
input wire clk_ddr_w,
input wire clk_ddr_dqs_w,
input wire clk_probe,
    
    
        
      input wire [2:0]data_read_write,
       
       
       
      input wire [23:0]data_addr,
     input wire [31:0] data_write_5,
     input wire [31:0] data_write_4,
     input wire [31:0] data_write_3,
     input wire [31:0] data_write_2,
     input wire [31:0] data_write_1,
     input wire [31:0] data_write_0,
     
     output reg [31:0] data_read_5,
     output reg [31:0] data_read_4,
     output reg [31:0] data_read_3,
     output reg [31:0] data_read_2,
     output reg [31:0] data_read_1,
     output reg [31:0] data_read_0,
     
    
    output  wire            ddr3_reset_n,
    output  wire    [0:0]   ddr3_cke,
    output  wire    [0:0]   ddr3_ck_p, 
    output  wire    [0:0]   ddr3_ck_n,
    output  wire    [0:0]   ddr3_cs_n,
    output  wire            ddr3_ras_n, 
    output  wire            ddr3_cas_n, 
    output  wire            ddr3_we_n,
    output  wire    [2:0]   ddr3_ba,
    output  wire    [13:0]  ddr3_addr,
    output  wire    [0:0]   ddr3_odt,
    output  wire    [1:0]   ddr3_dm,
    inout   wire    [1:0]   ddr3_dqs_p,
    inout   wire    [1:0]   ddr3_dqs_n,
    inout   wire    [15:0]  ddr3_dq  
    
);
reg req_ddr3_idle = 0;
reg ack_ddr3_idle = 0;
reg clk_w_2 = 'd1;
reg clk_w = 'd1;
always@(posedge clk_ddr_w)begin
    clk_w_2 <= ~clk_w_2;
end
always@(posedge clk_w_2)begin
    clk_w <= ~clk_w;
end
always@(*)begin
    if(req_ddr3_idle == 0 && ack_ddr3_idle == 0 && ROUTE_TS_80)begin
        req_ddr3_idle <= 1;
    end else if(req_ddr3_idle == 1 && ack_ddr3_idle == 1)begin
        req_ddr3_idle <= 0;
    end
end
always@(posedge clk_ddr_w)begin
    if(req_ddr3_idle == 1 && ack_ddr3_idle == 0)begin
        ack_ddr3_idle <= 1;
    end else if(req_ddr3_idle == 0 && ack_ddr3_idle == 1)begin
        ack_ddr3_idle <= 0;
    end
end
reg idleProcStart = 'd0;
always@(*)begin
    if(ack_ddr3_idle)idleProcStart <= 'd1;
    else if(itrProcClk)idleProcStart <= 'd0;
end
wire itrProcClk;
shift_reg #(8)shift_itrProcClk_inst0(clk_w,itrProcClk,idleProcStart,1'b1,itrProcClk);
 
wire [1:0]ddr3_tdqs_n;
assign ddr3_ck_p = clk_ddr_w;
assign ddr3_ck_n = ~clk_ddr_w;
reg WR_RD_DQS = 'd0;
reg RD_WR_DQS = 'd0;
assign ddr3_dqs_p[0] = WR_RD_DQS?clk_ddr_dqs_w:1'bz;
assign ddr3_dqs_p[1] = WR_RD_DQS?clk_ddr_dqs_w:1'bz;
assign ddr3_dqs_n[0] = WR_RD_DQS?~clk_ddr_dqs_w:1'bz;
assign ddr3_dqs_n[1] = WR_RD_DQS?~clk_ddr_dqs_w:1'bz;
assign ddr3_reset_n = r_ddr3_reset_n;
assign ddr3_cke = r_ddr3_cke;
assign ddr3_cs_n = r_ddr3_cs_n;
assign ddr3_ras_n = r_ddr3_ras_n;
assign ddr3_cas_n = r_ddr3_cas_n;
assign ddr3_we_n = r_ddr3_we_n;
assign ddr3_ba = r_ddr3_ba;
assign ddr3_addr = r_ddr3_addr;
assign ddr3_odt = r_ddr3_odt;
assign ddr3_dm = r_ddr3_dm;
assign ddr3_dq = (WR_RD_DQS)?qo:16'bz;
assign di = ddr3_dq;
reg [31:0]data_write_0_buf = 'd0;
reg [31:0]data_write_1_buf = 'd0;
reg [31:0]data_write_2_buf = 'd0;
reg [31:0]data_write_3_buf = 'd0;
reg [31:0]data_write_4_buf = 'd0;
reg [31:0]data_write_5_buf = 'd0;
always @(*)begin
    if(ack_ddr3_idle && CTRL_STATE == CTRL_IDLE)begin
            data_write_0_buf <= data_write_0;
            data_write_1_buf <= data_write_1;
            data_write_2_buf <= data_write_2;
            data_write_3_buf <= data_write_3;
            data_write_4_buf <= data_write_4;
            data_write_5_buf <= data_write_5;
        
    end
end
  always @(posedge clk_ddr_dqs_w)begin 
     if(DDR_STATE == WRITING)begin
          if(DDR_COUNT_R == 'd6)begin
          
          
          {do1,do2} <= data_write_0_buf;
          end else if(DDR_COUNT_R == 'd7)begin
          
          
          {do1,do2} <= data_write_1_buf;
          end else if(DDR_COUNT_R == 'd0)begin 
          
          
          {do1,do2} <= data_write_2_buf;
          end else if(DDR_COUNT_R == 'd1)begin 
          
          
          {do1,do2} <= data_write_3_buf;
          end else if(DDR_COUNT_R == 'd2)begin 
          
          
          {do1,do2} <= data_write_4_buf;
          end else if(DDR_COUNT_R == 'd3)begin 
          
          
          {do1,do2} <= data_write_5_buf;
          end 
     end  
end  
reg [31:0]data_read_0_buf = 'd0;
reg [31:0]data_read_1_buf = 'd0;
reg [31:0]data_read_2_buf = 'd0;
reg [31:0]data_read_3_buf = 'd0;
reg [31:0]data_read_4_buf = 'd0;
reg [31:0]data_read_5_buf = 'd0;
always@(*)begin
    if(ack_ddr3_idle && CTRL_STATE == CTRL_IDLE)begin
        data_read_0 <= data_read_0_buf;
        data_read_1 <= data_read_1_buf;
        data_read_2 <= data_read_2_buf;
        data_read_3 <= data_read_3_buf;
        data_read_4 <= data_read_4_buf;
        data_read_5 <= data_read_5_buf;
    end
end
wire [2:0]DDR_COUNT_R;
assign DDR_COUNT_R = {ddr_count_r_4,ddr_count_r_2,ddr_count_r_1};
reg ddr_count_r_4 = 'd0;
reg ddr_count_r_2 = 'd0;
reg ddr_count_r_1 = 'd0;
always@(negedge clk_ddr_dqs_w)begin
    ddr_count_r_1 <= ~ddr_count_r_1;
end
always@(negedge ddr_count_r_1)begin
    ddr_count_r_2 <= ~ddr_count_r_2;
end
always@(negedge ddr_count_r_2)begin
    ddr_count_r_4 <= ~ddr_count_r_4;
end
always @(posedge clk_ddr_w)begin
     if(DDR_STATE == READING)begin
          if(DDR_COUNT == 'd0)begin
          
          
          data_read_0_buf <= {qi2,qi1};        
          end else if(DDR_COUNT == 'd1)begin
          
          
          data_read_1_buf <= {qi2,qi1};        
          end else if(DDR_COUNT == 'd2)begin 
          
          
          data_read_2_buf <= {qi2,qi1};        
          end else if(DDR_COUNT == 'd3)begin 
          
          
          data_read_3_buf <= {qi2,qi1};        
          end else if(DDR_COUNT == 'd4)begin 
          
          
          data_read_4_buf <= {qi2,qi1};        
          end else if(DDR_COUNT == 'd5)begin 
          
          
          data_read_5_buf <= {qi2,qi1};        
          end
     end
end
wire [15:0]qi1;
wire [15:0]qi2;
wire [15:0]di;
wire [15:0]qo;
reg [15:0]do1;
reg [15:0]do2;
genvar n;
generate
    for (n = 0; n < 16; n = n + 1) begin : iddr
            IDDR #(
                .DDR_CLK_EDGE("SAME_EDGE"),
                .SRTYPE("ASYNC")
            )
            iddr_inst (
                .Q1(qi1[n]),
                .Q2(qi2[n]),
                .C(clk_ddr_w),
                .CE(1'b1),
                .D(di[n]),
                .R(1'b0),
                .S(1'b0)
            );
            ODDR #(
                .DDR_CLK_EDGE("SAME_EDGE"),
                .SRTYPE("ASYNC")
            )
            oddr_inst (
                .Q(qo[n]),
                .C(clk_ddr_dqs_w),
                .CE(1'b1),
                .D1(do1[n]),
                .D2(do2[n]),
                .R(1'b0),
                .S(1'b0)
            );
     end
endgenerate
    reg            r_ddr3_reset_n = 'd0;
    reg    [0:0]   r_ddr3_cke = 'd1;
    reg    [0:0]   r_ddr3_cs_n = 'd1;
    reg            r_ddr3_ras_n; 
    reg             r_ddr3_cas_n; 
    reg             r_ddr3_we_n;
    reg    [2:0]   r_ddr3_ba;
    reg    [13:0]  r_ddr3_addr;
    reg    [0:0]   r_ddr3_odt = 'd0;
    reg    [1:0]   r_ddr3_dm = 'd1;
    reg    [15:0]  r_ddr3_dq = 'h3210; 
reg init200ms = 'd1;
reg init200us ='d0;
reg init200us_start = 'd1;
wire shift_data_out0;
wire shift_data_out1;
wire shift_data_out2;
wire shift_data_out3;
 shift_reg #(16)shift_reg_inst0(clk_w,shift_data_out0,init200us_start,1'b1,shift_data_out0);
 shift_reg #(16)shift_reg_inst1(shift_data_out0,shift_data_out1,1'b1,1'b1,shift_data_out1);
 shift_reg #(16)shift_reg_inst2(shift_data_out1,shift_data_out2,1'b1,1'b1,shift_data_out2);
 shift_reg #(5)shift_reg_inst3(shift_data_out2,shift_data_out3,1'b1,1'b1,shift_data_out3);
reg flagRst = 'd0;
always @(*)if(shift_data_out0) flagRst <= 'd1;
reg flag200us = 'd0;
always@(posedge clk_w)begin
     if(shift_data_out3)begin
     init200us_start <= 'd0;
     if(~flag200us)begin
          init200us <= 'd1;
          flag200us <= 'd1;
     end else init200us <= 'd0;
end
end
reg init10ns = 'd0;
reg init10ns_start = 'd0;
always@(*)begin
if(init200us) init10ns_start <= 'd1;
else if(init10ns) init10ns_start <= 'd0;
end
reg flag10ns = 'd0;
reg [0:0]init10nsCount = 'd0;
always @(posedge clk_w)begin
    if(init10ns_start)begin
     if(init10nsCount != 'd0)begin
          init10nsCount <= 'd0;
     end else if(init10nsCount == 'd0)begin
          init10ns <= 'd1;
          init10nsCount <= 'd1;
          flag10ns <= 'd1;
     end 
    end else begin
           init10ns <= 'd0;
         
     end
end
always@(*)begin
if(init10ns)begin 
     init500us_start <= 'd1;
end else if(init500us)init500us_start <= 'd0;
end
always@(negedge clk_ddr_w)begin
     if(flag200us && !r_ddr3_cke) r_ddr3_reset_n <= 'd1; 
     
end
reg init500us = 'd0;
reg init500us_start = 'd0;
wire shift_500us_out0;
wire shift_500us_out1;
wire shift_500us_out2;
wire shift_500us_out3;
 shift_reg #(16)shift_500us_inst0(clk_w,shift_500us_out0,init500us_start,1'b1,shift_500us_out0);
 shift_reg #(4)shift_500us_inst1(shift_500us_out0,shift_500us_out1,1'b1,1'b1,shift_500us_out1);
 
reg flag500us = 'd0;
always@(posedge clk_w)begin
     if(shift_500us_out1)begin
     
     if(~flag500us)begin
          init500us <= 'd1;
          flag500us <= 'd1;
     end else init500us <= 'd0;
end
end
reg initStart = 'd0;
always@(*)begin
     if(flag500us) begin 
     initStart <= 'd1;
     end 
end
reg itr6ClkR = 'd0;
always@(posedge clk_ddr_dqs_w)begin
    if(DDR_COUNT_R == 'd2)itr6ClkR <= 'd1;
    else itr6ClkR <= 'd0;
end
 
reg itr6Clk = 'd0;
always@(posedge clk_ddr_w)begin
    if(DDR_COUNT == 'd6)itr6Clk <= 'd1;
    else itr6Clk <= 'd0;
end
localparam CTRL_INIT = 'd4;
localparam CTRL_READ = 'd1;
localparam CTRL_WRITE = 'd2;
localparam CTRL_REFRESH = 'd3;
localparam CTRL_IDLE = 'd0;
localparam NULL      = 5'h0;
localparam INIT      = 5'h1;
localparam MRS2      = 5'h2;
localparam MRS3      = 5'h3;
localparam MRS1      = 5'h4;
localparam MRS0      = 5'h5;
localparam NOP      = 5'h6;
localparam ZQCL      = 5'h7;
localparam DLLO      = 5'h8;
localparam ACT      = 5'ha;
localparam WRITE      = 5'hd;
localparam WRITING   = 5'he;
localparam READ      = 5'h12;
localparam READING   = 5'h13;
localparam REFRESH      = 5'h14;
localparam PRE_ALL      = 5'h1a;
reg itr512_Start = 'd0;
wire itr512Clk0;
wire itr512Clk1;
shift_reg #(12)shift_itr512Clk_inst0(clk_w,itr512Clk0,itr512_Start,1'b1,itr512Clk0);
shift_reg #(13)shift_itr512Clk_inst1(itr512Clk0,itr512Clk1,1'b1,1'b1,itr512Clk1);
always@(*)itr512_Start <= (DDR_STATE == ZQCL || DDR_STATE == DLLO)?'d1:'d0;
 reg [2:0]DATA_READ_WRITE = 'd0;
reg [2:0]data_bank_r = 'd0;
reg [13:0]data_addr_row_r = 'd0;
reg [13:0]data_addr_col_r = 'd0;
reg [2:0]data_read_write_r = 'd0;
always@(*) if(ack_ddr3_idle && CTRL_STATE == CTRL_IDLE)data_read_write_r <= data_read_write;
always@(*) begin
    if(ack_ddr3_idle && CTRL_STATE == CTRL_IDLE)begin
        {data_bank_r,data_addr_row_r,data_addr_col_r} <= 
                {data_addr[23:21], 
                 data_addr[20:7], 
                 {3'b0,1'b1,data_addr[6:0],3'b0}};
    end
end
reg flagTest6 = 'd0;
reg flagTest512 = 'd0;
reg [2:0]CTRL_STATE = 'd4;
reg [4:0]DDR_STATE = 'd0;
reg [4:0]DDR_STATE_X = 'd0;
reg lastCmd = 'd0;
always@(posedge itr6Clk)begin
     
     
    if(CTRL_STATE == CTRL_INIT)begin
        if(DDR_STATE == NULL )begin
            if(initStart)DDR_STATE <= INIT;
            DDR_STATE_X <= ZQCL;
        end else if(DDR_STATE == INIT )begin
            DDR_STATE <= ZQCL;
            DDR_STATE_X <= REFRESH;
        end else if(DDR_STATE == ZQCL)begin
            if(itr512Clk1)begin
               DDR_STATE <= REFRESH;
               DDR_STATE_X <= NOP;
            end
        end else if(DDR_STATE == DLLO)begin
            if(itr512Clk1)begin
                lastCmd <= 'd1;
                CTRL_STATE <= CTRL_IDLE;
                DDR_STATE <= NOP;
                DDR_STATE_X <= NOP;
            end
        end else if(DDR_STATE == REFRESH )begin
                DDR_STATE <= NOP;
                DDR_STATE_X <= MRS2;
        end else if(DDR_STATE == NOP)begin
            
            DDR_STATE <= MRS2;
            DDR_STATE_X <= MRS3;
            
        end else if(DDR_STATE == MRS2 )begin
            DDR_STATE <= MRS3;
            DDR_STATE_X <= MRS1;
        end else if(DDR_STATE == MRS3 )begin
            DDR_STATE <= MRS1;
            DDR_STATE_X <= MRS0;
        end else if(DDR_STATE == MRS1 )begin
            DATA_READ_WRITE <= CTRL_WRITE;    
            DDR_STATE <= MRS0;
            DDR_STATE_X <= PRE_ALL;
        
        
        
        
        
        
        end else if(DDR_STATE == MRS0)begin
            DDR_STATE <= DLLO;
            DDR_STATE_X <= NOP;
        end 
    end else if(CTRL_STATE == CTRL_WRITE)begin
        
        
        
        
        
        if(DDR_STATE == NOP)begin
            DDR_STATE <= ACT;
            DDR_STATE_X <= WRITE;
        end else if(DDR_STATE == ACT )begin
            DATA_READ_WRITE <= CTRL_READ;    
            DDR_STATE <= WRITE;
            DDR_STATE_X <= WRITING;
        end else if(DDR_STATE == WRITE )begin
            DDR_STATE <= WRITING;
            DDR_STATE_X <= NOP;
        end else if(DDR_STATE == WRITING )begin
            CTRL_STATE <= CTRL_IDLE;
            DDR_STATE <= NOP;
            DDR_STATE_X <= NOP;
        
        end 
        
    end else if(CTRL_STATE == CTRL_READ)begin
        
        
        
        
        
        if(DDR_STATE == NOP)begin
            DDR_STATE <= ACT;
            DDR_STATE_X <= READ;
        end else if(DDR_STATE == ACT )begin  
            DATA_READ_WRITE <= CTRL_REFRESH;    
            DDR_STATE <= READ;
            DDR_STATE_X <= READING;
        end else if(DDR_STATE == READ )begin
            DDR_STATE <= READING;
            DDR_STATE_X <= NOP;
         end else if(DDR_STATE == READING )begin
            CTRL_STATE <= CTRL_IDLE;
            DDR_STATE <= NOP;
            DDR_STATE_X <= NOP;
       
        end
        
    end else if(CTRL_STATE == CTRL_REFRESH)begin
        
        
        
        
        
        if( DDR_STATE == NOP)begin
            DATA_READ_WRITE <= CTRL_WRITE;    
            DDR_STATE <= REFRESH;
            DDR_STATE_X <= NOP;
        end else if(DDR_STATE == REFRESH )begin
            CTRL_STATE <= CTRL_IDLE;
            DDR_STATE <= NOP;
            DDR_STATE_X <= NOP;
        
             
        end
        
    end else if(CTRL_STATE == CTRL_IDLE)begin
        
        
            
            if(idleProcStart)begin
                CTRL_STATE <= data_read_write_r;
                DDR_STATE <= NOP;
                DDR_STATE_X <= ACT;
            end
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    end
end
reg TEST_STATE = 'd0;
always@(negedge clk_ddr_w)begin
     if(lastCmd)begin
        if(DDR_STATE == NOP && DDR_STATE_X == NOP)r_ddr3_odt <= 'd1;
     end else r_ddr3_odt <= 'd0;
               
end
always@(*)begin
     if(DDR_STATE == WRITING)begin
               WR_RD_DQS <= 'd1;
     end else WR_RD_DQS <= 'd0;
end
always@(*)begin
     if(DDR_STATE == READING)begin
               RD_WR_DQS <= 'd1;
     end else RD_WR_DQS <= 'd0;
end
localparam AOP_PRE = 1'b0;
localparam AOP_PREA = 1'b1;
localparam AOP_ZQCL = 1'b1;
localparam AOP_ZQCS = 1'b0;
localparam CMD_MRS = 3'b000;
localparam CMD_REF = 3'b001;
localparam CMD_PRE = 3'b010;
localparam CMD_ACT = 3'b011;
localparam CMD_WR = 3'b100;
localparam CMD_RD = 3'b101;
localparam CMD_ZQCL = 3'b110;
localparam CMD_NOP = 3'b111;
localparam BA_MRS0 = 3'b000;
localparam BA_MRS1 = 3'b001;
localparam BA_MRS2 = 3'b010;
localparam BA_MRS3 = 3'b011;
wire [2:0]DDR_COUNT;
assign DDR_COUNT = {ddr_count_4,ddr_count_2,ddr_count_1};
reg ddr_count_4 = 'd0;
reg ddr_count_2 = 'd0;
reg ddr_count_1 = 'd0;
always@(negedge clk_ddr_w)begin
    ddr_count_1 <= ~ddr_count_1;
end
always@(negedge ddr_count_1)begin
    ddr_count_2 <= ~ddr_count_2;
end
always@(negedge ddr_count_2)begin
    ddr_count_4 <= ~ddr_count_4;
end
task DDR_COMMAND;
     input [2:0] CMD;
     begin
          {r_ddr3_ras_n,r_ddr3_cas_n,r_ddr3_we_n} <= CMD;
     end     
endtask
reg ZQCL_RUN = 'd0;
always@(negedge clk_ddr_w)begin
     if(DDR_STATE == INIT)begin
               DDR_COMMAND(CMD_NOP);
     end else if(DDR_STATE == MRS0)begin
          if(DDR_COUNT == 'b0)begin
               DDR_COMMAND(CMD_MRS);
          end else begin
               DDR_COMMAND(CMD_NOP);
          end
     end else if(DDR_STATE == MRS1)begin
          if(DDR_COUNT == 'b0)begin
               DDR_COMMAND(CMD_MRS);
          end else begin
               DDR_COMMAND(CMD_NOP);
          end
     end else if(DDR_STATE == MRS2)begin
          if(DDR_COUNT == 'b0)begin
               DDR_COMMAND(CMD_MRS);
          end else begin
               DDR_COMMAND(CMD_NOP);
          end
     end else if(DDR_STATE == MRS3)begin
          if(DDR_COUNT == 'b0)begin
               DDR_COMMAND(CMD_MRS);
          end else begin
               DDR_COMMAND(CMD_NOP);
          end     
     end else if(DDR_STATE == NOP)begin
               DDR_COMMAND(CMD_NOP);
     end else if(DDR_STATE == ZQCL)begin
          
          
          if(DDR_COUNT == 'b0 && ~ZQCL_RUN)begin
               DDR_COMMAND(CMD_ZQCL);
          end else if(DDR_COUNT != 'b0 || ZQCL_RUN)begin
               ZQCL_RUN <= 'd1;
               DDR_COMMAND(CMD_NOP);
          end
    end else if(DDR_STATE == DLLO)begin
          
               DDR_COMMAND(CMD_NOP);
      end else if(DDR_STATE == PRE_ALL)begin
          if(DDR_COUNT == 'b0)begin
               DDR_COMMAND(CMD_PRE);
          end else begin
               DDR_COMMAND(CMD_NOP);
          end
     end else if(DDR_STATE == ACT)begin
          if(DDR_COUNT == 'b1)begin
               DDR_COMMAND(CMD_ACT);
          end else begin
               DDR_COMMAND(CMD_NOP);
          end
     end else if(DDR_STATE == NOP)begin
               DDR_COMMAND(CMD_NOP);
     end else if(DDR_STATE == WRITE)begin
          if(DDR_COUNT == 'b0)begin
               DDR_COMMAND(CMD_WR);
          end else begin
               DDR_COMMAND(CMD_NOP);
          end
     end else if(DDR_STATE == READ)begin
          if(DDR_COUNT == 'b0)begin
               DDR_COMMAND(CMD_RD);
          end else begin
               DDR_COMMAND(CMD_NOP);
          end
     
       
     end else if(DDR_STATE == REFRESH)begin
          ZQCL_RUN <= 'd0;
          if(DDR_COUNT == 'b1)begin
               DDR_COMMAND(CMD_REF);
          end else begin
               DDR_COMMAND(CMD_NOP);
          end
     end else begin
          DDR_COMMAND(CMD_NOP);
     end
end
always@(*)begin
     if(initStart)begin
          r_ddr3_dm <= 'd0;
     end
end
always@(negedge clk_ddr_w)begin
     if(initStart)begin
        
        
        
         r_ddr3_cke <= 'd1;
     end else if(flag200us)r_ddr3_cke <= 'd0;
end
always@(*)begin
     
          
            
          
     
     if(flagRst)r_ddr3_cs_n <= 'd0;
end
always@(posedge itr6Clk)begin
     if(DDR_STATE_X == MRS0)begin
               r_ddr3_ba <= BA_MRS0;
     end else if(DDR_STATE_X == MRS1)begin
               r_ddr3_ba <= BA_MRS1;
     end else if(DDR_STATE_X == MRS2)begin
               r_ddr3_ba <= BA_MRS2;
     end else if(DDR_STATE_X == MRS3)begin
               r_ddr3_ba <= BA_MRS3;
     end else if(DDR_STATE_X == ACT)begin
               r_ddr3_ba <= data_bank_r;
     end else if(DDR_STATE_X == WRITE)begin
               r_ddr3_ba <= data_bank_r;
     end else if(DDR_STATE_X == READ)begin
               r_ddr3_ba <= data_bank_r;
     end else if(DDR_STATE_X == PRE_ALL)begin
               r_ddr3_ba <= data_bank_r;
     end
end
localparam ADDR_MRS0 = 14'b01_010_100_110_000;
localparam ADDR_MRS1 = 14'b00_000_000_000_000;
localparam ADDR_MRS2 = 14'b00_000_000_010_000;
localparam ADDR_MRS3 = 14'b00_000_000_000_000;
localparam ADDR_ZQCL = 14'b00_010_000_000_000;
localparam ADDR_PRE = 14'b00_010_000_000_000;
localparam ADDR_REF = 14'b00_010_000_000_000;
localparam ADDR_ACT = 14'b00_000_000_000_000;
localparam ADDR_RW = 14'b00_000_000_000_000;
localparam ADDR_CLEAN = 14'b00_000_000_000_000;
always@(posedge itr6Clk)begin
     if(DDR_STATE_X == MRS0)begin
               r_ddr3_addr <= ADDR_MRS0;
     end else if(DDR_STATE_X == MRS1)begin
               r_ddr3_addr <= ADDR_MRS1;
     end else if(DDR_STATE_X == MRS2)begin
               r_ddr3_addr <= ADDR_MRS2;
     end else if(DDR_STATE_X == MRS3)begin
               r_ddr3_addr <= ADDR_MRS3;
     end else if(DDR_STATE_X == ZQCL)begin
               r_ddr3_addr <= ADDR_ZQCL;
     end else if(DDR_STATE_X == PRE_ALL)begin
               r_ddr3_addr <= ADDR_PRE;
     end else if(DDR_STATE_X == REFRESH)begin
               r_ddr3_addr <= ADDR_REF;
     end else if(DDR_STATE_X == ACT)begin
               r_ddr3_addr <= data_addr_row_r;
               
     end else if(DDR_STATE_X == READ || DDR_STATE_X == WRITE)begin
               
               r_ddr3_addr <= data_addr_col_r;
     
     
     
     
     end
end
endmodule