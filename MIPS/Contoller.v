`timescale 1ns/1ns
module Controller(output reg[1:0] ALUcontrol , regWriteDataSel , regIn , pcSel , output reg memRead , memWrite , aluIn , regWrite ,input[5:0] opCode ,input zero);
  always@(opCode , zero)begin
    ALUcontrol = 2'b0 ; regWriteDataSel = 2'b0 ; regIn = 2'b0 ; pcSel = 2'b0;
    {memRead , memWrite , aluIn , regWrite} = 4'b0;
    case(opCode)
      6'b000000: begin // R_type ==> add , sub , and , or , slt
        ALUcontrol = 2'b10;
        regWriteDataSel = 0;
        regIn = 1;
        pcSel = 0;
        aluIn = 0;
        {memRead , memWrite , regWrite} = 3'b001;
      end
      6'b001000: begin // addi
        ALUcontrol = 2'b00;
        regWriteDataSel = 0;
        regIn = 0;
        pcSel = 0;
        aluIn = 1;
        {memRead , memWrite , regWrite} = 3'b001;
      end
      6'b001100: begin // andi
        ALUcontrol = 2'b11;
        regWriteDataSel = 0;
        regIn = 0;
        pcSel = 0;
        aluIn = 1;
        {memRead , memWrite , regWrite} = 3'b001;
      end
      6'b100011: begin // lw
        ALUcontrol = 2'b00;
        regWriteDataSel = 1;
        regIn = 0;
        pcSel = 0;
        aluIn = 1;
        {memRead , memWrite , regWrite} = 3'b101;
      end
      6'b101011: begin // sw
        ALUcontrol = 2'b00;
        pcSel = 0;
        aluIn = 1;
        {memRead , memWrite , regWrite} = 4'b010;
      end
      6'b000010: begin // j
        pcSel = 1;
        aluIn = 0;
        {memRead , memWrite , regWrite} = 3'b000;
      end 
      6'b000011: begin // jal
        regWriteDataSel = 2;
        regIn = 2;
        pcSel = 1;
        aluIn = 0;
        {memRead , memWrite , regWrite} = 3'b001;
      end
      6'b000100: begin // beq
        ALUcontrol = 2'b01;
        aluIn = 0;
        if(zero)
          pcSel = 3;
        else 
          pcSel = 0;
        {memRead , memWrite , regWrite} = 3'b000;
      end
      6'b000101: begin // bne
        ALUcontrol = 2'b01;
        aluIn = 0;
        if(zero)
          pcSel = 0;
        else
          pcSel = 3;
        {memRead , memWrite , regWrite} = 3'b000;
      end
      6'b100000: begin // jr
        pcSel = 2;
        // Other signals -> don't care
      end
      default:begin
        ALUcontrol = 2'b00;
        regWriteDataSel = 0;
        regIn = 0;
        pcSel = 0;
        aluIn = 0;
        {memRead , memWrite , regWrite} = 3'b000;
      end
    endcase
  end
endmodule


