`timescale 1ns / 1ps
module Arithmetic(
    input wire clkCalc,
    input wire ROUTE_TS_70,
    input wire [31:0]GRID_ARITH_0A,
    input wire [31:0]GRID_ARITH_0B,
    input wire [31:0]GRID_CALC_SELECT0,
    output reg [31:0]GRID_ARITH_0C
       
    );
`include "param.vh"    
reg req_arith_op = 0;
reg ack_arith_op = 0;
always@(*)begin
    if(req_arith_op == 0 && ack_arith_op == 0 && ROUTE_TS_70)begin
        req_arith_op <= 1;
    end else if(req_arith_op == 1 && ack_arith_op == 1)begin
        req_arith_op <= 0;
    end
end
always@(posedge clkCalc)begin
    if(req_arith_op == 1 && ack_arith_op == 0)begin
        ack_arith_op <= 1;
    end else if(req_arith_op == 0 && ack_arith_op == 1)begin
        ack_arith_op <= 0;
    end
end
     reg [31:0]grid_calc_select0 = 'd0;
     reg [31:0]grid_arith_0a = 'd0;
     reg [31:0]grid_arith_0b = 'd0;
     reg [31:0]grid_arith_0c = 'd0;
always@(*)begin
    if(ack_arith_op)begin
         grid_calc_select0 <= GRID_CALC_SELECT0;
         grid_arith_0a <= GRID_ARITH_0A;
         grid_arith_0b <= GRID_ARITH_0B;
         
         
         
          
          
          
         GRID_ARITH_0C <= grid_arith_0c;
    end
 end
wire mask_and_flag;
assign mask_and_flag = (grid_calc_select0 == PARA_SELECT_MASK_AND)?'d1:'d0;
wire mask_or_flag;
assign mask_or_flag = (grid_calc_select0 == PARA_SELECT_MASK_OR)?'d1:'d0;
wire shift_left_flag;
assign shift_left_flag = (grid_calc_select0 == PARA_SELECT_SHIFT_LEFT)?'d1:'d0;
wire shift_right_flag;
assign shift_right_flag = (grid_calc_select0 == PARA_SELECT_SHIFT_RIGHT)?'d1:'d0;
always@(*)begin
 case(grid_calc_select0)
            PARA_SELECT_MASK_AND: begin
              
                mask_and_a <= grid_arith_0a;
                mask_and_b <= grid_arith_0b;
                grid_arith_0c <= mask_and_c;
            end
            PARA_SELECT_MASK_OR: begin
                mask_or_a <= grid_arith_0a;
                mask_or_b <= grid_arith_0b;
                grid_arith_0c <= mask_or_c;
            end
            PARA_SELECT_SHIFT_LEFT: begin
                shift_left_a <= grid_arith_0a;
                shift_left_b <= grid_arith_0b;
                grid_arith_0c <= shift_left_c;
            end
            PARA_SELECT_SHIFT_RIGHT: begin
                shift_right_a <= grid_arith_0a;
                shift_right_b <= grid_arith_0b;
                grid_arith_0c <= shift_right_c;
            end
            PARA_SELECT_ARITH_SUB:  grid_arith_0c <= grid_arith_0a - grid_arith_0b;
            PARA_SELECT_LOGIC_EQUAL:  grid_arith_0c <= (grid_arith_0a == grid_arith_0b)?1:0;
            PARA_SELECT_ARITH_ADD:  grid_arith_0c <= grid_arith_0a + grid_arith_0b;
            
            
            
            
            
            
            PARA_SELECT_LOGIC_GREATER:  grid_arith_0c <= (grid_arith_0a > grid_arith_0b)?1:0;
            PARA_SELECT_LOGIC_SMALLER:  grid_arith_0c <= (grid_arith_0a < grid_arith_0b)?1:0;
            
            
            
            PARA_SELECT_LOGIC_AND:  grid_arith_0c <= (grid_arith_0a[0] && grid_arith_0b[0])?1:0;
            PARA_SELECT_LOGIC_OR:  grid_arith_0c <= (grid_arith_0a[0] || grid_arith_0b[0])?1:0;
            
            PARA_SELECT_ARITH_MUL: begin
             
             mul_input_a <= grid_arith_0a;
             mul_input_b <= grid_arith_0b;
             grid_arith_0c <= mul_output_c;
            end
            PARA_SELECT_ARITH_DIV:begin
                grid_arith_0c <= div_output_c[63:32];
                div_input_a <= grid_arith_0a;
                div_input_b <= grid_arith_0b;
                
            end
            PARA_SELECT_ARITH_MOD:begin
                grid_arith_0c <= div_output_c[31:0];
                div_input_a <= grid_arith_0a;
                div_input_b <= grid_arith_0b;
                
            end
`ifdef ARITH_FLOAT
            PARA_SELECT_FLOAT_I2F: begin
                float_i2f_input <= grid_arith_0a;
                grid_arith_0c <= float_i2f_output;
            end
            PARA_SELECT_FLOAT_F2I: begin
                float_f2i_input <= grid_arith_0a;
                grid_arith_0c <= float_f2i_output;
            end
            
            
            
            
            
            PARA_SELECT_FLOAT_ADD: begin
                float_add_sub_s <= 'd0;
                float_add_sub_a <= grid_arith_0a;
                float_add_sub_b <= grid_arith_0b;
                grid_arith_0c <= float_add_sub_c;
            end
            PARA_SELECT_FLOAT_SUB: begin
                float_add_sub_s <= 'd1;
                float_add_sub_a <= grid_arith_0a;
                float_add_sub_b <= grid_arith_0b;
                grid_arith_0c <= float_add_sub_c;
            end
            PARA_SELECT_FLOAT_MUL: begin
                float_mul_a <= grid_arith_0a;
                float_mul_b <= grid_arith_0b;
                grid_arith_0c <= float_mul_c;
            end
            PARA_SELECT_FLOAT_DIV: begin
                float_div_a <= grid_arith_0a;
                float_div_b <= grid_arith_0b;
                grid_arith_0c <= float_div_c;
            end
            PARA_SELECT_FLOAT_SQRT: begin
                float_sqrt_input <= grid_arith_0a;
                grid_arith_0c <= float_sqrt_output;
            end
            PARA_SELECT_FLOAT_LOG: begin
                float_log_input <= grid_arith_0a;
                grid_arith_0c <= float_log_output;
            end
            PARA_SELECT_FLOAT_EXP: begin
                float_exp_input <= grid_arith_0a;
                grid_arith_0c <= float_exp_output;
            end
            PARA_SELECT_FLOAT_CMP_UNORDERD: begin
                float_cmp_s <= 'b000100;
        
                float_cmp_a <= grid_arith_0a;
                float_cmp_b <= grid_arith_0b;
                grid_arith_0c <= {24'b0,float_cmp_c};
            end
            PARA_SELECT_FLOAT_CMP_LESS: begin
                float_cmp_s <= 'b000100;
                float_cmp_a <= grid_arith_0a;
                float_cmp_b <= grid_arith_0b;
                grid_arith_0c <= {24'b0,float_cmp_c};
            end
            PARA_SELECT_FLOAT_CMP_EQUAL: begin
                float_cmp_s <= 'b010100;
                float_cmp_a <= grid_arith_0a;
                float_cmp_b <= grid_arith_0b;
                grid_arith_0c <= {24'b0,float_cmp_c};
            end
            PARA_SELECT_FLOAT_CMP_LESS_OR_EQUAL: begin
                float_cmp_s <= 'b011100;
                float_cmp_a <= grid_arith_0a;
                float_cmp_b <= grid_arith_0b;
                grid_arith_0c <= {24'b0,float_cmp_c};
            end
            PARA_SELECT_FLOAT_CMP_GREATER: begin
                float_cmp_s <= 'b100100;
                float_cmp_a <= grid_arith_0a;
                float_cmp_b <= grid_arith_0b;
                grid_arith_0c <= {24'b0,float_cmp_c};
            end
            PARA_SELECT_FLOAT_CMP_NOT: begin
                float_cmp_s <= 'b101100;
                float_cmp_a <= grid_arith_0a;
                float_cmp_b <= grid_arith_0b;
                grid_arith_0c <= {24'b0,float_cmp_c};
            end
            PARA_SELECT_FLOAT_CMP_GREATER_OR_EQUAL: begin
                float_cmp_s <= 'b110100;
                float_cmp_a <= grid_arith_0a;
                float_cmp_b <= grid_arith_0b;
                grid_arith_0c <= {24'b0,float_cmp_c};
            end
`endif
`ifdef ARITH_CORDIC
            PARA_SELECT_CORDIC_SIN:begin
                cordic_sin_cos_input <= grid_arith_0a;
                grid_arith_0c <= cordic_sin_cos_output[63:32];
            end   
            PARA_SELECT_CORDIC_COS:begin
                cordic_sin_cos_input <= grid_arith_0a;
                grid_arith_0c <= cordic_sin_cos_output[31:0];
            end             
    
            PARA_SELECT_CORDIC_ATANH: begin
                cordic_atanh_input_yx <= {grid_arith_0a,grid_arith_0b};
                grid_arith_0c <= cordic_atanh_output;
            end
            PARA_SELECT_CORDIC_ATAN: begin
                cordic_atan_input_yx <= {grid_arith_0a,grid_arith_0b};
                grid_arith_0c <= cordic_atan_output;
            end
`endif
            default:    grid_arith_0c <= 32'h0 ;
        endcase
end
wire arith_div_flag;
wire arith_mod_flag;
wire arith_div_mod_flag;
assign arith_div_flag = (grid_calc_select0 == PARA_SELECT_ARITH_DIV)?'d1:0;
assign arith_mod_flag = (grid_calc_select0 == PARA_SELECT_ARITH_MOD)?'d1:0;
assign arith_div_mod_flag = {arith_div_flag|arith_mod_flag};
`ifdef ARITH_CORDIC
wire cordic_sin_flag;
wire cordic_cos_flag;
wire cordic_sin_cos_flag;
wire cordic_sin_cos_clk;
wire cordic_sinh_flag;
wire cordic_cosh_flag;
wire cordic_sinh_cosh_flag;
wire cordic_sinh_cosh_clk;
wire cordic_atanh_flag;
wire cordic_atan_flag;
wire cordic_atanh_clk;
wire cordic_atan_clk;
assign cordic_sin_flag = (grid_calc_select0 == PARA_SELECT_CORDIC_SIN)?'d1:0;
assign cordic_cos_flag = (grid_calc_select0 == PARA_SELECT_CORDIC_COS)?'d1:0;
assign cordic_sin_cos_flag = {cordic_sin_flag | cordic_cos_flag};
assign cordic_sin_cos_clk = (cordic_sin_cos_flag)?clkCalc:'d0;
assign cordic_sinh_flag = (grid_calc_select0 == PARA_SELECT_CORDIC_SINH)?'d1:0;
assign cordic_cosh_flag = (grid_calc_select0 == PARA_SELECT_CORDIC_COSH)?'d1:0;
assign cordic_sinh_cosh_flag = {cordic_sinh_flag | cordic_cosh_flag};
assign cordic_sinh_cosh_clk = (cordic_sinh_cosh_flag)?clkCalc:'d0;
assign cordic_atanh_flag = (grid_calc_select0 == PARA_SELECT_CORDIC_ATANH)?'d1:0;
assign cordic_atan_flag = (grid_calc_select0 == PARA_SELECT_CORDIC_ATAN)?'d1:0;
assign cordic_atan_clk = (cordic_atan_flag)?clkCalc:'d0;
assign cordic_atanh_clk = (cordic_atanh_flag)?clkCalc:'d0;
reg [31:0]cordic_sin_cos_input = 'd0;
wire [63:0]cordic_sin_cos_output;
cordic_sin_cos sin_cos_inst(
     .s_axis_phase_tdata(cordic_sin_cos_input)
    ,.s_axis_phase_tvalid(cordic_sin_cos_flag)
    
     ,.m_axis_dout_tdata(cordic_sin_cos_output)
    
    ,.aclk(cordic_sin_cos_clk)
    
);
reg [31:0]cordic_sinh_cosh_input = 'd0;
wire [63:0]cordic_sinh_cosh_output;
cordic_sinh_cosh sinh_cosh_inst(
     .s_axis_phase_tdata(cordic_sinh_cosh_input)
    ,.s_axis_phase_tvalid(cordic_sinh_cosh_flag)
    ,.m_axis_dout_tdata(cordic_sinh_cosh_output)
    ,.aclk(cordic_sinh_cosh_clk)
);
reg [63:0]cordic_atanh_input_yx = 'd0;
wire [31:0]cordic_atanh_output;
wire cordic_atanh_output_valid;
wire cordic_atanh_input_ready;
cordic_atanh atanh_inst(
    .s_axis_cartesian_tdata(cordic_atanh_input_yx)
    ,.s_axis_cartesian_tvalid(cordic_atanh_flag)
    ,.s_axis_cartesian_tready(cordic_atanh_input_ready)
    ,.m_axis_dout_tdata(cordic_atanh_output)
    ,.m_axis_dout_tvalid(cordic_atanh_output_valid)
    ,.aclk(cordic_atanh_clk)
);
    reg [63:0]cordic_atan_input_yx = 'd0;
    
wire [31:0]cordic_atan_output;
wire cordic_atan_output_valid;
wire cordic_atan_input_ready;
cordic_atan atan_inst(
    .s_axis_cartesian_tdata(cordic_atan_input_yx)
    ,.s_axis_cartesian_tvalid(cordic_atan_flag)
    ,.s_axis_cartesian_tready(cordic_atan_input_ready)
    ,.m_axis_dout_tdata(cordic_atan_output)
    ,.m_axis_dout_tvalid(cordic_atan_output_valid)
    ,.aclk(cordic_atan_clk)
    );
`endif
`ifdef ARITH_FLOAT
wire float_i2f_flag;
wire float_f2i_flag;
wire float_add_flag;
wire float_sub_flag;
wire float_add_sub_flag;
wire float_mul_flag;
wire float_div_flag;
wire float_sqrt_flag;
wire float_log_flag;
wire float_cmp_all_flag;
wire float_cmp_not_flag;
wire float_cmp_less_flag;
wire float_cmp_lessE_flag;
wire float_cmp_equal_flag;
wire float_cmp_greater_flag;
wire float_cmp_greaterE_flag;
wire float_cmp_unorder_flag;
wire float_exp_flag;
assign float_i2f_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_I2F)?'d1:0;
assign float_f2i_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_F2I)?'d1:0;
assign float_add_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_ADD)?'d1:0;
assign float_sub_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_SUB)?'d1:0;
assign float_add_sub_flag = {float_add_flag|float_sub_flag};
assign float_mul_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_MUL)?'d1:0;
assign float_div_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_DIV)?'d1:0;
assign float_sqrt_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_SQRT)?'d1:0;
assign float_log_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_LOG)?'d1:0;
assign float_cmp_not_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_CMP_NOT)?'d1:0;
assign float_cmp_less_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_CMP_LESS)?'d1:0;
assign float_cmp_lessE_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_CMP_LESS_OR_EQUAL)?'d1:0;
assign float_cmp_equal_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_CMP_EQUAL)?'d1:0;
assign float_cmp_greater_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_CMP_GREATER)?'d1:0;
assign float_cmp_greaterE_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_CMP_GREATER_OR_EQUAL)?'d1:0;
assign float_cmp_unorder_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_CMP_UNORDERD)?'d1:0;
assign float_cmp_all_flag = {float_cmp_not_flag|float_cmp_less_flag|float_cmp_lessE_flag|float_cmp_equal_flag|float_cmp_greater_flag|float_cmp_greaterE_flag|float_cmp_unorder_flag};
assign float_exp_flag = (grid_calc_select0 == PARA_SELECT_FLOAT_EXP)?'d1:0;
reg [31:0]float_i2f_input = 'd0;
wire [31:0]float_i2f_output;
wire float_i2f_output_valid;
wire float_i2f_input_ready;
reg float_i2f_input_valid = 'd0;
wire float_i2f_clk;
assign float_i2f_clk = (float_i2f_flag)?clkCalc:'d0;
float_i2f float_i2f_inst(
    .s_axis_a_tdata(float_i2f_input)
    
    ,.s_axis_a_tvalid(float_i2f_flag)
    ,.s_axis_a_tready(float_i2f_input_ready)
    ,.m_axis_result_tdata(float_i2f_output)
    
    ,.m_axis_result_tvalid(float_i2f_output_valid)
    ,.aclk(float_i2f_clk)
    );
reg [31:0]float_f2i_input = 'd0;
wire [31:0]float_f2i_output;
wire float_f2i_output_valid;
wire float_f2i_input_ready;
wire float_f2i_clk;
assign float_f2i_clk = (float_f2i_flag)?clkCalc:'d0;
float_f2i float_f2i_inst(
    .s_axis_a_tdata(float_f2i_input)
    ,.s_axis_a_tvalid(float_f2i_flag)
    ,.s_axis_a_tready(float_f2i_input_ready)
    ,.m_axis_result_tdata(float_f2i_output)
    
    ,.m_axis_result_tvalid(float_f2i_output_valid)
    ,.aclk(float_f2i_clk)
    );
reg [31:0]float_add_sub_a = 'd0;
reg [31:0]float_add_sub_b = 'd0;
reg [7:0]float_add_sub_s = 'd0;
wire [31:0]float_add_sub_c;
wire float_add_sub_c_valid;
wire float_add_sub_a_ready;
wire float_add_sub_b_ready;
wire float_add_sub_s_ready;
wire float_add_sub_clk;
assign float_add_sub_clk = (float_add_sub_flag)?clkCalc:'d0;
float_add_sub float_add_sub_inst(
    .s_axis_a_tdata(float_add_sub_a)
    ,.s_axis_a_tvalid(float_add_sub_flag)
    ,.s_axis_a_tready(float_add_sub_a_ready)
    ,.s_axis_b_tdata(float_add_sub_b)
    ,.s_axis_b_tvalid(float_add_sub_flag)
    ,.s_axis_b_tready(float_add_sub_b_ready)
    ,.s_axis_operation_tdata(float_add_sub_s)
    ,.s_axis_operation_tvalid(float_add_sub_flag)
    ,.s_axis_operation_tready(float_add_sub_s_ready)
    ,.m_axis_result_tdata(float_add_sub_c)
    
    ,.m_axis_result_tvalid(float_add_sub_c_valid)
    ,.aclk(float_add_sub_clk)
    );
reg [31:0]float_mul_a = 'd0;
reg [31:0]float_mul_b = 'd0;
wire [31:0]float_mul_c;
wire float_mul_c_valid;
wire float_mul_a_ready;
wire float_mul_b_ready;
wire float_mul_c_ready;
wire float_mul_clk;
assign float_mul_clk = (float_mul_flag)?clkCalc:'d0;
float_mul float_mul_inst(
    .s_axis_a_tdata(float_mul_a)
    ,.s_axis_a_tvalid(float_mul_flag)
    ,.s_axis_a_tready(float_mul_a_ready)
    ,.s_axis_b_tdata(float_mul_b)
    ,.s_axis_b_tvalid(float_mul_flag)
    ,.s_axis_b_tready(float_mul_b_ready)
    ,.m_axis_result_tdata(float_mul_c)
    
    ,.m_axis_result_tvalid(float_mul_c_valid)
    ,.aclk(float_mul_clk)
    );
reg [31:0]float_div_a = 'd0;
reg [31:0]float_div_b = 'd0;
wire [31:0]float_div_c;
wire float_div_c_valid;
wire float_div_a_ready;
wire float_div_b_ready;
wire float_div_c_ready;
wire float_div_clk;
assign float_div_clk = (float_div_flag)?clkCalc:'d0;
float_div float_div_inst(
    .s_axis_a_tdata(float_div_a)
    ,.s_axis_a_tvalid(float_div_flag)
    ,.s_axis_a_tready(float_div_a_ready)
    ,.s_axis_b_tdata(float_div_b)
    ,.s_axis_b_tvalid(float_div_flag)
    ,.s_axis_b_tready(float_div_b_ready)
    ,.m_axis_result_tdata(float_div_c)
    
    ,.m_axis_result_tvalid(float_div_c_valid)
    ,.aclk(float_div_clk)
    );
reg [31:0]float_sqrt_input = 'd0;
wire [31:0]float_sqrt_output;
wire float_sqrt_output_valid;
wire float_sqrt_input_ready;
wire float_sqrt_clk;
assign float_sqrt_clk = (float_sqrt_flag)?clkCalc:'d0;
float_sqrt float_sqrt_inst(
    .s_axis_a_tdata(float_sqrt_input)
    ,.s_axis_a_tvalid(float_sqrt_flag)
    ,.s_axis_a_tready(float_sqrt_input_ready)
    ,.m_axis_result_tdata(float_sqrt_output)
    
    ,.m_axis_result_tvalid(float_sqrt_output_valid)
    ,.aclk(float_sqrt_clk)
    );
reg [31:0]float_log_input = 'd0;
wire [31:0]float_log_output;
wire float_log_output_valid;
wire float_log_input_ready;
wire float_log_clk;
assign float_log_clk = (float_log_flag)?clkCalc:'d0;
float_log float_log_inst(
    .s_axis_a_tdata(float_log_input)
    ,.s_axis_a_tvalid(float_log_flag)
    ,.s_axis_a_tready(float_log_input_ready)
    ,.m_axis_result_tdata(float_log_output)
    
    ,.m_axis_result_tvalid(float_log_output_valid)
    ,.aclk(float_log_clk)
    );
reg [31:0]float_exp_input = 'd0;
wire [31:0]float_exp_output;
wire float_exp_output_valid;
wire float_exp_input_ready;
wire float_exp_clk;
assign float_exp_clk = (float_exp_flag)?clkCalc:'d0;
float_exp float_exp_inst(
    .s_axis_a_tdata(float_exp_input)
    ,.s_axis_a_tvalid(float_exp_flag)
    ,.s_axis_a_tready(float_exp_input_ready)
    ,.m_axis_result_tdata(float_exp_output)
    ,.m_axis_result_tvalid(float_exp_output_valid)
    ,.aclk(float_exp_clk)
    );
reg [31:0]float_cmp_a = 'd0;
reg [31:0]float_cmp_b = 'd0;
reg [7:0]float_cmp_s = 'd0;
wire [7:0]float_cmp_c;
wire float_cmp_c_valid;
wire float_cmp_a_ready;
wire float_cmp_b_ready;
wire float_cmp_s_ready;
wire float_cmp_all_clk;
assign float_cmp_all_clk = (float_cmp_all_flag)?clkCalc:'d0;
float_cmp float_cmp_inst(
    .s_axis_a_tdata(float_cmp_a)
    ,.s_axis_a_tvalid(float_cmp_all_flag)
    ,.s_axis_a_tready(float_cmp_a_ready)
    ,.s_axis_b_tdata(float_cmp_b)
    ,.s_axis_b_tvalid(float_cmp_all_flag)
    ,.s_axis_b_tready(float_cmp_b_ready)
    ,.s_axis_operation_tdata(float_cmp_s)
    ,.s_axis_operation_tvalid(float_cmp_all_flag)
    ,.s_axis_operation_tready(float_cmp_s_ready)
    ,.m_axis_result_tdata(float_cmp_c)
    
    ,.m_axis_result_tvalid(float_cmp_c_valid)
    ,.aclk(float_cmp_all_clk)
    );
`endif
wire multiplier_flag;
assign multiplier_flag = (grid_calc_select0 == PARA_SELECT_ARITH_MUL)?'d1:'d0;
wire multiplier_clk = (multiplier_flag)?clkCalc:'d0;
reg [31:0]mul_input_a = 'd0;
reg [31:0]mul_input_b = 'd0;
wire [31:0]mul_output_c;
multiplier multiplier_inst(
    .A(mul_input_a),
    .B(mul_input_b),
    .CLK(multiplier_clk),
    .P(mul_output_c)
    );
wire arith_div_clk;
assign arith_div_clk = (arith_div_mod_flag)?clkCalc:'d0;
reg [31:0]div_input_a = 'd0;
reg [31:0]div_input_b = 'd0;
wire [63:0]div_output_c;
divider divider_inst(
    .aclk(arith_div_clk), 
    .s_axis_divisor_tvalid(arith_div_mod_flag),
    .s_axis_dividend_tvalid(arith_div_mod_flag),
    .s_axis_dividend_tdata(div_input_a),
    .s_axis_divisor_tdata(div_input_b),
    .m_axis_dout_tdata(div_output_c)
);
reg [31:0]mask_and_a = 'd0;
reg [31:0]mask_and_b = 'd0;
reg [31:0]mask_and_c = 'd0;
always@(*)begin
    if(mask_and_flag)begin
        mask_and_c[0] <= mask_and_a[0] & mask_and_b[0];
        mask_and_c[1] <= mask_and_a[1] & mask_and_b[1];
        mask_and_c[2] <= mask_and_a[2] & mask_and_b[2];
        mask_and_c[3] <= mask_and_a[3] & mask_and_b[3];
        mask_and_c[4] <= mask_and_a[4] & mask_and_b[4];
        mask_and_c[5] <= mask_and_a[5] & mask_and_b[5];
        mask_and_c[6] <= mask_and_a[6] & mask_and_b[6];
        mask_and_c[7] <= mask_and_a[7] & mask_and_b[7];
        mask_and_c[8] <= mask_and_a[8] & mask_and_b[8];
        mask_and_c[9] <= mask_and_a[9] & mask_and_b[9];
        mask_and_c[10] <= mask_and_a[10] & mask_and_b[10];
        mask_and_c[11] <= mask_and_a[11] & mask_and_b[11];
        mask_and_c[12] <= mask_and_a[12] & mask_and_b[12];
        mask_and_c[13] <= mask_and_a[13] & mask_and_b[13];
        mask_and_c[14] <= mask_and_a[14] & mask_and_b[14];
        mask_and_c[15] <= mask_and_a[15] & mask_and_b[15];
        mask_and_c[16] <= mask_and_a[16] & mask_and_b[16];
        mask_and_c[17] <= mask_and_a[17] & mask_and_b[17];
        mask_and_c[18] <= mask_and_a[18] & mask_and_b[18];
        mask_and_c[19] <= mask_and_a[19] & mask_and_b[19];
        mask_and_c[20] <= mask_and_a[20] & mask_and_b[20];
        mask_and_c[21] <= mask_and_a[21] & mask_and_b[21];
        mask_and_c[22] <= mask_and_a[22] & mask_and_b[22];
        mask_and_c[23] <= mask_and_a[23] & mask_and_b[23];
        mask_and_c[24] <= mask_and_a[24] & mask_and_b[24];
        mask_and_c[25] <= mask_and_a[25] & mask_and_b[25];
        mask_and_c[26] <= mask_and_a[26] & mask_and_b[26];
        mask_and_c[27] <= mask_and_a[27] & mask_and_b[27];
        mask_and_c[28] <= mask_and_a[28] & mask_and_b[28];
        mask_and_c[29] <= mask_and_a[29] & mask_and_b[29];
        mask_and_c[30] <= mask_and_a[30] & mask_and_b[30];
        mask_and_c[31] <= mask_and_a[31] & mask_and_b[31];
    end
end
reg [31:0]mask_or_a = 'd0;
reg [31:0]mask_or_b = 'd0;
reg [31:0]mask_or_c = 'd0;
always@(*)begin
    if(mask_or_flag)begin
        mask_or_c[0] <= mask_or_a[0] | mask_or_b[0];
        mask_or_c[1] <= mask_or_a[1] | mask_or_b[1];
        mask_or_c[2] <= mask_or_a[2] | mask_or_b[2];
        mask_or_c[3] <= mask_or_a[3] | mask_or_b[3];
        mask_or_c[4] <= mask_or_a[4] | mask_or_b[4];
        mask_or_c[5] <= mask_or_a[5] | mask_or_b[5];
        mask_or_c[6] <= mask_or_a[6] | mask_or_b[6];
        mask_or_c[7] <= mask_or_a[7] | mask_or_b[7];
        mask_or_c[8] <= mask_or_a[8] | mask_or_b[8];
        mask_or_c[9] <= mask_or_a[9] | mask_or_b[9];
        mask_or_c[10] <= mask_or_a[10] | mask_or_b[10];
        mask_or_c[11] <= mask_or_a[11] | mask_or_b[11];
        mask_or_c[12] <= mask_or_a[12] | mask_or_b[12];
        mask_or_c[13] <= mask_or_a[13] | mask_or_b[13];
        mask_or_c[14] <= mask_or_a[14] | mask_or_b[14];
        mask_or_c[15] <= mask_or_a[15] | mask_or_b[15];
        mask_or_c[16] <= mask_or_a[16] | mask_or_b[16];
        mask_or_c[17] <= mask_or_a[17] | mask_or_b[17];
        mask_or_c[18] <= mask_or_a[18] | mask_or_b[18];
        mask_or_c[19] <= mask_or_a[19] | mask_or_b[19];
        mask_or_c[20] <= mask_or_a[20] | mask_or_b[20];
        mask_or_c[21] <= mask_or_a[21] | mask_or_b[21];
        mask_or_c[22] <= mask_or_a[22] | mask_or_b[22];
        mask_or_c[23] <= mask_or_a[23] | mask_or_b[23];
        mask_or_c[24] <= mask_or_a[24] | mask_or_b[24];
        mask_or_c[25] <= mask_or_a[25] | mask_or_b[25];
        mask_or_c[26] <= mask_or_a[26] | mask_or_b[26];
        mask_or_c[27] <= mask_or_a[27] | mask_or_b[27];
        mask_or_c[28] <= mask_or_a[28] | mask_or_b[28];
        mask_or_c[29] <= mask_or_a[29] | mask_or_b[29];
        mask_or_c[30] <= mask_or_a[30] | mask_or_b[30];
        mask_or_c[31] <= mask_or_a[31] | mask_or_b[31];
    end
end
reg [31:0]shift_left_a = 'd0;
reg [31:0]shift_left_b = 'd0;
reg [31:0]shift_left_c = 'd0;
always@(*)begin
    if(shift_left_flag)begin
        shift_left_c <= shift_left_a << shift_left_b;
    end
end
reg [31:0]shift_right_a = 'd0;
reg [31:0]shift_right_b = 'd0;
reg [31:0]shift_right_c = 'd0;
always@(*)begin
    if(shift_right_flag)begin
        shift_right_c <= shift_right_a << shift_right_b;
    end
end
endmodule
