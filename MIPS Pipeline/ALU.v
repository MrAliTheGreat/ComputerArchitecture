`timescale 1ns/1ns
module ALU(input[31:0] A , B , input[2:0] aluop ,output [31:0] Q , output zero);
  assign Q = (aluop == 3'b000) ? (A & B) :
             (aluop == 3'b001) ? (A | B) :
             (aluop == 3'b010) ? (A + B) :
             (aluop == 3'b011) ? (A - B) :
             (aluop == 3'b111) ? (A < B) : 32'b0 ; // 32'b0 is considered invalid value
  assign zero = (Q == 0)? 1 : 0;
endmodule
