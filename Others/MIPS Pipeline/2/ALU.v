`timescale 1ns/1ns
module alu(input clk, input[3:0] f, input[31:0] A, B, output zero, output[31:0] O);
  reg[31:0] hi, lo;
  
  assign O = (f == 4'b0000)? A & B:
             (f == 4'b0001)? A | B:
             (f == 4'b0010)? A + B:
             (f == 4'b0011)? A ^ B:
             (f == 4'b0110)? A - B:
             (f == 4'b0111)? A < B:
             (f == 4'b1000)? hi:
             (f == 4'b1001)? lo:
             32'bz;
             
  assign zero = (O[31:0] == 32'b0)?  1'b1:1'b0;
  
  always@(posedge clk) begin
    if(f == 4'b0100)
      {hi, lo} <= A * B;
  end
endmodule