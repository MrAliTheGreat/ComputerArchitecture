`timescale 1ns/1ns
module MIPS_Processor(input clk , rst);
  wire[1:0] ALUcontrol , regWriteDataSel , regIn , pcSel;
  wire memRead , memWrite , aluIn , regWrite , zero;
  wire[5:0] opCode;
  DataPath cut_DataPath(ALUcontrol , regWriteDataSel , regIn , pcSel , clk , rst , memRead , memWrite , aluIn , regWrite , opCode , zero);
  Controller cut_Controller(ALUcontrol , regWriteDataSel , regIn , pcSel , memRead , memWrite , aluIn , regWrite , opCode , zero);
endmodule
