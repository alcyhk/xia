module spi
(
    input               I_clk       , 
    input               I_rx_en     , 
    input               I_tx_en     , 
    input        [7:0]  I_data_in   , 
    output  reg  [7:0]  O_data_out ='d0 , 
    output  reg         O_tx_done  ='d0 , 
    output  reg         O_rx_done  ='d0 , 
    
    input [1:0]I_grid_spi_cs,
    
    input               I_spi_miso  , 
    output  reg         O_spi_sck  = 'd0 , 
    output  reg         O_spi_cs0   = 'd1 , 
    output  reg         O_spi_cs1   = 'd1 , 
    output  reg         O_spi_cs2   = 'd1 , 
    output  reg         O_spi_mosi = 'd0   
);
reg [3:0]   R_tx_state = 'd0     ; 
reg [3:0]   R_rx_state = 'd0     ;
always @(posedge I_clk)
begin
    if(I_tx_en) 
        begin
            
            if(I_grid_spi_cs == 'd0)O_spi_cs0    <=  1'b0    ; 
            else if(I_grid_spi_cs == 'd1)O_spi_cs1    <=  1'b0    ; 
            else if(I_grid_spi_cs == 'd2)O_spi_cs2    <=  1'b0    ; 
            case(R_tx_state)
                4'd1, 4'd3 , 4'd5 , 4'd7  , 
                4'd9, 4'd11, 4'd13, 4'd15 : 
                    begin
                        O_spi_sck   <=  1'b1                ;
                        R_tx_state  <=  R_tx_state + 1'b1   ;
                        O_tx_done   <=  1'b0                ;
                    end
                4'd0:    
                    begin
                        O_spi_mosi  <=  I_data_in[7]        ;
                        
                        O_spi_sck   <=  1'b0                ;
                        R_tx_state  <=  R_tx_state + 1'b1   ;
                        O_tx_done   <=  1'b0                ;
                    end
                4'd2:    
                    begin
                        O_spi_mosi  <=  I_data_in[6]        ;
                        
                        O_spi_sck   <=  1'b0                ;
                        R_tx_state  <=  R_tx_state + 1'b1   ;
                        O_tx_done   <=  1'b0                ;
                    end
                4'd4:    
                    begin
                        O_spi_mosi  <=  I_data_in[5]        ;
                        
                       O_spi_sck   <=  1'b0                ;
                        R_tx_state  <=  R_tx_state + 1'b1   ;
                        O_tx_done   <=  1'b0                ;
                    end 
                4'd6:    
                    begin
                        O_spi_mosi  <=  I_data_in[4]        ;
                        
                        O_spi_sck   <=  1'b0                ;
                        R_tx_state  <=  R_tx_state + 1'b1   ;
                        O_tx_done   <=  1'b0                ;
                    end 
                4'd8:    
                    begin
                        O_spi_mosi  <=  I_data_in[3]        ;
                        
                       O_spi_sck   <=  1'b0                ;
                        R_tx_state  <=  R_tx_state + 1'b1   ;
                        O_tx_done   <=  1'b0                ;
                    end                            
                4'd10:    
                    begin
                        O_spi_mosi  <=  I_data_in[2]        ;
                        
                        O_spi_sck   <=  1'b0                ;
                        R_tx_state  <=  R_tx_state + 1'b1   ;
                        O_tx_done   <=  1'b0                ;
                    end 
                4'd12:    
                    begin
                        O_spi_mosi  <=  I_data_in[1]        ;
                        
                        O_spi_sck   <=  1'b0                ;
                        R_tx_state  <=  R_tx_state + 1'b1   ;
                        O_tx_done   <=  1'b0                ;
                    end 
                4'd14:    
                    begin
                        O_spi_mosi  <=  I_data_in[0]        ;
                        
                       O_spi_sck   <=  1'b0                ;
                        R_tx_state  <=  R_tx_state + 1'b1   ;
                        O_tx_done   <=  1'b1                ;
                    end
                default:R_tx_state  <=  4'd0                ;   
            endcase 
        end
    else if(I_rx_en) 
        begin
            
            if(I_grid_spi_cs == 'd0)O_spi_cs0    <=  1'b0    ; 
            else if(I_grid_spi_cs == 'd1)O_spi_cs1    <=  1'b0    ; 
            else if(I_grid_spi_cs == 'd2)O_spi_cs2    <=  1'b0    ; 
            case(R_rx_state)
                4'd0, 4'd2 , 4'd4 , 4'd6  , 
                4'd8, 4'd10, 4'd12, 4'd14 : 
                    begin
                        O_spi_sck   <=  1'b0                ;
                        R_rx_state  <=  R_rx_state + 1'b1   ;
                        O_rx_done   <=  1'b0                ;
                    end
                4'd1:    
                    begin                       
                        O_spi_sck       <=  1'b1                ;
                        R_rx_state      <=  R_rx_state + 1'b1   ;
                        O_rx_done       <=  1'b0                ;
                        O_data_out[7]   <=  I_spi_miso          ;   
                    end
                4'd3:    
                    begin
                        O_spi_sck       <=  1'b1                ;
                        R_rx_state      <=  R_rx_state + 1'b1   ;
                        O_rx_done       <=  1'b0                ;
                        O_data_out[6]   <=  I_spi_miso          ; 
                    end
                4'd5:    
                    begin
                        O_spi_sck       <=  1'b1                ;
                        R_rx_state      <=  R_rx_state + 1'b1   ;
                        O_rx_done       <=  1'b0                ;
                        O_data_out[5]   <=  I_spi_miso          ; 
                    end 
                4'd7:    
                    begin
                        O_spi_sck       <=  1'b1                ;
                        R_rx_state      <=  R_rx_state + 1'b1   ;
                        O_rx_done       <=  1'b0                ;
                        O_data_out[4]   <=  I_spi_miso          ; 
                    end 
                4'd9:    
                    begin
                        O_spi_sck       <=  1'b1                ;
                        R_rx_state      <=  R_rx_state + 1'b1   ;
                        O_rx_done       <=  1'b0                ;
                        O_data_out[3]   <=  I_spi_miso          ; 
                    end                            
                4'd11:    
                    begin
                        O_spi_sck       <=  1'b1                ;
                        R_rx_state      <=  R_rx_state + 1'b1   ;
                        O_rx_done       <=  1'b0                ;
                        O_data_out[2]   <=  I_spi_miso          ; 
                    end 
                4'd13:    
                    begin
                        O_spi_sck       <=  1'b1                ;
                        R_rx_state      <=  R_rx_state + 1'b1   ;
                        O_rx_done       <=  1'b0                ;
                        O_data_out[1]   <=  I_spi_miso          ; 
                    end 
                4'd15:    
                    begin
                        O_spi_sck       <=  1'b1                ;
                        R_rx_state      <=  R_rx_state + 1'b1   ;
                        O_rx_done       <=  1'b1                ;
                        O_data_out[0]   <=  I_spi_miso          ; 
                    end
                default:R_rx_state  <=  4'd0                    ;   
            endcase 
        end    
   else
       begin
           R_tx_state  <=  4'd0    ;
           R_rx_state  <=  4'd0    ;
           O_tx_done   <=  1'b0    ;
           O_rx_done   <=  1'b0    ;
           O_spi_cs0    <=  1'b1    ;
           O_spi_cs1    <=  1'b1    ;
           O_spi_cs2    <=  1'b1    ;
           O_spi_sck   <=  1'b0    ;
           O_spi_mosi  <=  1'b0    ;
           
       end      
        end
endmodule