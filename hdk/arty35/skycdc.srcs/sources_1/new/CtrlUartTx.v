`timescale 1ns / 1ps
module CtrlUartTx(
    input wire ROUTE_TS_e1,
    
    
    input wire clkUart,
    input wire GRID_UART_TX0_SET_ONCE,
    input wire [7:0]GRID_UART_TX0_BYTE,
    output reg uart0_txd = 'd0
    );
    
reg req_uart_tx = 0;
reg ack_uart_tx = 0;
always@(*)begin
    if(req_uart_tx == 0 && ack_uart_tx == 0 && ROUTE_TS_e1)begin
        req_uart_tx <= 1;
    end else if(req_uart_tx == 1 && ack_uart_tx == 1)begin
        req_uart_tx <= 0;
    end
end
always@(posedge clkUart)begin
    if(req_uart_tx == 1 && ack_uart_tx == 0)begin
        ack_uart_tx <= 1;
    end else if(req_uart_tx == 0 && ack_uart_tx == 1)begin
        ack_uart_tx <= 0;
    end
end
reg UART_TOP_TX0_SET_ONCE_FROM_GRID = 'd0;
always@(*)begin
    if(ack_uart_tx)begin
        UART_TOP_TX0_SET_ONCE_FROM_GRID <= GRID_UART_TX0_SET_ONCE;
        tx0_dataIn_r <= GRID_UART_TX0_BYTE;
    end
end
reg flagSet = 'd0;
always@(posedge clkUart)begin 
    if(~flagSet && UART_TOP_TX0_SET_ONCE_FROM_GRID && txAckStart)begin
        tx0_write_r <= 1;
        flagSet <= 1;
    end else if(flagSet)begin
        tx0_write_r <= 0;
        if(~UART_TOP_TX0_SET_ONCE_FROM_GRID)flagSet <= 0;
    end
end
wire tx0_empty;
wire tx0_full;
wire tx0_empty_r;
wire tx0_full_r;
wire tx0_write;
wire tx0_read;
wire [7:0]tx0_dataOut;
wire [7:0]tx0_dataIn;
reg tx0_write_r = 'd0;
reg tx0_read_r = 'd0;
wire [7:0]tx0_dataOut_r;
reg [7:0]tx0_dataIn_r = 'd0;
assign tx0_write = tx0_write_r;
assign tx0_read = tx0_read_r;
assign tx0_dataOut_r = tx0_dataOut;
assign tx0_dataIn = tx0_dataIn_r;
assign tx0_empty_r = tx0_empty;
assign tx0_full_r = tx0_full;
reg flagStart = 'd0;
reg [1:0]countStart = 'd0;
always@(posedge clkUart)begin
    if(countStart < 'h3)countStart <= countStart + 'd1;
    else flagStart <= 'd1;
end
fifo_ttl ip_fifo_ttl_tx0_inst(
    .rst(~flagStart),
    .din(tx0_dataIn),
    .wr_clk(clkUart), 
    .wr_en(tx0_write),
    .dout(tx0_dataOut), 
    .rd_clk(clkUart), 
    .rd_en(tx0_read),
    .empty(tx0_empty), 
    
    .full(tx0_full) 
    
);
reg txAckStart = 'd0;
wire itrAckClk;
always@(*)begin
    if(ack_uart_tx)begin 
        txAckStart <= 'd1;
    end else if(itrAckClk)txAckStart <= 'd0;
end
shift_reg #(8)shift_txAckClk_inst0(clkUart,itrAckClk,txAckStart,1'b1,itrAckClk);
    
    
    
reg uart0_tx_dv_r = 'd0;
initial uart0_tx_dv_r <= 0;
always@(*)uart0_tx_dv <= uart0_tx_dv_r;
always@(*)uart0_tx_byte <= tx0_dataOut;
reg [1:0]tx0ReadCount = 'd0;
initial tx0ReadCount <= 2'd0;
reg tx0ReadStart = 'd0;
always @(posedge clkUart)begin
    
    if(~uart0_tx_busy && ~tx0_empty_r)tx0ReadStart <= 'd1;
    else tx0ReadStart <= 'd0;
end
always @(posedge clkUart)begin
    if(tx0ReadStart && tx0ReadCount < 'd3)begin
        tx0ReadCount <= tx0ReadCount + 'd1;
    end else if(uart0_tx_done)tx0ReadCount <= 'd0;
end
always @(posedge clkUart)begin
    if(tx0ReadStart && tx0ReadCount == 2'd0)begin
        tx0_read_r <= 'd1;
    end else tx0_read_r <= 'd0;
end
always@(posedge clkUart)begin
    if(tx0ReadCount == 2'd2) begin
        uart0_tx_dv_r <= 1;
    end else if(tx0ReadCount == 2'd3) begin
        uart0_tx_dv_r <= 0;      
    end
end
reg [7:0]uart0_tx_byte = 'd0;
reg uart0_tx_dv = 'd0;
wire uart0_tx_busy;
wire uart0_tx_active;
initial uart0_tx_dv <= 0;
wire uart0_tx_done;
wire uart0_txd_w;
always@(*)uart0_txd <= uart0_txd_w;
uart_tx #(.CLKS_PER_BIT(217)) uart0_tx_inst(
.reset(1'b1),
.i_Clock(clkUart),
.i_Tx_DV(uart0_tx_dv),
.i_Tx_Byte(uart0_tx_byte),
.o_Tx_Active(uart0_tx_active),
.o_Tx_Serial(uart0_txd_w),
.o_Tx_busy(uart0_tx_busy),
.o_Tx_Done(uart0_tx_done)
);
initial begin
tx0_write_r <= 0;
tx0_read_r <= 0;
end
    
    
endmodule
