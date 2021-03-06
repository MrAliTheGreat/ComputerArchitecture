`timescale 1ns/1ns
module Datapath(input [5:0] x , y , input[5:0] x_adder , input clk , rst , ldx , ldy , ldp , shift_y , shift_p , rst_p , output [6:0] output_y , output [10:0] result);
  wire [5:0] out_x , in_p;
  wire [11:0] out_p;
  Register_6_bit x_reg(clk , rst , ldx , x , out_x);
  Register_6_multiplier y_reg(clk , rst , ldy , shift_y , y , output_y);
  Adder_6_bit adder(x_adder , out_p[11:6] , in_p);
  Shift_register_12_bit p_reg(clk , rst_p , ldp , shift_p , x_adder[5] , in_p , out_p);
  assign result = out_p[10:0];
endmodule
