`timescale 1ns/1ns
module ALUcontroller(input[5:0] func , input[1:0] ALUOp , output reg[2:0] Q);
  always@(func , ALUOp)begin
    case({ALUOp , func})
      8'b10100100: Q <= 3'b000; // and
      8'b10100101: Q <= 3'b001; // or
      8'b10100000: Q <= 3'b010; // add
      8'b10100010: Q <= 3'b011; // sub
      8'b10101010: Q <= 3'b111; // slt
      default: begin
        if(ALUOp == 2'b0) // Always add
          Q <= 3'b010;
        else if(ALUOp == 2'b01) // Always sub
          Q <= 3'b011;
        else if(ALUOp == 2'b11) // andi
          Q <= 3'b000;
      end
    endcase
  end
endmodule


