`timescale 1ns/1ns
module Controller(input equal , sel_cancel , input [5:0] opCode , output reg ALUSrc , regWrite , memWrite , memRead , memtoReg , regDst , clear_IFID ,
                  output reg [1:0] ALUOperation , pcSrc);
  
  always @(opCode) begin
    {ALUSrc , regWrite , memWrite , memRead , memtoReg , regDst , clear_IFID} = 7'b0;
    ALUOperation = 2'b0; pcSrc = 2'b0;
    
    case(opCode)
      // R-Type -> add , sub , and , or , slt 
      6'b000000: begin
        if(sel_cancel) begin
          regWrite = 1;
          ALUSrc = 0;
          ALUOperation = 2'b10;
          regDst = 1;
          memtoReg = 0;
        end
      end
      
      // addi
      6'b001000: begin
        if(sel_cancel) begin
          regWrite = 1;
          ALUSrc = 1;
          ALUOperation = 2'b00;
          regDst = 0;
          memtoReg = 0;
        end
      end
    
      // andi
      6'b001100: begin
        if(sel_cancel) begin
          regWrite = 1;
          ALUSrc = 1;
          ALUOperation = 2'b11;
          regDst = 0;
          memtoReg = 0;
        end
      end
    
      // lw
      6'b100011: begin
        if(sel_cancel) begin
          regWrite = 1;
          ALUSrc = 1;
          ALUOperation = 2'b00;
          regDst = 0;
          memtoReg = 1;
          memRead = 1;
        end
      end
      
      // sw
      6'b101011: begin
        if(sel_cancel) begin
          memWrite = 1;
          ALUSrc = 1;
          ALUOperation = 2'b00;
        end
      end
      
      // Jump
      6'b000010: begin
        if(sel_cancel) begin
          pcSrc = 2'b10;
          clear_IFID = 1'b1;
        end
      end
      
      // beq
      6'b000100: begin
        if(sel_cancel) begin
          ALUOperation = 2'b01;
          pcSrc = equal ? 2'b01 : 2'b00;
          clear_IFID = equal ? 1'b1 : 1'b0;
        end
      end
      
      // bneq
      6'b000101: begin
        if(sel_cancel) begin
          ALUOperation = 2'b01;
          pcSrc = equal ? 2'b00 : 2'b01;
          clear_IFID = equal ? 1'b0 : 1'b1;
        end
      end
    endcase
  
  end
  
endmodule
