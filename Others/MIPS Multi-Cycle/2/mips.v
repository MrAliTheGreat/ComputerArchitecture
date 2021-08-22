module mips(rst, clk);
  input rst, clk;
  
  wire[2:0] AluOperation;
  wire[1:0] PCSrc;
  wire[1:0] AluSrcB;
  wire link, RegDst, RegWrite, AluSrcA, IRWrite, IorD, MemWrite, MemRead, MemToReg, PCWrite, PCWriteCond, branch;
  wire[5:0] func;
  wire[5:0] opcode;
	
  MIPSController cu(.AluOperation(AluOperation), .PCSrc(PCSrc), .AluSrcB(AluSrcB), .clk(clk), .link(link), .RegDst(RegDst), .RegWrite(RegWrite),
   .AluSrcA(AluSrcA), .IRWrite(IRWrite), .IorD(IorD), .MemWrite(MemWrite), .MemRead(MemRead), .MemToReg(MemToReg), .PCWrite(PCWrite),
    .PCWriteCond(PCWriteCond), .branch(branch), .func(func), .opcode(opcode), .rst(rst));
	
	DP dp(.AluOperation(AluOperation), .PCSrc(PCSrc), .AluSrcB(AluSrcB), .clk(clk), .link(link), .RegDst(RegDst), .RegWrite(RegWrite),
   .AluSrcA(AluSrcA), .IRWrite(IRWrite), .IorD(IorD), .MemWrite(MemWrite), .MemRead(MemRead), .MemToReg(MemToReg), .PCWrite(PCWrite),
    .PCWriteCond(PCWriteCond), .branch(branch), .func(func), .opcode(opcode), .rst(rst));
endmodule
