module Controller(OpCode, func, Zero, RegDst, RegWrite, AluSrc, MemRead, MemWrite, MemToReg, SelWriteReg, SelData, SelPc, AluOperation, PcSrc, Flush);
input [5:0] OpCode, func;
input Zero;
output RegDst, RegWrite, AluSrc, MemRead, MemWrite, MemToReg, SelWriteReg, SelData, PcSrc; 
output SelPc, Flush; 
output [2:0] AluOperation;

    wire Branch, BranchNot;
    wire [1:0] AluOp;
    assign Flush = SelPc | PcSrc;
    CentralController cc(.OpCode(OpCode), .RegDst(RegDst), .RegWrite(RegWrite),
                         .AluSrc(AluSrc), .MemRead(MemRead), .MemWrite(MemWrite), .MemToReg(MemToReg),
                         .SelPc(SelPc), .Branch(Branch), .BranchNot(BranchNot), .AluOp(AluOp));
    PcController pcc(.branch(Branch), .branchnot(BranchNot), .zero(Zero), .pcsrc(PcSrc));
    AluController ac(.func(Func), .aluop(AluOp), .aluoperation(AluOperation));                     
endmodule 
