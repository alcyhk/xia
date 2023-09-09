`timescale 1ns / 1ps
module adc_ctrl(
     input wire clk    
    ,input wire ROUTE_TS_86
    ,input wire [6:0]GRID_ADC_ADDR    
    ,output reg [15:0]GRID_ADC_DATA
    ,input wire [8:0] ck_an_p
    ,input wire [8:0] ck_an_n
    ,input wire vp_in
    ,input wire vn_in
    );
wire [15:0] data;   
reg [6:0] Address_in; 
reg req_adc_load = 0;
reg ack_adc_load = 0;
always@(*)begin
    if(req_adc_load == 0 && ack_adc_load == 0 && ROUTE_TS_86)begin
        req_adc_load <= 1;
    end else if(req_adc_load == 1 && ack_adc_load == 1)begin
        req_adc_load <= 0;
    end
end
always@(posedge clk)begin
    if(req_adc_load == 1 && ack_adc_load == 0)begin
        ack_adc_load <= 1;
    end else if(req_adc_load == 0 && ack_adc_load == 1)begin
        ack_adc_load <= 0;
    end
end  
    
always @(*)begin
    if(ack_adc_load)begin
           
           Address_in <= GRID_ADC_ADDR;
           
           GRID_ADC_DATA <= adc_data;
        
    end
end
 reg [15:0]adc_data;
always@(posedge clk)adc_data <= data;
     wire enable;
   wire ready;
       
   
    adc adc_inst
        (
        .daddr_in(Address_in),            
        .dclk_in(clk),             
        .den_in(enable),              
        
        .di_in(0),               
        .dwe_in(0),              
        .reset_in(0),            
        .busy_out(),            
        .channel_out(),         
        .do_out(data),              
        .eoc_out(enable),             
        .eos_out(),             
        .alarm_out(),           
        .drdy_out(ready),            
        
        .vp_in(vp_in),               
        .vn_in(vn_in),
        .vauxp4(ck_an_p[0]),              
        .vauxn4(ck_an_n[0]),
        .vauxp5(ck_an_p[1]),              
        .vauxn5(ck_an_n[1]),
        .vauxp6(ck_an_p[2]),              
        .vauxn6(ck_an_n[2]),
        .vauxp7(ck_an_p[3]),              
        .vauxn7(ck_an_n[3]),
        .vauxp15(ck_an_p[4]),              
        .vauxn15(ck_an_n[4]),
        .vauxp0(ck_an_p[5]),             
        .vauxn0(ck_an_n[5]),
        .vauxp12(ck_an_p[6]),             
        .vauxn12(ck_an_n[6]),
        .vauxp13(ck_an_p[7]),             
        .vauxn13(ck_an_n[7]),
        .vauxp14(ck_an_p[8]),             
        .vauxn14(ck_an_n[8])
        
        
    );
         
         
         
         
         
         
         
         
         
endmodule
