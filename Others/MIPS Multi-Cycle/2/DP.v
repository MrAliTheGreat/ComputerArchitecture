module DP(input[2:0] AluOperation,input[1:0] PCSrc,input[1:0] AluSrcB,input rst,clk,link,RegDst,RegWrite,AluSrcA,
	IRWrite,IorD,MemWrite,MemRead,MemToReg,PCWrite,PCWriteCond,branch,output[5:0] func,output[5:0] opcode);
		wire writePC,zero;
		wire[31:0] pcSrc; wire[31:0] pc; wire[31:0] aluOut; wire[31:0] memAdr; wire[31:0] memOut;
		wire[31:0] ir; wire[31:0] mdr; wire[4:0] regDst; wire[4:0] writeReg; wire[31:0] writeD;
		wire[31:0] memToReg; wire[31:0] D1; wire[31:0] D2; wire[31:0] a; wire[31:0] b;
		wire[27:0] shift1; wire[31:0] shift2; wire[31:0] sgnext;
		wire[31:0] aluSrcA; wire[31:0] aluSrcB; wire[31:0] aluO;
		//
		assign writePC = branch ? ((zero & PCWriteCond) | PCWrite) : ((~zero & PCWriteCond) | PCWrite);
		assign opcode = ir[31:26];
		assign func = ir[5:0];
		//						
		Reg32WithLoad IR (.parIn(memOut) , .ld(IRWrite) , .clk(clk) , .rst(rst) , .out(ir) );
		Reg32OutLoad MDR (.parIn(memOut) , .clk(clk) , .rst(rst) , .out(mdr) );
		Reg32OutLoad A (.parIn(D1) , .clk(clk) , .rst(rst) , .out(a) );
		Reg32OutLoad B (.parIn(D2) , .clk(clk) , .rst(rst) , .out(b) );
		Reg32OutLoad ALUOut (.parIn(aluO) , .clk(clk) , .rst(rst) , .out(aluOut) );
		//
		Reg32WithLoad PC (.parIn(pcSrc) , .ld(writePC) , .clk(clk) , .rst(rst) , .out(pc) );
		RegFile rgf (.clk(clk) , .rst(rst) , .regWrite(RegWrite),.r1(ir[25:21]),.r2(ir[20:16]),.rw(writeReg),.wd(writeD),.rd1(D1),.rd2(D2) );
		Memory mem (.rst(rst) , .clk(clk) , .MemRead(MemRead) , .MemWrite(MemWrite) , .writeData(b) , .Address(memAdr) , .ReadData(memOut) );
		ALU alu (.A(aluSrcA) , .B(aluSrcB) , .AluOperation(AluOperation) , .zero(zero) , .out(aluO) );
		//
		SignExt ext (.in(ir[15:0]) , .out(sgnext) );
		Shift2b26 sh1 (.in(ir[25:0]) , .out(shift1) );
		Shift2b32 sh2 (.in(sgnext) , .out(shift2) );
		//
		MUX32 mux1 (.s0(pc) , .s1(aluOut) , .s(IorD) , .out(memAdr) );
		MUX5 mux2 (.s0(ir[20:16]) , .s1(ir[15:11]) , .s(RegDst) , .out(regDst) );
		MUX5 mux3 (.s0(regDst) , .s1(5'b11111) , .s(link) , .out(writeReg) );
		MUX32 mux4 (.s0(aluOut) , .s1(mdr) , .s(MemToReg) , .out(memToReg) );
		MUX32 mux5 (.s0(memToReg) , .s1(pc) , .s(link) , .out(writeD) );
		MUX32 mux6 (.s0(pc) , .s1(a) , .s(AluSrcA) , .out(aluSrcA) );
		MUX32Four mux7 (.s0(b) , .s1(4) , .s2(sgnext) , .s3(shift2) , .s(AluSrcB) , .out(aluSrcB) );
		MUX32Four mux8 (.s0(aluO) , .s1(aluOut) , .s2({pc[31:28] , shift1}) , .s3(a) , .s(PCSrc) , .out(pcSrc) );
endmodule
