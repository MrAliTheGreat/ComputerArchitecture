`timescale 1ns/1ns
module MIPS_Processor(input clk , rst);
  wire pcWrite , pcConditional , IorD , memRead , memWrite , IRWrite , regWrite , ALUSrcA;
  wire[1:0] regDst , memtoreg , ALUSrcB , ALUOp , PCSrc;
  wire[5:0] opCode;
  
  Datapath cut_datapath(clk , rst , pcWrite , pcConditional , IorD , memRead , memWrite , IRWrite , regWrite , ALUSrcA , regDst , memtoreg , ALUSrcB , ALUOp , PCSrc , opCode);
  Controller cut_controller(clk , rst , pcWrite , pcConditional , IorD , memRead , memWrite , IRWrite , regWrite , ALUSrcA , regDst , memtoreg , ALUSrcB , ALUOp , PCSrc , opCode);
endmodule
