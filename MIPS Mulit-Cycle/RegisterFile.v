`timescale 1ns/1ns
module RegisterFile(input[4:0] readData1 , readData2 , writeReg , input[31:0] writeData , input clk , regWrite ,output [31:0] Data1 , Data2);
  reg[31:0] reg_file[0:31];
  initial $readmemb("RegisterFile.txt", reg_file);
  assign Data1 = reg_file[readData1];
  assign Data2 = reg_file[readData2];
  always@(posedge clk)
    if(regWrite)
      reg_file[writeReg] <= writeData;
endmodule
