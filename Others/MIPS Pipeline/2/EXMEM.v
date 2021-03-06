`timescale 1ns/1ns
module EXMEM(
  input clk, rst, zeroin, RegWritein, MemWritein, MemReadin, PCsrcin,
  input[1:0] MemtoRegin,
  input[4:0] win,
  input[31:0] pcp4in, pcin, Oin, rdata2in
  );
  //output reg RegWriteout, MemtoRegout, MemWriteout, MemReadout, ALUsrcout, RegDstout,
  //output reg[1:0] ALUopout,
  //output reg[4:0] inst2016out, inst1511out,
  //output reg[31:0] pcp4out, rdata1out, rdata2out, signexout
  reg zero, RegWrite, MemWrite, MemRead, PCsrc;
  reg[1:0] MemtoReg;
  reg[4:0] w;
  reg[31:0] pcp4, pc, O, rdata2;  
  
  always@(posedge clk, posedge rst) begin
    if(rst) begin
      zero = 1'b0;
      RegWrite = 1'b0;
      MemtoReg = 2'b0;
      MemWrite = 1'b0;
      MemRead = 1'b0;
      PCsrc = 1'b0;
      w = 5'b0;
      pcp4 = 32'b0;
      pc = 32'b0;
      O = 32'b0;
      rdata2 = 32'b0;
    end
    else begin
      zero = zeroin;
      RegWrite = RegWritein;
      MemtoReg = MemtoRegin;
      MemWrite = MemWritein;
      MemRead = MemReadin;
      PCsrc = PCsrcin;
      w = win;
      pcp4 = pcp4in;
      pc = pcin;
      O = Oin;
      rdata2 = rdata2in;
    end
  end
endmodule




