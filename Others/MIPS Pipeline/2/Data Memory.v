`timescale 1ns/1ns
module data_memory(input MemRead, MemWrite, input[31:0] address, wdata, output [31:0] rdata);
  reg[31:0] datamem[2**16-1:0];
  
  always@(address, MemWrite, wdata) begin
    if(MemWrite)
      datamem[address[15:0]] <= wdata;
  end
  
  assign rdata = (MemRead)? datamem[address[15:0]]:32'bz;
  
  initial begin
    $display("loading data memory");
    $readmemb("Q1datamem.txt",datamem,1000);
    $readmemb("Q1datamem.txt",datamem,2000);
    #3045
    $readmemb("Q2datamem.txt",datamem,1000);
  end
endmodule
