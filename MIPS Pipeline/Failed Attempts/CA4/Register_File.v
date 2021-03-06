`timescale 1ns/1ns
module RegisterFile(input[4:0] readData1 , readData2 , writeReg , input[31:0] writeData , input clk , regWrite ,output reg [31:0] Data1 , Data2);
  reg[31:0] reg_file[0:31];
  initial $readmemb("RegisterFile.txt", reg_file);
  
  always@(negedge clk) begin
    Data1 <= reg_file[readData1];
    Data2 <= reg_file[readData2];     
  end
      
  always@(posedge clk) begin
    if(regWrite)
      reg_file[writeReg] <= writeData;
  end
  
endmodule


