`timescale 1ns / 1ps
module gpio_ctrl(
    input wire clk    
    ,input wire ROUTE_TS_85
    ,input wire [31:0]GRID_GPIO    
    ,output reg [31:0]GRID_GPIO_IN = 'd0
    ,output reg [31:0]gpios = 'd0
    ,input wire [31:0]gpios_in    
    );
reg req_gpio_load = 0;
reg ack_gpio_load = 0;
always@(*)begin
    if(req_gpio_load == 0 && ack_gpio_load == 0 && ROUTE_TS_85)begin
        req_gpio_load <= 1;
    end else if(req_gpio_load == 1 && ack_gpio_load == 1)begin
        req_gpio_load <= 0;
    end
end
always@(posedge clk)begin
    if(req_gpio_load == 1 && ack_gpio_load == 0)begin
        ack_gpio_load <= 1;
    end else if(req_gpio_load == 0 && ack_gpio_load == 1)begin
        ack_gpio_load <= 0;
    end
end  
    
always @(*)begin
    if(ack_gpio_load)begin
           
           gpios <= GRID_GPIO;
           GRID_GPIO_IN <= gpios_in;
        
    end
end
    
    
endmodule
