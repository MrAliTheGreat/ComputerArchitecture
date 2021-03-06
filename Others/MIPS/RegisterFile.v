module RegisterFile(input[4:0] readData1,readData2,writeReg,input[31:0] writeData, input clk,write ,output [31:0] data1,data2);
  reg[31:0] regi[31:0];
  initial  $readmemb("registers.txt", regi);
  assign  data1= regi[readData1];
  assign  data2= regi[readData2];
  always@(negedge clk)
    if (write)
      regi[writeReg] <= writeData;
endmodule
