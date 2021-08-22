`timescale 1ns/1ns
module mips(input clk, rst);
  wire zero, RegWrite, ALUsrc, branch, branchnot, jump, MemRead, MemWrite, PCsrc, flush, eq;
  wire[1:0] ALUop, MemtoReg, RegDst;
  wire[3:0] f;
  wire[4:0] w;
  wire[31:0] pcp4, wdata, inst, rdata1, rdata2, seout, O, B, offset, rdata;
  reg[31:0] pc = 32'b0;
  
  
  instruction_memory IM(pc, inst);
  
  IFID IFID(clk, rst, flush, pcp4, inst);
  
  controller CU(IFID.inst[31:26], RegWrite, ALUsrc, branch, branchnot, jump, MemRead, MemWrite, ALUop, MemtoReg, RegDst);
  register_file RF(clk, rst, MEMWB.RegWrite, IFID.inst[25:21], IFID.inst[20:16], MEMWB.w, wdata, rdata1, rdata2);
  sign_extend SE(IFID.inst[15:0], seout);
  
  IDEX IDEX(clk, rst, RegWrite, MemWrite, MemRead, PCsrc, ALUsrc, RegDst, ALUop, MemtoReg, IFID.inst[20:16], IFID.inst[15:11], IFID.inst[5:0], IFID.pc, rdata1, rdata2, seout);
  
  alu ALU(clk, f, IDEX.rdata1, B, zero, O);
  alu_control ALUC(IDEX.ALUop, IDEX.func, f);
  
  EXMEM EXMEM(clk, rst, zero, IDEX.RegWrite, IDEX.MemWrite, IDEX.MemRead, IDEX.PCsrc, IDEX.MemtoReg, w, IDEX.pcp4, offset, O, IDEX.rdata2);
  
  data_memory DM(EXMEM.MemRead, EXMEM.MemWrite, EXMEM.O, EXMEM.rdata2, rdata);
  
  MEMWB MEMWB(clk, rst, EXMEM.RegWrite, EXMEM.MemtoReg, EXMEM.w, EXMEM.pcp4, rdata, EXMEM.O);
  
  assign pcp4 = pc + 32'd4;
  assign wdata = (MEMWB.MemtoReg == 2'd0)? MEMWB.O:
                 (MEMWB.MemtoReg == 2'd1)? MEMWB.rdata:
                 (MEMWB.MemtoReg == 2'd2)? MEMWB.pcp4:
                 32'bz;
  assign B = (IDEX.ALUsrc)?IDEX.signex:IDEX.rdata2;
  assign w = (IDEX.RegDst == 2'd0)? IDEX.inst2016:
             (IDEX.RegDst == 2'd1)? IDEX.inst1511:
             (IDEX.RegDst == 2'd2)? 5'd31:
             5'bz;
  assign offset = (seout << 2) + (IFID.pc);
  assign flush = eq;
  assign eq = (branch & (rdata1 == rdata2)) | (branchnot & ~(rdata1 == rdata2));
  
  //initial $monitor(reg3.pcp4);
  always@(posedge clk, posedge rst) begin
    if(rst)
      pc = 32'b0;
    else if(eq)
      pc = offset;
    else
      pc = pcp4;
  end
endmodule
