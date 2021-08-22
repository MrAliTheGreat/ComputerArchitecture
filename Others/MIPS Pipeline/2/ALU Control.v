`timescale 1ns/1ns
module alu_control(input[1:0] aluop, input[5:0] func, output reg[3:0] f);
  always@(aluop, func) begin
    if(aluop == 2'b00)
      f <= 4'b0010; //add
    else if(aluop == 2'b01)
      f <= 4'b0110; //sub
    else if(aluop == 2'b10)
      f <= (func == 6'b100000)? 4'b0010: //add
           (func == 6'b100010)? 4'b0110: //sub
           (func == 6'b100101)? 4'b0001: //or
           (func == 6'b100110)? 4'b0011: //xor
           (func == 6'b011000)? 4'b0100: //mult
           (func == 6'b100100)? 4'b0000: //and
           (func == 6'b101010)? 4'b0111: //slt
           (func == 6'b010000)? 4'b1000: //mfhi
           (func == 6'b010010)? 4'b1001: //mflo
           4'bz;
  end
endmodule