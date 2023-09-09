`timescale 1ns / 1ps
module ClockAndReset(
      input wire clk
      
      ,output wire clkFast
      
     ,output wire clkSDR
     ,output wire clkSlow
     
     ,output wire clkSDR_90
     
    );
    
reg [3:0]pllInitCounter;
reg pllReset;
initial begin
    pllInitCounter <= 0;
        pllReset <= 0;
    
end
always @(posedge clk)begin
    if(pllInitCounter != 4'hf)begin
    pllInitCounter <= pllInitCounter + 'b1;
    end else begin
        pllReset <= 'b1;
    end
end
    
    
    
    
        
      
    
 
 mmcm mmcm_inst(
    .clk(clk),
  
  .reset(~pllReset),
  
  
  .clk_out0(clkFast)
  
  ,.clk_out2(clkSDR)
  ,.clk_out3(clkSlow)
  
  ,.clk_out5(clkSDR_90)
  
    );
    
    
endmodule
