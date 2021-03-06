`timescale 1ns/1ns
module DataPath(input clk , rst , C_ALUSrc , C_regWrite , C_memWrite , C_memRead , C_memtoReg , C_regDst , 
                input [1:0] C_ALUOperation , C_pcSrc , 
                output equal , 
                output [5:0] opCode);
  
  wire regWrite_IDEX , ALUSrc_IDEX , regDst_IDEX , memWrite_IDEX , memRead_IDEX , memtoReg_IDEX;
  wire zero_EXMEM , RegWrite_EX_MEM , memWrite_EX_MEM , memRead_EX_MEM , memtoReg_EX_MEM , RegWrite_MEMWB , memtoReg_MEMWB;
  wire [2:0] ALUop_IDEX , hazard_signals;
  wire [4:0] Rt_IDEX , Rd_IDEX , Rs_IDEX , writeDst_EXMEM , regWriteDst_MEMWB;
  wire [31:0] in_pc , out_pc , instruction_IFID , pc_IFID , data1_IDEX , data2_IDEX , SEData_IDEX , branch_address , jump_address;
  wire [31:0] ALU_EXMEM , memWriteData_EXMEM , memoryData_MEMWB , writeDataRegFile_MEMWB , finalRegFileWriteData;
  
  
  IF_ID_Stage cut_IF_ID(clk , rst , hazard_signals[1] , hazard_signals[2] , C_pcSrc , out_pc , instruction_IFID , pc_IFID);
  
  ID_EX_Stage cut_ID_EX(clk , rst , C_regWrite , RegWrite_MEMWB , C_ALUSrc , C_regDst , C_memWrite , C_memRead , C_memtoReg , 
                        C_ALUOperation , C_pcSrc , 
                        regWriteDst_MEMWB , 
                        instruction_IFID , pc_IFID , finalRegFileWriteData ,
                        regWrite_IDEX , ALUSrc_IDEX , regDst_IDEX , memWrite_IDEX , memRead_IDEX , 
                        memtoReg_IDEX , equal , 
                        ALUop_IDEX , hazard_signals , 
                        Rt_IDEX , Rd_IDEX , Rs_IDEX , 
                        opCode , 
                        data1_IDEX , data2_IDEX , SEData_IDEX , branch_address , jump_address);
  
  
  EX_MEM_Stage cut_EX_MEM(clk , rst , regWrite_IDEX , ALUSrc_IDEX , regDst_IDEX , memWrite_IDEX , memRead_IDEX , memtoReg_IDEX , RegWrite_MEMWB , 
                          ALUop_IDEX , 
                          Rt_IDEX , Rd_IDEX , Rs_IDEX , regWriteDst_MEMWB , 
                          data1_IDEX , data2_IDEX , SEData_IDEX , finalRegFileWriteData , 
                          zero_EXMEM , RegWrite_EX_MEM , memWrite_EX_MEM , memRead_EX_MEM , memtoReg_EX_MEM , 
                          writeDst_EXMEM , 
                          ALU_EXMEM , memWriteData_EXMEM);
  
  
  MEM_WB_Stage cut_MEM_WB(clk , rst , RegWrite_EX_MEM , memWrite_EX_MEM , memRead_EX_MEM , memtoReg_EX_MEM ,
                          writeDst_EXMEM , 
                          ALU_EXMEM , memWriteData_EXMEM , 
                          RegWrite_MEMWB , memtoReg_MEMWB , 
                          regWriteDst_MEMWB , 
                          memoryData_MEMWB , writeDataRegFile_MEMWB);
  
  
  assign finalRegFileWriteData = memtoReg_MEMWB ? memoryData_MEMWB : writeDataRegFile_MEMWB;
  
  assign in_pc = (C_pcSrc == 0) ? out_pc + 4 :
                 (C_pcSrc == 1) ? branch_address :
                 (C_pcSrc == 2) ? jump_address : 32'b0;
  
  Reg32 reg_pc_IFID(clk , rst , hazard_signals[1] , in_pc , out_pc); 

endmodule

