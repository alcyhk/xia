module uart_rx
  #(parameter CLKS_PER_BIT = 208)
  (
    input wire reset,
   input  wire      i_Clock,
   input  wire      i_Rx_Serial,
   output wire      o_Rx_DV,
   output wire[7:0] o_Rx_Byte
   );
    
  localparam s_IDLE         = 3'b000;
  localparam s_RX_START_BIT = 3'b001;
  localparam s_RX_DATA_BITS = 3'b010;
  localparam s_RX_STOP_BIT  = 3'b011;
  localparam s_CLEANUP      = 3'b100;
   
  reg           r_Rx_Data_R = 1'b1;
  reg           r_Rx_Data   = 1'b1;
   
  reg [7:0]     r_Clock_Count = 0;
  reg [2:0]     r_Bit_Index   = 0; 
  reg [7:0]     r_Rx_Byte     = 0;
  reg           r_Rx_DV       = 0;
  reg [2:0]     r_SM_Main     = 0;
   
  
  
  
  
  
reg clksPerBitStart = 'd0;
wire clksPerBit_0;
wire clksPerBit_1;
wire clksPerBit_2;
wire clksPerBitHalf;
wire clksPerBitFull;
 shift_reg #(18)clksPerBitHalf_0_inst0(i_Clock,clksPerBit_0,clksPerBitStart,1'b1,clksPerBit_0);
 shift_reg #(5)clksPerBitHalf_1_inst0(clksPerBit_0,clksPerBit_1,clksPerBitStart,1'b1,clksPerBit_1);
 shift_reg_1 #(1) clksPerBitHalf_2_inst0(clksPerBit_1,clksPerBit_2,clksPerBitStart,1'b1,clksPerBit_2);
assign clksPerBitHalf = clksPerBit_0 & clksPerBit_1;
assign clksPerBitFull = clksPerBit_0 & clksPerBit_1 & clksPerBit_2;
  
  always @(posedge i_Clock)
    begin
      r_Rx_Data_R <= i_Rx_Serial;
      r_Rx_Data   <= r_Rx_Data_R;
    end
   
   
   
  
  
  always @(posedge i_Clock)
    begin
       
      case (r_SM_Main)
        s_IDLE :
          begin
            r_Rx_DV       <= 1'b0;
            r_Clock_Count <= 0;
            r_Bit_Index   <= 0;
             
            if (r_Rx_Data == 1'b0 && reset)  begin        
              r_SM_Main <= s_RX_START_BIT;
              clksPerBitStart <= 'd1;
            end else
              r_SM_Main <= s_IDLE;
          end
         
        
        s_RX_START_BIT :
          begin
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            if(clksPerBitHalf && r_Rx_Data == 1'b0)begin
                r_SM_Main     <= s_RX_DATA_BITS;
                
            end else if(clksPerBitHalf && r_Rx_Data != 1'b0)begin
                r_SM_Main <= s_IDLE;
                
            end
          end 
         
         
        
        s_RX_DATA_BITS :
          begin
            
            
            
            
            
            
            
            
            
            
            
                 
            
            
            
            
            
            
            
            
            
            
            
            
            if(clksPerBitFull && r_Bit_Index < 7)begin
                r_Rx_Byte[r_Bit_Index] <= r_Rx_Data;
                r_Bit_Index <= r_Bit_Index + 1;
                r_SM_Main   <= s_RX_DATA_BITS;
              end else if(clksPerBitFull)begin
                r_Rx_Byte[r_Bit_Index] <= r_Rx_Data;
                r_Bit_Index <= 0;
                r_SM_Main   <= s_RX_STOP_BIT;
              end
          end 
     
     
        
        s_RX_STOP_BIT :
          begin
            
            
            
            
            
            
            
            
            
            
            
            
            if(clksPerBitFull)begin
                clksPerBitStart <= 'd0;                
                r_Rx_DV       <= 1'b1;
                 r_SM_Main     <= s_CLEANUP;
            end 
          end 
     
         
        
        s_CLEANUP :
          begin
            r_SM_Main <= s_IDLE;
            r_Rx_DV   <= 1'b0;
          end
         
         
        default :
          r_SM_Main <= s_IDLE;
         
      endcase
    end   
   
  assign o_Rx_DV   = r_Rx_DV;
  assign o_Rx_Byte = r_Rx_Byte;
   
endmodule 