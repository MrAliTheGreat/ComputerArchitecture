`timescale 1ns/1ns
module Controller(input equal , input [5:0] opCode , output reg ALUSrc , regWrite , memWrite , memRead , memtoReg , regDst ,
                  output reg [1:0] ALUOperation , pcSrc);
  
  always @(opCode , equal) begin
    {ALUSrc , regWrite , memWrite , memRead , memtoReg , regDst} = 6'b0;
    ALUOperation = 2'b0; pcSrc = 2'b0;
    
    case(opCode)
      // R-Type -> add , sub , and , or , slt 
      6'b000000: begin
        regWrite = 1;
        ALUSrc = 0;
        ALUOperation = 2'b10;
        regDst = 1;
        memtoReg = 0;
      end
      
      // addi
      6'b001000: begin
        regWrite = 1;
        ALUSrc = 1;
        ALUOperation = 2'b00;
        regDst = 0;
        memtoReg = 0;
      end
    
      // andi
      6'b001100: begin
        regWrite = 1;
        ALUSrc = 1;
        ALUOperation = 2'b11;
        regDst = 0;
        memtoReg = 0;
      end
    
      // lw
      6'b100011: begin
        regWrite = 1;
        ALUSrc = 1;
        ALUOperation = 2'b00;
        regDst = 0;
        memtoReg = 1;
        memRead = 1;
      end
      
      // sw
      6'b101011: begin
        memWrite = 1;
        ALUSrc = 1;
        ALUOperation = 2'b00;
      end
      
      // Jump
      6'b000010: begin
        pcSrc = 2'b10;
      end
      
      // beq
      6'b000100: begin
        ALUOperation = 2'b01;
        pcSrc = equal ? 2'b01 : 2'b00;
      end
      
      // bneq
      6'b000101: begin
        ALUOperation = 2'b01;
        pcSrc = equal ? 2'b00 : 2'b01;
      end
    endcase
  
  end
  
endmodule


