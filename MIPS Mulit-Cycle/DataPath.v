`timescale 1ns/1ns
module Datapath(input clk , rst , pcWrite , pcConditional , IorD , memRead , memWrite , IRWrite , regWrite , ALUSrcA , input[1:0] regDst , memtoreg , ALUSrcB , ALUOp , PCSrc , output [5:0] opCode);
  wire [31:0] pc , new_pc;
  wire [31:0] adr , regALUout;
  wire [31:0] outMemory;
  wire [31:0] instruction , outMDR;
  wire [31:0] writeData , data1 , data2 , regAout , regBout , A , B , signExtendData , outALU;
  wire [4:0] writeReg;
  wire [2:0] ALUIn;
  wire zero;
  
  IR_Register pc_reg(clk , rst , ((zero & pcConditional) | pcWrite) , new_pc , pc);
  
  assign adr = (IorD == 0) ? pc / 4 : regALUout;
  Memory cut_memory(adr , regBout , clk , memWrite , memRead , outMemory);
  
  IR_Register IRreg(clk , rst , IRWrite , outMemory , instruction);
  
  Register MDR(clk , rst , outMemory , outMDR);
  
  assign writeReg = (regDst == 0) ? instruction[20:16] :
                    (regDst == 1) ? instruction[15:11] : 31;
  
  assign writeData = (memtoreg == 0) ? regALUout :
                     (memtoreg == 1) ? outMDR : pc;
  
  RegisterFile cut_regFile(instruction[25:21] , instruction[20:16] , writeReg , writeData , clk , regWrite , data1 , data2);
  
  Register regA(clk , rst , data1 , regAout);
  Register regB(clk , rst , data2 , regBout);
  
  ALUcontroller cut_ALUController(instruction[5:0] , ALUOp , ALUIn);
  assign A = (ALUSrcA == 0) ? pc : regAout;
  assign signExtendData = instruction[15] ? {16'b1111111111111111,instruction[15:0]} : {16'b0,instruction[15:0]};
  assign B = (ALUSrcB == 0) ? regBout :
             (ALUSrcB == 1) ? 4 :
             (ALUSrcB == 2) ? signExtendData :
             (ALUSrcB == 3) ? {signExtendData , 2'b0} : 0;
  
  ALU cut_ALU(A , B , ALUIn , outALU , zero);
  
  Register regALU(clk , rst , outALU , regALUout);
  
  assign opCode = instruction[31:26];
  
  assign new_pc = (PCSrc == 0) ? outALU :
                  (PCSrc == 1) ? {pc[31:28] , instruction[25:0] , 2'b0} :
                  (PCSrc == 2) ? regALUout :
                  (PCSrc == 3) ? regAout : 0;
                  
endmodule
