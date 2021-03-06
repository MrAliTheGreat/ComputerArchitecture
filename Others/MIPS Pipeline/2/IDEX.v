`timescale 1ns/1ns
module IDEX(
  input clk, rst, RegWritein, MemWritein, MemReadin, PCsrcin, ALUsrcin,
  input[1:0] RegDstin, ALUopin, MemtoRegin,
  input[4:0] inst2016in, inst1511in,
  input[5:0] funcin,
  input[31:0] pcp4in, rdata1in, rdata2in, signexin
  );
  //output reg RegWriteout, MemtoRegout, MemWriteout, MemReadout, ALUsrcout, RegDstout,
  //output reg[1:0] ALUopout,
  //output reg[4:0] inst2016out, inst1511out,
  //output reg[31:0] pcp4out, rdata1out, rdata2out, signexout
  reg RegWrite, MemWrite, MemRead, PCsrc, ALUsrc;
  reg[1:0] RegDst, ALUop, MemtoReg;
  reg[5:0] func;
  reg[4:0] inst2016, inst1511;
  reg[31:0] pcp4, rdata1, rdata2, signex;
  
  always@(posedge clk, posedge rst) begin
    if(rst) begin
      RegWrite = 1'b0;
      MemtoReg = 2'b0;
      MemWrite = 1'b0;
      MemRead = 1'b0;
      PCsrc = 1'b0;
      ALUsrc = 1'b0;
      RegDst = 2'b0;
      ALUop = 2'b0;
      func = 6'b0;
      inst2016 = 5'b0;
      inst1511 = 5'b0;
      pcp4 = 32'b0;
      rdata1 = 32'b0;
      rdata2 = 32'b0;
      signex = 32'b0;
    end
    else begin
      RegWrite = RegWritein;
      MemtoReg = MemtoRegin;
      MemWrite = MemWritein;
      MemRead = MemReadin;
      PCsrc = PCsrcin;
      ALUsrc = ALUsrcin;
      RegDst = RegDstin;
      ALUop = ALUopin;
      func = funcin;
      inst2016 = inst2016in;
      inst1511 = inst1511in;
      pcp4 = pcp4in;
      rdata1 = rdata1in;
      rdata2 = rdata2in;
      signex = signexin;
    end
  end
endmodule


