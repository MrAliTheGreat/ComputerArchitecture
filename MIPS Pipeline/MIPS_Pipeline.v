`timescale 1ns/1ns
module MIPS_Pipeline(input clk , rst);
  wire equal , C_ALUSrc , C_regWrite , C_memWrite , C_memRead , C_memtoReg , C_regDst;
  wire [1:0] C_ALUOperation , C_pcSrc;
  wire [5:0] opCode;

  DataPath cut_datapath(clk , rst , C_ALUSrc , C_regWrite , C_memWrite , C_memRead , C_memtoReg , C_regDst , 
                        C_ALUOperation , C_pcSrc , 
                        equal , 
                        opCode);
  
  Controller cut_controller(equal , opCode , C_ALUSrc , C_regWrite , C_memWrite , C_memRead , C_memtoReg , C_regDst , C_ALUOperation , C_pcSrc);
  
endmodule