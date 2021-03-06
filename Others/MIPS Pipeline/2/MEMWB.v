`timescale 1ns/1ns
module MEMWB(
  input clk, rst, RegWritein,
  input[1:0] MemtoRegin,
  input[4:0] win,
  input[31:0] pcp4in, rdatain, Oin
  );
  //output reg RegWriteout, MemtoRegout, MemWriteout, MemReadout, ALUsrcout, RegDstout,
  //output reg[1:0] ALUopout,
  //output reg[4:0] inst2016out, inst1511out,
  //output reg[31:0] pcp4out, rdata1out, rdata2out, signexout
  reg RegWrite;
  reg[1:0] MemtoReg;
  reg[4:0] w;
  reg[31:0] pcp4, O, rdata;  
  
  always@(posedge clk, posedge rst) begin
    if(rst) begin
      RegWrite = 1'b0;
      MemtoReg = 2'b0;
      w = 5'b0;
      O = 32'b0;
      rdata = 32'b0;
    end
    else begin
      RegWrite = RegWritein;
      MemtoReg = MemtoRegin;
      w = win;
      O = Oin;
      rdata = rdatain;
    end
  end
endmodule






