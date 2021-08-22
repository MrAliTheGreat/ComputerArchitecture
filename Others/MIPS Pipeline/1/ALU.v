`timescale 1ns/1ns
module ALU (result, a, b, ALUop);
  
  output reg [31:0] result;
  input signed [31:0] a, b;
  input [2:0] ALUop;
  
  always@(a, b, ALUop)begin
    case(ALUop)
      3'd0: result = a & b;
      3'd1: result = a | b;
      3'd2: result = a + b;
      3'd3: result = a - b;
      3'd4: begin
              if(a < b) result = 32'd1;
              else result = 32'd0;
           end
    endcase
  end
  
endmodule