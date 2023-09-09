`timescale 1ns / 1ps
module CtrlUartRx(
    input wire ROUTE_TS_e2,
    
    input wire clkUart,
    input wire UART_TOP_RX0_REC_SET,
    output reg [7:0]GRID_UART_RX0_BYTE = 'd0,
    output reg UART_TOP_RX0_EMPTY = 'd1,
    input wire uart0_rxd
    );
reg req_uart_rx = 0;
reg ack_uart_rx = 0;
always@(*)begin
    if(req_uart_rx == 0 && ack_uart_rx == 0 && ROUTE_TS_e2)begin
        req_uart_rx <= 1;
    end else if(req_uart_rx == 1 && ack_uart_rx == 1)begin
        req_uart_rx <= 0;
    end
end
always@(posedge clkUart)begin
    if(req_uart_rx == 1 && ack_uart_rx == 0)begin
        ack_uart_rx <= 1;
    end else if(req_uart_rx == 0 && ack_uart_rx == 1)begin
        ack_uart_rx <= 0;
    end
end
reg UART_TOP_RX0_REC_SET_FROM_GRID = 'd0;
always@(*)if(ack_uart_rx)UART_TOP_RX0_REC_SET_FROM_GRID <= UART_TOP_RX0_REC_SET;
always@(*)if(ack_uart_rx)UART_TOP_RX0_EMPTY <= rx0_empty_r;
always@(*)if(ack_uart_rx)GRID_UART_RX0_BYTE <= rx0_dataOut_r;
reg rxAckStart = 'd0;
wire itrAckClk;
always@(*)begin
    if(ack_uart_rx)begin 
        rxAckStart <= 'd1;
    end else if(itrAckClk)rxAckStart <= 'd0;
end
shift_reg #(8)shift_rxAckClk_inst0(clkUart,itrAckClk,rxAckStart,1'b1,itrAckClk);
reg flagSet = 'd0;
always@(posedge clkUart)begin 
    if(~flagSet && UART_TOP_RX0_REC_SET_FROM_GRID && rxAckStart)begin
        rx0_read_r <= 1;
        flagSet <= 1;
    end else if(flagSet)begin
        rx0_read_r <= 0;
        if(~UART_TOP_RX0_REC_SET_FROM_GRID)flagSet <= 0;
    end
end
        
    
wire [7:0]uart0_rx_byte;
wire uart0_rx_dv;
reg uart0_rx_dv_r;
uart_rx #(.CLKS_PER_BIT(217)) uart0_rx_inst(
.reset(1'b1),
.i_Clock(clkUart),
.i_Rx_Serial(uart0_rxd),
.o_Rx_DV(uart0_rx_dv),
.o_Rx_Byte(uart0_rx_byte)
);
always@(*)uart0_rx_dv_r <= uart0_rx_dv;
wire rx0_empty;
wire rx0_full;
wire rx0_empty_r;
wire rx0_full_r;
wire rx0_write;
wire rx0_read;
wire [7:0]rx0_dataOut;
wire [7:0]rx0_dataIn;
reg rx0_write_r = 'd0;
reg rx0_read_r = 'd0;
wire [7:0]rx0_dataOut_r;
reg [7:0]rx0_dataIn_r = 'd0;
assign rx0_write = rx0_write_r;
assign rx0_read = rx0_read_r;
assign rx0_dataOut_r = rx0_dataOut;
assign rx0_dataIn = rx0_dataIn_r;
assign rx0_empty_r = rx0_empty;
assign rx0_full_r = rx0_full;
reg flagStart = 'd0;
reg [1:0]countStart = 'd0;
always@(posedge clkUart)begin
    if(countStart < 'h3)countStart <= countStart + 'd1;
    else flagStart <= 'd1;
end
fifo_ttl ip_fifo_ttl_rx0_inst(
    .rst(~flagStart),
    .din(rx0_dataIn),
    .wr_clk(clkUart), 
    .wr_en(rx0_write),
    .dout(rx0_dataOut), 
    .rd_clk(clkUart), 
    .rd_en(rx0_read),
    .empty(rx0_empty), 
    
    .full(rx0_full) 
    
);
reg uart0_rx_counter = 'd0;
always@(*)rx0_dataIn_r <= uart0_rx_byte;
always @(posedge clkUart)begin
    
    if(uart0_rx_dv_r && ~rx0_full_r)begin
    
        rx0_write_r <= 1;
    end else if(~uart0_rx_dv_r) begin
        rx0_write_r <= 0;
    end 
end
endmodule
