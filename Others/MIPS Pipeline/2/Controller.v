`timescale 1ns/1ns
module controller(input[5:0] op, output reg RegWrite, alusrc, branch, branchnot, jump,
              MemRead, MemWrite, output reg[1:0] aluop, MemtoReg, RegDst);
  always@(op) begin
    {RegWrite, alusrc, branch, branchnot, jump, MemRead, MemWrite, aluop, MemtoReg, RegDst} = 13'b0;
    case(op)
      6'b000000: begin RegWrite=1'b1; aluop=2'b10; RegDst=2'b01; end                  //RT
      6'b100011: begin RegWrite=1'b1; alusrc=1'b1; MemtoReg=2'b01; MemRead=1'b1; end  //lw
      6'b101011: begin alusrc=1'b1; MemWrite=1'b1; end                                //sw
      6'b001000: begin RegWrite=1'b1; alusrc=1'b1; end                                //addi
      6'b001010: begin RegWrite=1'b1; alusrc=1'b1; aluop=2'b01; end                   //slti
      6'b000100: begin aluop=2'b01; branch=1'b1; end                                  //beq
      6'b000101: begin aluop=2'b01; branchnot=1'b1; end                               //bne
      6'b000010: begin jump=1'b1; end                                                 //J
      6'b000011: begin RegWrite=1'b1; MemtoReg=2'b10; jump=1'b1; RegDst=2'b10; end    //Jal
    endcase
  end
endmodule

