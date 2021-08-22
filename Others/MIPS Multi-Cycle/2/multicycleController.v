module centeralCU(AluOp, PCSrc, AluSrcB, clk, link, RegDst, RegWrite, AluSrcA, 
	IRWrite, IorD, MemWrite, MemRead, MemToReg, PCWrite, PCWriteCond, branch, opcode, rst);
	
	output reg[1:0] AluOp;
	output reg[1:0] PCSrc;
	output reg[1:0] AluSrcB;
	output reg link, RegDst, RegWrite, AluSrcA, IRWrite, IorD, MemWrite, MemRead, MemToReg, PCWrite, PCWriteCond, branch;
	input[5:0] opcode;
	input clk, rst;
	
	parameter [3:0] IF=0, ID=1, RT0=2, RT1=3, Jump=4, Beq=5, Bne=6, Jr=7, Jal=8, Memref=9, SW=10, LW0=11, LW1=12, Addi0=13, Andi0=14, AndiAddi=15;
	reg [3:0] ps, ns;
	
	always@(ps, opcode)begin
    ns = IF;
    case(ps)
      IF: begin ns = ID; end
      ID: begin ns = (opcode == 6'b000000) ? RT0 : 
                     (opcode == 6'b000100) ? Beq : 
                     (opcode == 6'b000101) ? Bne : 
                     (opcode == 6'b101011) ? Memref : 
                     (opcode == 6'b100011) ? Memref :
                     (opcode == 6'b000010) ? Jump :
                     (opcode == 6'b000011) ? Jal :
                     (opcode == 6'b000001) ? Jr :
                     (opcode == 6'b001000) ? Addi0 :
                     (opcode == 6'b001100) ? Andi0 : IF;
          end
      RT0: begin ns = RT1; end
      RT1: begin ns = IF; end
      Jump: begin ns = IF; end
      Beq: begin ns = IF; end
      Bne: begin ns = IF; end
      Jr: begin ns = IF; end
      Jal: begin ns = IF; end
      Memref: begin ns = (opcode == 6'b101011) ? SW : LW0; end
      SW: begin ns = IF; end
      LW0: begin ns = LW1; end
      LW1: begin ns = IF; end
      Addi0: begin ns = AndiAddi; end
      Andi0: begin ns = AndiAddi; end
      AndiAddi: begin ns = IF; end 
    endcase   
	end
	
		always@(ps, opcode)begin
    {AluOp, PCSrc, AluSrcB, link, RegDst, RegWrite, AluSrcA, IRWrite, IorD, MemWrite, MemRead, MemToReg, PCWrite, PCWriteCond, branch} = 18'b0;
    case(ps)
      IF: begin {MemRead, IRWrite, PCWrite, AluSrcB} = 5'b11101; end
      ID: begin AluSrcB = 2'b11; end
      RT0: begin {AluSrcA, AluOp} = 3'b110; end
      RT1: begin {RegDst, RegWrite} = 2'b11; end
      Jump: begin {PCSrc, PCWrite} = 3'b101; end
      Beq: begin {AluSrcA, AluOp, PCSrc, PCWriteCond, branch} = 7'b1010111; end
      Bne: begin {AluSrcA, AluOp, PCSrc, PCWriteCond, branch} = 7'b1010110; end
      Jr: begin {PCSrc, PCWrite} = 3'b111; end
      Jal: begin {link, PCWrite, PCSrc} = 4'b1110; end
      Memref: begin {AluSrcA, AluSrcB} = 3'b110; end
      SW: begin {IorD, MemWrite} = 2'b11; end
      LW0: begin {IorD, MemRead} = 2'b11; end
      LW1: begin {RegDst, MemToReg, RegWrite} = 3'b011; end
      Addi0: begin {AluSrcA, AluSrcB} = 3'b110; end
      Andi0: begin {AluSrcA, AluSrcB, AluOp} = 5'b11011; end
      AndiAddi: begin RegWrite = 1'b1; end 
    endcase   
	end
	//sequensil
  always@(posedge clk, posedge rst) begin
    if(rst) ps <= IF;
    else  ps <= ns;
  end
endmodule
  
  
module ALUcontroller(AluOp, func, AluOperation);
  input [1:0] AluOp;
  input [5:0] func;
  output reg [2:0] AluOperation;
  
  always@(AluOp, func) begin
    AluOperation <= 3'b000;
    case(AluOp)
      2'b00: AluOperation <= 3'b010;
      2'b01: AluOperation <= 3'b110;
      2'b10: begin
              if( func == 6'b100000) AluOperation <= 3'b010;
              if( func == 6'b100010) AluOperation <= 3'b110;
              if( func == 6'b100100) AluOperation <= 3'b000;
              if( func == 6'b100101) AluOperation <= 3'b001;
              if( func == 6'b101010) AluOperation <= 3'b111;
             end
      2'b11: AluOperation <= 3'b000;
    endcase
  end
endmodule

module MIPSController(AluOperation, PCSrc, AluSrcB, clk, link, RegDst, RegWrite, AluSrcA, 
	IRWrite, IorD, MemWrite, MemRead, MemToReg, PCWrite, PCWriteCond, branch, func, opcode, rst);
	
  output [2:0] AluOperation;
  output [1:0] PCSrc;
  output[1:0] AluSrcB;
  output link, RegDst, RegWrite, AluSrcA, IRWrite, IorD, MemWrite, MemRead, MemToReg, PCWrite, PCWriteCond, branch;
  input[5:0] func;
  input[5:0] opcode;
  input clk, rst;
  wire [1:0] AluOp;
  
  centeralCU cecu(.AluOp(AluOp), .PCSrc(PCSrc), .AluSrcB(AluSrcB), .clk(clk), .link(link), .RegDst(RegDst), .RegWrite(RegWrite), 
        .AluSrcA(AluSrcA), .IRWrite(IRWrite), .IorD(IorD), .MemWrite(MemWrite), .MemRead(MemRead), .MemToReg(MemToReg), .PCWrite(PCWrite), 
        .PCWriteCond(PCWriteCond), .branch(branch), .opcode(opcode), .rst(rst));
        
  ALUcontroller alucu(.AluOp(AluOp), .func(func), .AluOperation(AluOperation));
endmodule