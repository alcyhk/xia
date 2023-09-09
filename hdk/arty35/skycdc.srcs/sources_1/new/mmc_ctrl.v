`timescale 1ns / 1ps
module mmc_ctrl(
    input wire clk    
    ,output wire C
    ,output wire MOSI
    ,input wire MISO
    ,output wire S
    
,input wire ROUTE_TS_84
,input wire [1:0]grid_mmc_act_rwi
,input wire grid_mmc_fifo_read_once
,input wire grid_mmc_fifo_write_once
,input wire [31:0]grid_mmc_addr
,output reg [31:0]grid_mmc_data_read = 'd0
,input wire [31:0]grid_mmc_data_write
,output reg grid_mmc_fifow_full = 'd0
,output reg grid_mmc_fifow_empty = 'd0
,output reg grid_mmc_fifor_full = 'd0
,output reg grid_mmc_fifor_empty = 'd0
,output reg grid_mmc_act_idle = 'd1
    );
    
               reg dummyCheck = 'd0;
reg req_mmc_idle = 0;
reg ack_mmc_idle = 0;
always@(*)begin
    if(req_mmc_idle == 0 && ack_mmc_idle == 0 && ROUTE_TS_84)begin
        req_mmc_idle <= 1;
    end else if(req_mmc_idle == 1 && ack_mmc_idle == 1)begin
        req_mmc_idle <= 0;
    end
end
always@(posedge clk)begin
    if(req_mmc_idle == 1 && ack_mmc_idle == 0)begin
        ack_mmc_idle <= 1;
    end else if(req_mmc_idle == 0 && ack_mmc_idle == 1)begin
        ack_mmc_idle <= 0;
    end
end
reg grid_mmc_fifo_read_once_r = 'd0; 
reg grid_mmc_fifo_write_once_r = 'd0; 
reg [1:0]grid_mmc_act_rwi_r = 'd0;
reg [31:0]grid_mmc_addr_r = 'd0;
reg [31:0]grid_mmc_data_read_r = 'd0;
reg [31:0]grid_mmc_data_write_r = 'd0;
always@(*)begin
    if(ack_mmc_idle)begin
        grid_mmc_fifo_read_once_r <= grid_mmc_fifo_read_once;
        grid_mmc_fifo_write_once_r <= grid_mmc_fifo_write_once;
        grid_mmc_fifow_full <= fifo_set_full;
        grid_mmc_fifow_empty <= fifo_set_empty;
        grid_mmc_fifor_full <= fifo_get_full;
        grid_mmc_fifor_empty <= fifo_get_empty;
        grid_mmc_act_rwi_r <= grid_mmc_act_rwi;
        grid_mmc_act_idle <= flagActIdle;
        grid_mmc_addr_r <= grid_mmc_addr;
    end
end
always@(*)begin
    if(ack_mmc_idle)begin
        grid_mmc_data_read <= grid_mmc_data_read_r;
        grid_mmc_data_write_r <= grid_mmc_data_write;
        
    end
end
`define TEST_WRITE
`ifdef TEST_WRITE
reg [3:0]MMC_FIFO_WRITE_COUNT = 'd0;
always@(posedge clk)begin
    if(grid_mmc_fifo_write_once_r && MMC_FIFO_WRITE_COUNT < 'd8)begin 
        MMC_FIFO_WRITE_COUNT <= MMC_FIFO_WRITE_COUNT + 'd1;   
    end else if(~grid_mmc_fifo_write_once_r)begin
        MMC_FIFO_WRITE_COUNT <= 'd0;        
    end 
end
always@(posedge clk)begin
    case(MMC_FIFO_WRITE_COUNT)
        1:  fifo_set_wr <= 'd1;
        3:  fifo_set_wr <= 'd1;
        5:  fifo_set_wr <= 'd1;
        7:  fifo_set_wr <= 'd1;
        default:    fifo_set_wr <= 'd0 ;
    endcase
end
always@(posedge clk)begin
    case(MMC_FIFO_WRITE_COUNT)
        1:  setData512Grid <= grid_mmc_data_write_r[31:24];
        3:  setData512Grid <= grid_mmc_data_write_r[23:16];
        5:  setData512Grid <= grid_mmc_data_write_r[15:8];
        7:  setData512Grid <= grid_mmc_data_write_r[7:0];
        default:  setData512Grid <= 'd0;
    endcase
end
`endif
`define TEST_READ
`ifdef TEST_READ
reg [3:0]MMC_FIFO_READ_COUNT = 'd0;
always@(posedge clk)begin
    if(grid_mmc_fifo_read_once_r && MMC_FIFO_READ_COUNT < 'd9)begin 
        MMC_FIFO_READ_COUNT <= MMC_FIFO_READ_COUNT + 'd1;   
    end else if(~grid_mmc_fifo_read_once_r)begin
        MMC_FIFO_READ_COUNT <= 'd0;        
    end 
end
always@(posedge clk)begin
    case(MMC_FIFO_READ_COUNT)
        1:  fifo_get_rd <= 'd1;
        3:  fifo_get_rd <= 'd1;
        5:  fifo_get_rd <= 'd1;
        7:  fifo_get_rd <= 'd1;
        default:    fifo_get_rd <= 'd0 ;
    endcase
end
always@(posedge clk)begin
    case(MMC_FIFO_READ_COUNT)
        3:  grid_mmc_data_read_r[31:24] <= getData512Grid;
        5:  grid_mmc_data_read_r[23:16] <= getData512Grid;
        7:  grid_mmc_data_read_r[15:8] <= getData512Grid;
        9:  grid_mmc_data_read_r[7:0] <= getData512Grid;
        default:;  
    endcase
end
`endif
wire fifo_get_full;
wire fifo_get_empty;
mmc_get_fifo mmc_get_fifo_inst(
    .rst(~flagMS),
    .clk(clk),
    .full(fifo_get_full),
    .empty(fifo_get_empty),
    .din(getData512Fifo),
    .dout(getData512Grid),
    .rd_en(fifo_get_rd),
    .wr_en(fifo_get_wr)
    );
reg [7:0]getData512Fifo = 'd0;
always@(negedge clk)begin
if(qspi_bit_count == 'd1)begin
    getData512Fifo <= getData512;
end
end
reg fifo_get_wr = 'd0;
always@(negedge clk)begin
if(stm_state == STM_GET_DATA && qspi_bit_count == 'd3 && ~fifo_get_full )begin
    if(count_get_data_bytes > 'd0 && count_get_data_bytes < 'h201)fifo_get_wr <= 'd1;
    
end else if(qspi_bit_count == 'd4)begin
    fifo_get_wr <= 'd0;
end
end
reg fifo_get_rd = 'd0;
wire [7:0]getData512Grid;
assign C = (SCK_R)?'b0:clk;
reg flagRead = 'd0;
reg MOSI_R = 'b1;
reg SCK_R = 'd1;
reg [1:0]qspi_state = 'd0;
localparam QSPI_IDLE = 'd0;
localparam QSPI_WRITE = 'd1;
localparam QSPI_READ = 'd2;
reg [3:0]qspi_bit_count = 'd0;
always@(negedge clk)begin
    if(qspi_bit_count < 'd8)qspi_bit_count <= qspi_bit_count + 'd1;
    else qspi_bit_count <= 'd0;
end
reg S_SET = 'd1;
assign S = S_SET;
assign MOSI = MOSI_R;
localparam CMD_WD_REG = 'hff;
localparam CMD_RD_REG = 'h00;
reg [7:0]cmd_wd_reg = CMD_WD_REG;
reg [7:0]cmd_rd_reg = 'd0;
reg flagStart = 'd0;
reg [3:0]stm_state = 'd0;
localparam STM_POWER_UP = 30;
localparam STM_RESET = 0;
localparam STM_LEAD = 1;
localparam STM_DISABLE_CRC = 2;
localparam STM_WAKE_NA = 3;
localparam STM_BKLEN = 4;
localparam STM_IDLE = 5;
localparam STM_READ = 6;
localparam STM_GET_DATA = 7;
localparam STM_WRITE = 8;
localparam STM_SET_DATA = 9;
localparam STM_WRITE_WAIT = 10;
localparam STM_WAKE_SDC = 11;
localparam STM_PRINT = 12;
localparam STM_SET_DUMMY_FOR_WRITE = 13;
localparam STM_NULL = 15;
localparam SIZE_CMD_BYTES       = 10;
localparam SIZE_DATA_BYTES       = 515;
reg flagMS = 'd0;
initial flagMS <= 'd0;
always@(posedge flagMS25000_3)begin 
flagMS <= 'd1;
end
wire flagMS25000_0;
wire flagMS25000_1;
wire flagMS25000_2;
wire flagMS25000_3;
 shift_reg #(16)flagMS25000_inst0(clk,flagMS25000_0,~flagMS,1'b1,flagMS25000_0);
 shift_reg #(16)flagMS25000_inst1(flagMS25000_0,flagMS25000_1,~flagMS,1'b1,flagMS25000_1);
 shift_reg #(16)flagMS25000_inst2(flagMS25000_1,flagMS25000_2,~flagMS,1'b1,flagMS25000_2);
 shift_reg #(8)flagMS25000_inst3(flagMS25000_2,flagMS25000_3,~flagMS,1'b1,flagMS25000_3);
reg [3:0]countRepeat = 'd0;
reg [6:0]countStart = 'd0;
reg [3:0]count_qspi_bytes = 'd0;
always@(negedge clk)begin
    if(flagMS)begin
    if(countStart < 'd80)countStart <= countStart + 'd1;
    else flagStart <= 'd1;
end
end
always @(negedge clk) begin
    if(qspi_bit_itr7)begin
        if(count_qspi_bytes == SIZE_CMD_BYTES)begin
            count_qspi_bytes <= 'd0;                
        end else if(count_qspi_bytes < SIZE_CMD_BYTES)begin
            count_qspi_bytes <= count_qspi_bytes + 'd1;
        end
    end 
end
reg [9:0]count_get_data_bytes = 'd0;
always @(negedge clk) begin
    if(qspi_bit_itr7 && stm_state == STM_GET_DATA && flagGetDataFE)begin
        if(count_get_data_bytes == SIZE_DATA_BYTES)begin
            
        end else if(count_get_data_bytes < SIZE_DATA_BYTES)begin
            count_get_data_bytes <= count_get_data_bytes + 'd1;
        end
    end else if(qspi_bit_itr7 && stm_state == STM_SET_DATA)begin
        if(count_get_data_bytes == SIZE_DATA_BYTES)begin
            
        end else if(count_get_data_bytes < SIZE_DATA_BYTES)begin
            count_get_data_bytes <= count_get_data_bytes + 'd1;
        end
    end else if(stm_state != STM_GET_DATA && stm_state != STM_SET_DATA)begin
            count_get_data_bytes <= 'd0;                
        
    end
end
reg flagGetDataFE = 'd0;
always @(negedge clk) begin
    if(stm_state == STM_GET_DATA)begin
        if(~MISO)flagGetDataFE <= 'd1;
    end else begin
        flagGetDataFE <= 'd0;
    end
end
reg [7:0]getData512 = 'd0;
always @(negedge clk) begin
    if(flagGetDataFE)begin
        if(qspi_bit_count > 'd0)getData512['d8-qspi_bit_count] <= MISO;
    end
end
localparam CMD_RESET = 'h40;
localparam CMD_ZERO  = 'h00;
localparam CMD_FF  = 'hff;
localparam CMD_CRC   = 'h95;
localparam CMD_CRC_FE   = 'hfe;
localparam CMD_CRC_FF   = 'hff;
localparam CMD_LEAD = 'h77;
localparam CMD_WAKE_NA = 'h69;
localparam CMD_WAKE_SDC = 'h41;
localparam CMD_CRC_WAKE_NA   = 'hf9;
localparam CMD_WAKE = 'h69;
localparam CMD_BKLEN = 'h50;
localparam CMD_READ = 'h51;
localparam CMD_CRC_READ   = 'h55;
localparam CMD_WRITE = 'h58;
localparam CMD_DISABLE_CRC   = 'h7b;
localparam CMD_CRC_CMD59   = 'h91;
wire qspi_bit_itr7;
shift_reg #(8)shift_qspi_bit_itr7_inst0(~clk,qspi_bit_itr7,flagStart,1'b1,qspi_bit_itr7);
always @(negedge clk) begin 
    if(flagStart)begin
    
        if (~qspi_bit_itr7)begin
            SCK_R <= 'd0;
        end else begin
            SCK_R <= 'd1;
        end
    end else if(flagMS)begin
            SCK_R <= 'd0;
    end 
end
always @(negedge clk) begin
    
    if(stm_state != STM_IDLE && stm_state != STM_SET_DUMMY_FOR_WRITE && stm_state != STM_PRINT && count_qspi_bytes == 'd0 && flagStart)begin
        S_SET <= 'd0;
    end else if( count_get_data_bytes == SIZE_DATA_BYTES)begin
        S_SET <= 'd1;
    end else if(count_qspi_bytes == SIZE_CMD_BYTES && stm_state != STM_GET_DATA && stm_state != STM_SET_DATA )begin
        S_SET <= 'd1;
    end
end
always @(negedge clk) begin
    if(stm_state == STM_POWER_UP && qspi_bit_itr7)begin
        
        
    end else if(stm_state == STM_RESET && qspi_bit_itr7)begin
        if(count_qspi_bytes == 'd0)begin
            cmd_wd_reg <= CMD_RESET;
        end else if(count_qspi_bytes == 'd1)begin
                cmd_wd_reg <= CMD_ZERO;
        end else if(count_qspi_bytes == 'd5)begin
                cmd_wd_reg <= CMD_CRC;
        end else if(count_qspi_bytes == 'd6)begin
            cmd_wd_reg <= CMD_FF;
        
        end
    end else if(stm_state == STM_WAKE_SDC && qspi_bit_itr7)begin
        if(count_qspi_bytes == 'd0)begin
           cmd_wd_reg <= CMD_WAKE_SDC;
        end else if(count_qspi_bytes == 'd1)begin
                cmd_wd_reg <= CMD_ZERO;
        end else if(count_qspi_bytes == 'd5)begin
                cmd_wd_reg <= 'hf9;
        end else if(count_qspi_bytes == 'd6)begin
            cmd_wd_reg <= CMD_FF;
        end
    end else if(stm_state == STM_WRITE && qspi_bit_itr7)begin
        if(count_qspi_bytes == 'd0)begin
            cmd_wd_reg <= CMD_WRITE;
        end else if(count_qspi_bytes == 'd1)begin
                
                cmd_wd_reg <= grid_mmc_addr_r[22:15];
        end else if(count_qspi_bytes == 'd2)begin
                
                cmd_wd_reg <= grid_mmc_addr_r[14:7];
        end else if(count_qspi_bytes == 'd3)begin
                
                cmd_wd_reg <= {grid_mmc_addr_r[6:0],1'b0};
        end else if(count_qspi_bytes == 'd4)begin
                
                cmd_wd_reg <= 'b0; 
        end else if(count_qspi_bytes == 'd5)begin
                
                cmd_wd_reg <= CMD_FF;
        end else if(count_qspi_bytes == 'd6)begin
            cmd_wd_reg <= CMD_FF;
        
        end
    end else if(stm_state == STM_SET_DATA && qspi_bit_itr7)begin
        
    end else if(stm_state == STM_WRITE_WAIT && qspi_bit_itr7)begin
        cmd_wd_reg <= CMD_FF;
    
    end else if(stm_state == STM_READ && qspi_bit_itr7)begin
        if(count_qspi_bytes == 'd0)begin
            cmd_wd_reg <= CMD_READ;
        end else if(count_qspi_bytes == 'd1)begin
                
                
                cmd_wd_reg <= grid_mmc_addr_r[22:15];
        end else if(count_qspi_bytes == 'd2)begin
                
                
                cmd_wd_reg <= grid_mmc_addr_r[14:7];
        end else if(count_qspi_bytes == 'd3)begin
                
                
                cmd_wd_reg <= {grid_mmc_addr_r[6:0],1'b0};
        end else if(count_qspi_bytes == 'd4)begin
                
                
                cmd_wd_reg <= 'b0; 
        end else if(count_qspi_bytes == 'd5)begin
                
                cmd_wd_reg <= CMD_FF;
        end else if(count_qspi_bytes == 'd6)begin
            cmd_wd_reg <= CMD_FF;
        
        end
    end else if(stm_state == STM_GET_DATA && qspi_bit_itr7)begin
            
    end
end
reg flagActIdle = 'd1;
always @(negedge clk) begin
    if(stm_state == STM_POWER_UP && qspi_bit_itr7)begin
        if(flagStart && count_qspi_bytes == SIZE_CMD_BYTES)stm_state <= STM_RESET;
    end else if(stm_state == STM_RESET && qspi_bit_itr7)begin
                
                
        if(count_qspi_bytes == SIZE_CMD_BYTES && cmd_rd_reg == 'h1 )begin
            stm_state <= STM_WAKE_SDC;
        end
        
    end else if(stm_state == STM_WAKE_SDC && qspi_bit_itr7)begin
       
        if(count_qspi_bytes == SIZE_CMD_BYTES && cmd_rd_reg == 'h0)begin
            
            stm_state <= STM_IDLE;
            
            
            
            
            
        end else if(count_qspi_bytes == SIZE_CMD_BYTES && cmd_rd_reg != 'h0)begin
            stm_state <= STM_WAKE_SDC;
        end
     end else if(stm_state == STM_SET_DUMMY_FOR_WRITE && qspi_bit_itr7)begin
        if(fifo_set_full)begin
            stm_state <= STM_WRITE;
        end
     end else if(stm_state == STM_WRITE && qspi_bit_itr7)begin
        
        
        if(count_qspi_bytes == SIZE_CMD_BYTES && cmd_rd_reg == 'h0)begin
            stm_state <= STM_SET_DATA;
        end else if(count_qspi_bytes == SIZE_CMD_BYTES && cmd_rd_reg != 'h0)begin
            stm_state <= STM_WRITE;
        end
        
    end else if(stm_state == STM_SET_DATA && qspi_bit_itr7)begin
        if(count_qspi_bytes == SIZE_CMD_BYTES && count_get_data_bytes == SIZE_DATA_BYTES)begin
            stm_state <= STM_WRITE_WAIT;
        end
    end else if(stm_state == STM_WRITE_WAIT && qspi_bit_itr7)begin
        if(count_qspi_bytes == SIZE_CMD_BYTES && flagWriteWait == 'hf)begin
            
            stm_state <= STM_IDLE;
        end
    end else if(stm_state == STM_READ && qspi_bit_itr7)begin
        
        
        if(count_qspi_bytes == SIZE_CMD_BYTES && cmd_rd_reg == 'h0)begin
            stm_state <= STM_GET_DATA;
        end else if(count_qspi_bytes == SIZE_CMD_BYTES && cmd_rd_reg != 'h0)begin
            stm_state <= STM_READ;
        end
    end else if(stm_state == STM_GET_DATA && qspi_bit_itr7)begin
        if(count_qspi_bytes == SIZE_CMD_BYTES && count_get_data_bytes == SIZE_DATA_BYTES)begin
            stm_state <= STM_IDLE;
        end
    end else if(stm_state == STM_PRINT && qspi_bit_itr7)begin
        if(fifo_get_empty)begin
            
        end
    end else if(stm_state == STM_IDLE && qspi_bit_itr7)begin
        `ifdef TEST_WRITE
            if(grid_mmc_act_rwi_r == 'd1 && flagActIdle)begin 
                stm_state <= STM_WRITE;
                flagActIdle <= 'd0;
            end else if(grid_mmc_act_rwi_r == 'd2  && flagActIdle)begin 
                stm_state <= STM_READ;
                flagActIdle <= 'd0;
                dummyCheck <= 'd1;
            end else if(grid_mmc_act_rwi_r == 'd0)begin
                flagActIdle <= 'd1;
               
            end
        `endif
        `ifndef TEST_WRITE stm_state <= STM_SET_DUMMY_FOR_WRITE;`endif
    end
end
reg [3:0]flagWriteWait = 'd0;
always @(negedge clk) begin
    if(stm_state == STM_WRITE_WAIT)begin
        
        
        
        
        
        
        if(MISO && flagWriteWait < 'hf)flagWriteWait <= flagWriteWait + 'd1;
    end else begin
        flagWriteWait <= 'd0;
    end
end
reg [7:0]setData512Grid = 'd0;
reg fifo_set_rd = 'd0;
reg fifo_set_wr = 'd0;
wire [7:0]setData512Fifo;
wire fifo_set_full;
wire fifo_set_empty;
mmc_get_fifo mmc_set_fifo_inst(
    .rst(~flagMS),
    .clk(clk),
    .full(fifo_set_full),
    .empty(fifo_set_empty),
    .din(setData512Grid),
    .dout(setData512Fifo),
    .rd_en(fifo_set_rd),
    .wr_en(fifo_set_wr)
    );
`ifndef TEST_WRITE
always@(negedge clk)begin
    if(stm_state == STM_SET_DUMMY_FOR_WRITE)begin
        if(~fifo_set_full && ~fifo_set_wr)begin
            fifo_set_wr <= 'd1;
        end else if(fifo_set_wr)begin
            fifo_set_wr <= 'd0;
            setData512Grid <= setData512Grid + 'd1;
        end
    end 
end
`endif
always@(negedge clk)begin
    
    if(stm_state == STM_SET_DATA  && count_get_data_bytes >= 'd0 && count_get_data_bytes < 'd512)begin
        if(qspi_bit_count == 'h7 && ~fifo_set_empty)fifo_set_rd <= 'd1;
        else if(qspi_bit_count == 'h8)fifo_set_rd <= 'd0;
    end 
end
reg [7:0] TMP_FE = 'hfe;
reg [7:0] TMP_AA = 'haa;
reg [7:0] TMP_FF = 'hff;
always@(negedge clk)begin
    
    if(stm_state == STM_SET_DATA  && count_get_data_bytes == 'd0)begin
        if(qspi_bit_count < 'h8)MOSI_R <= TMP_FE['d7 - qspi_bit_count]; 
    end else if(stm_state == STM_SET_DATA  && count_get_data_bytes > 'd0 && count_get_data_bytes < 'd513)begin
        
        if(qspi_bit_count < 'h8)MOSI_R <= setData512Fifo['d7 - qspi_bit_count]; 
    end else if(stm_state == STM_SET_DATA  && count_get_data_bytes >= 'd513 )begin
        if(qspi_bit_count < 'h8)MOSI_R <= TMP_FF['d7 - qspi_bit_count]; 
    end else begin
        if(qspi_bit_count < 'h8)MOSI_R <= cmd_wd_reg['d7 - qspi_bit_count]; 
    end
end
reg [7:0]misoFetch = 'd0;
reg [3:0]misoCount = 'd0;
reg flagMISO = 'd0;
always@(negedge clk)begin
        
     if(count_qspi_bytes > 'd5 && count_qspi_bytes < SIZE_CMD_BYTES)begin
        
        if(~MISO && ~flagMISO && misoCount == 'd0)begin
           flagMISO <= 'd1;
           misoFetch['d7 - misoCount] <= MISO;
           misoCount <= misoCount + 'd1;
        end else if(flagMISO && misoCount < 'd8)begin
           misoFetch['d7 - misoCount] <= MISO; 
           misoCount <= misoCount + 'd1;
        end else if(misoCount == 'd8)begin
            cmd_rd_reg <= misoFetch;
        end
       
    end else if(count_qspi_bytes == 'd5)begin
            flagMISO <= 'd0;
            misoCount <= 'd0;
            cmd_rd_reg <= 'hff;
    end
end
endmodule
