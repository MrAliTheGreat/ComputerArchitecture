
`timescale 1ns/1ns

module MUX2 #(parameter integer n) (in0, in1, sel, out);
  input [n-1:0] in0, in1;
  input sel;
  output [n-1:0] out;
  assign out = sel ? in1 : in0;
endmodule 

module MUX4 #(parameter integer n) (in0, in1, in2, in3, sel, out);
  input [n-1:0] in0, in1, in2, in3;
  input [1:0] sel;
  output [n-1:0] out;
  assign out =  (sel == 2'd0) ? in0 :
                (sel == 2'd1) ? in1 :
                (sel == 2'd2) ? in2 : in3;
endmodule 