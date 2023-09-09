  
module uart_tx #(parameter CLKS_PER_BIT = 208)
(
  input wire reset,
   input  wire      i_Clock,
   input  wire     i_Tx_DV,
   input wire [7:0] i_Tx_Byte, 
   output wire     o_Tx_Active,
   output reg  o_Tx_Serial,
   output wire o_Tx_busy,
   output wire     o_Tx_Done
   );
   
   
  
  localparam s_IDLE         = 3'b000;
  localparam s_TX_START_BIT = 3'b001;
  localparam s_TX_DATA_BITS = 3'b010;
  localparam s_TX_STOP_BIT  = 3'b011;
  localparam s_CLEANUP      = 3'b100;
   
  reg [2:0]    r_SM_Main     = 0;
  
  reg [2:0]    r_Bit_Index   = 0;
  reg [7:0]    r_Tx_Data     = 0;
  reg          r_Tx_Done     = 0;
  reg          r_Tx_Active   = 0;
  
 
     
reg clksPerBitStart = 'd0;
wire clksPerBit_0;
wire clksPerBit_1;
wire clksPerBit;
 shift_reg #(26)clksPerBit_0_inst0(i_Clock,clksPerBit_0,clksPerBitStart,1'b1,clksPerBit_0);
 shift_reg #(7)clksPerBit_1_inst1(clksPerBit_0,clksPerBit_1,clksPerBitStart,1'b1,clksPerBit_1);
assign clksPerBit = clksPerBit_0 & clksPerBit_1;
  
  always @(posedge i_Clock)
    begin
       
      case (r_SM_Main)
        s_IDLE :
          begin
            o_Tx_Serial   <= 1'b1;         
            r_Tx_Done     <= 1'b0;
            
            r_Bit_Index   <= 0;
             
            if (i_Tx_DV == 1'b1 && reset)
              begin
                r_Tx_Active <= 1'b1;
                r_Tx_Data   <= i_Tx_Byte;
                r_SM_Main   <= s_TX_START_BIT;
                clksPerBitStart <= 'd1;
              end
            else
              r_SM_Main <= s_IDLE;
          end 
         
         
        
        s_TX_START_BIT :
          begin
            o_Tx_Serial <= 1'b0;
             
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            if (clksPerBit)begin
                r_SM_Main     <= s_TX_DATA_BITS;
              end
            
            
            
          end 
         
         
        
        s_TX_DATA_BITS :
          begin
            
             
            
            
            
            
            
            
            
              
                 
            
            
            
            
            
            
            
                  
            
            o_Tx_Serial <= r_Tx_Data[r_Bit_Index];
            if (clksPerBit && r_Bit_Index < 7)begin
                r_Bit_Index <= r_Bit_Index + 1;
                
            end else if (clksPerBit)begin
                 
                r_Bit_Index <= 0;
                r_SM_Main   <= s_TX_STOP_BIT;
            end
            
            
            
            
            
            
            
            
            
                  
            
          end 
         
         
        
        s_TX_STOP_BIT :
          begin
            o_Tx_Serial <= 1'b1;
             
            
            
            
            
            
            
            
            
            
            
            
            
            
            if (clksPerBit)begin
              clksPerBitStart <= 'd0;
              r_Tx_Done     <= 1'b1;
              r_SM_Main     <= s_CLEANUP;
              r_Tx_Active   <= 1'b0;
            end 
          end 
         
         
        
        s_CLEANUP :
          begin
            r_Tx_Done <= 1'b1;
            r_SM_Main <= s_IDLE;
          end
         
         
        default :
          r_SM_Main <= s_IDLE;
         
      endcase
    end
 
  assign o_Tx_Active = r_Tx_Active;
  assign o_Tx_Done   = r_Tx_Done;
  assign o_Tx_busy  = r_Tx_Done | o_Tx_Active;
   
endmodule
