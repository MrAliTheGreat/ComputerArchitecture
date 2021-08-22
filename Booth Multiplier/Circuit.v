`timescale 1ns/1ns
module Circuit(input[5:0] x , y , input clk , rst , start , output ready , output[10:0] result);
  wire ldx , ldy , ldp , shift_y , shift_p , rst_p;
  wire [6:0] output_y;
  wire [5:0] x_adder;
  Datapath cut_datapath(x , y , x_adder , clk , rst , ldx , ldy , ldp , shift_y , shift_p , rst_p , output_y , result);
  Controller cut_controller(x , output_y , clk , rst , start , ready , ldx , ldy , ldp , rst_p , shift_p , shift_y , x_adder);
endmodule
