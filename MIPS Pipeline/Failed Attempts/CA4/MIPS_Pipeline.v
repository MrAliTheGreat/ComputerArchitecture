`timescale 1ns/1ns
module MIPS_Pipeline(input clk , rst);
  wire equal , ALUSrc , regWrite , memWrite , memRead , memtoReg , regDst , clearIFID , sel_cancel;
  wire [1:0] ALUOperation , pcSrc;
  wire [5:0] opCode;

  DataPath cut_datapath(clk , rst , ALUSrc , regWrite , memWrite , memRead , memtoReg , regDst , clearIFID , ALUOperation , pcSrc , opCode , equal , sel_cancel);
  Controller cut_controller(equal , sel_cancel , opCode , ALUSrc , regWrite , memWrite , memRead , memtoReg , regDst , clearIFID , ALUOperation , pcSrc);
  
endmodule
