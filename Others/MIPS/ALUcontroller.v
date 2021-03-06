module ALUcontroller(input[5:0] opCode,input[1:0] ALUOp ,output reg[2:0] out);
  always@(opCode,ALUOp)begin
    case({ALUOp[1],opCode[3:0]})
      5'b10000: out <= 3'b010;
      5'b10010: out <= 3'b110; 
      5'b10100: out <= 3'b000;
      5'b10101: out <= 3'b001;
      5'b11010: out <= 3'b111;
      default:begin
        if(ALUOp == 0)
          out <= 3'b010;
        else if(ALUOp[0] == 1)
          out <= 3'b110;
        else if({ALUOp[1],opCode[3:0]}==7'b1011000)
          out <= 3'b011;
        else if({ALUOp[1],opCode[3:0]}==7'b1100110)
          out <= 3'b100;
      end
    endcase
  end
endmodule


