`timescale 1ns / 1ps
module spi_ctrl
(
    input wire                  I_clk       , 
    
    
    input wire ROUTE_TS_88,
    input wire SPI_RUN_ONCE_FROM_GRID,
    input wire GRID_SPI_SET_GET,
    input wire [1:0]GRID_SPI_CS_SET,
 
output reg GRID_SPI_IDLE = 'd0,
    input wire [7:0]GRID_SPI_DATA_SET, 
    output reg [7:0]GRID_SPI_DATA_GET, 
    
    input                   I_spi_miso  , 
    output                  O_spi_sck   , 
    output                  O_spi_cs0    , 
    output                  O_spi_cs1    , 
    output                  O_spi_cs2    , 
    output                  O_spi_mosi    
);
wire            W_rx_en     ;
wire            W_tx_en     ;
wire   [7:0]    W_data_in   ; 
wire   [7:0]    W_data_out  ; 
wire            W_tx_done   ; 
wire            W_rx_done   ; 
reg             R_rx_en     ='d0;
reg             R_tx_en     ='d0;
reg   [7:0]     R_data_in   ='d0; 
reg   [7:0]     grid_spi_data_set_r  ='d0;
reg   [7:0]     grid_spi_data_get_r  ='d0;
reg   [1:0]     grid_spi_cs_set_r  ='d0;
assign W_rx_en       = R_rx_en           ;
assign W_tx_en       = R_tx_en           ;
assign W_data_in     = R_data_in         ;
reg req_spi_load = 0;
reg ack_spi_load = 0;
always@(*)begin
    if(req_spi_load == 0 && ack_spi_load == 0 && ROUTE_TS_88)begin
        req_spi_load <= 1;
    end else if(req_spi_load == 1 && ack_spi_load == 1)begin
        req_spi_load <= 0;
    end
end
always@(posedge I_clk)begin
    if(req_spi_load == 1 && ack_spi_load == 0)begin
        ack_spi_load <= 1;
    end else if(req_spi_load == 0 && ack_spi_load == 1)begin
        ack_spi_load <= 0;
    end
end  
always@(posedge I_clk)begin
    if(ack_spi_load)begin
        
        GRID_SPI_DATA_GET <= W_data_out;
        R_data_in <= GRID_SPI_DATA_SET;
        
        
        grid_spi_cs_set_r <= GRID_SPI_CS_SET;
        
        GRID_SPI_IDLE <= ~flagSet;
    end
end
reg [7:0]grid_spi_data_out_r = 'd0;
reg [7:0]grid_spi_data_in_r = 'd0;
reg spi_run_once_from_grid_r = 'd0;
always@(*)begin
    if(ack_spi_load)begin
        spi_run_once_from_grid_r <= SPI_RUN_ONCE_FROM_GRID;
        grid_spi_set_get_r <= GRID_SPI_SET_GET;
    end
end
reg clk2 = 'd1;
reg clk4 = 'd1;
always@(posedge I_clk)clk2 <= ~clk2;
always@(posedge clk2)clk4 <= ~clk4;
wire flagSpiSpeed;
 shift_reg #(50)flagTwiSpeed_0_inst0(clk4,flagSpiSpeed,1'b1,1'b1,flagSpiSpeed);
reg grid_spi_set_get_r = 'd0;
reg flagSet = 'd0;
always@(posedge flagSpiSpeed)begin 
    if(~flagSet && spi_run_once_from_grid_r)begin
        if(grid_spi_set_get_r)R_tx_en <= 1;
        else R_rx_en <= 1;
        flagSet <= 1;
    end else if(flagSet)begin
        if(W_tx_done)R_tx_en <= 0;
        if(W_rx_done)R_rx_en <= 0;
 
        if(~R_enable && ~spi_run_once_from_grid_r)flagSet <= 0;
    end
end
wire R_enable;
assign R_enable = R_tx_en | R_rx_en;
spi spi_inst
(
    .I_clk       (flagSpiSpeed), 
    
    .I_rx_en     (W_rx_en), 
    .I_tx_en     (W_tx_en), 
    .I_data_in   (W_data_in), 
    .O_data_out  (W_data_out), 
    .O_tx_done   (W_tx_done), 
    .O_rx_done   (W_rx_done), 
    
    .I_grid_spi_cs(grid_spi_cs_set_r),
    
    .I_spi_miso  (I_spi_miso), 
    .O_spi_sck   (O_spi_sck), 
    .O_spi_cs0    (O_spi_cs0), 
    .O_spi_cs1    (O_spi_cs1), 
    .O_spi_cs2    (O_spi_cs2), 
    .O_spi_mosi  (O_spi_mosi) 
);
endmodule
