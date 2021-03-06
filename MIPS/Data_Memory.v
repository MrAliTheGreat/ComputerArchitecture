`timescale 1ns/1ns
module DataMemory(input[31:0] address , writeData , input clk , write , read , output reg [31:0] readData);
  reg[31:0] memory[0:2009];
  initial  $readmemb("DataMemory.txt", memory);
  always@(address , write , read , writeData) begin
    if(read) begin
      readData = memory[address];
    end
  end 
  always@(posedge clk) begin
    if(write) begin
      memory[address] <= writeData;
    end
  end
endmodule