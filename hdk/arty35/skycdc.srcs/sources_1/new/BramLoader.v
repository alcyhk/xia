`timescale 1ns / 1ps
module BramLoader(
    input wire clkBram
    ,input wire ROUTE_TS_01
    
    ,input wire OP_JMP_FLAG_FROM_GRID
    ,input wire [15:0] ROM_ADDR_FROM_GRID
    ,output reg [7:0]romLLL
    ,output reg [7:0]romLLU
    ,output reg [7:0]romLUL
    ,output reg [7:0]romLUU
    ,output reg [7:0]romULL
    ,output reg [7:0]romULU
    ,output reg [7:0]romUUL
    ,output reg [7:0]romUUU
    );
    
     reg [7:0]ROM_LLL;
     reg [7:0]ROM_LLU;
     reg [7:0]ROM_LUL;
     reg [7:0]ROM_LUU;
     reg [7:0]ROM_ULL;
     reg [7:0]ROM_ULU;
     reg [7:0]ROM_UUL;
     reg [7:0]ROM_UUU;
wire [7:0]ROUTE_TOP_BRAM_DQ_READ;
wire [15:0]ROUTE_TOP_BRAM_ADDR;
base base_inst(
    .out(ROUTE_TOP_BRAM_DQ_READ), 
    .addr(ROUTE_TOP_BRAM_ADDR),
    .clk(clkBram)
);
 
reg req_bram_op = 0;
reg ack_bram_op = 0;
always@(*)begin
    if(req_bram_op == 0 && ack_bram_op == 0 && ROUTE_TS_01)begin
        req_bram_op <= 1;
    end else if(req_bram_op == 1 && ack_bram_op == 1)begin
        req_bram_op <= 0;
    end
end
always@(posedge clkBram)begin
    if(req_bram_op == 1 && ack_bram_op == 0)begin
        ack_bram_op <= 1;
    end else if(req_bram_op == 0 && ack_bram_op == 1)begin
        ack_bram_op <= 0;
    end
end
reg op_jmp_flag_from_grid = 'd0;
reg [15:0]rom_addr_from_grid = 'd0;
always@(*)begin
    if(ack_bram_op)begin
    op_jmp_flag_from_grid <= OP_JMP_FLAG_FROM_GRID;
    rom_addr_from_grid <= ROM_ADDR_FROM_GRID;
end
end
always@(*)begin
    if(ack_bram_op)begin
    romLLL <= ROM_LLL;
    romLLU <= ROM_LLU;
    romLUL <= ROM_LUL;
    romLUU <= ROM_LUU;
    romULL <= ROM_ULL;
    romULU <= ROM_ULU;
    romUUL <= ROM_UUL;
    romUUU <= ROM_UUU;
    end
end
reg romAckStart = 'd0;
reg romSetStart = 'd0;
always@(*)begin
    if(ack_bram_op)begin 
        romAckStart <= 'd1;
        
    end else if(itrAckClk)romAckStart <= 'd0;
end
reg waitItrRomClk = 'd0;
always@(*)begin
    if(itrAckClk)begin 
        romSetStart <= 'd1;
    end else if(itrRomClk)romSetStart <= 'd0;
end
wire itrAckClk;
shift_reg #(2)shift_itrAckClk_inst0(clkBram,itrAckClk,romAckStart,1'b1,itrAckClk);
wire itrRomClk;
shift_reg #(8)shift_itrRomClk_inst0(clkBram,itrRomClk,romSetStart,1'b1,itrRomClk);
reg [3:0]BRAM_COUNTER = 'd0;
reg [15:0]REG_TOP_BRAM_ADDR = 'd0;
assign ROUTE_TOP_BRAM_ADDR = REG_TOP_BRAM_ADDR;
reg[15:0]romAddr = 'd0;
always@(posedge itrRomClk)begin
    if(waitItrRomClk)begin
        if(op_jmp_flag_from_grid)romAddr <= rom_addr_from_grid;
        else romAddr <= romAddr + 'd8;
    end
end
always@(posedge clkBram)begin
    
    if(~romSetStart)begin
        if(op_jmp_flag_from_grid)REG_TOP_BRAM_ADDR <= rom_addr_from_grid;
        else REG_TOP_BRAM_ADDR <= romAddr;
        
    end else begin
        REG_TOP_BRAM_ADDR <= REG_TOP_BRAM_ADDR + 'd1;
    end
end
    
always@(posedge clkBram)begin
    if (BRAM_COUNTER == 'd1)begin
        ROM_LLL <= ROUTE_TOP_BRAM_DQ_READ;
    end else if (BRAM_COUNTER == 'd2)begin
        ROM_LLU <= ROUTE_TOP_BRAM_DQ_READ;
    end else if (BRAM_COUNTER == 'd3)begin
        ROM_LUL <= ROUTE_TOP_BRAM_DQ_READ;
    end else if (BRAM_COUNTER == 'd4)begin
        ROM_LUU <= ROUTE_TOP_BRAM_DQ_READ;
    end else if (BRAM_COUNTER == 'd5)begin
        ROM_ULL <= ROUTE_TOP_BRAM_DQ_READ;
    end else if (BRAM_COUNTER == 'd6)begin
        ROM_ULU <= ROUTE_TOP_BRAM_DQ_READ;
    end else if (BRAM_COUNTER == 'd7)begin
        ROM_UUL <= ROUTE_TOP_BRAM_DQ_READ;
    end else if (BRAM_COUNTER == 'd8)begin
        ROM_UUU <= ROUTE_TOP_BRAM_DQ_READ;
    end 
     
end
always@(posedge clkBram)begin
    if(romSetStart)begin
        waitItrRomClk <= 'd1;
        BRAM_COUNTER <= BRAM_COUNTER + 'd1;   
    end else begin
        BRAM_COUNTER <= 'd0;        
    end 
     
end
    
endmodule
