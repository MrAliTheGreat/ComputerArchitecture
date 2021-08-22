`timescale 1ns/1ns
module MEM_WB_Stage(input clk , rst , RegWrite , memWrite , memRead , memtoReg ,
                    input [4:0] regWriteDst ,
                    input [31:0] out_ALU , memWriteData , 
                    output out_reg_RegWrite_MEMWB , out_reg_memtoReg_MEMWB , 
                    output [4:0] out_reg_regWriteDst_MEMWB ,
                    output [31:0] out_reg_memoryData_MEMWB , writeDataRegFile_MEMWB);
  
  wire [31:0] out_data_memory;
  
  // Memory
  DataMemory cut_data_mem(out_ALU , memWriteData , clk , memWrite , memRead , out_data_memory);
  Reg32 cut_reg_out_mem(clk , rst , 1'b1 , out_data_memory , out_reg_memoryData_MEMWB);
  
  // Reg file data
  Reg32 cut_reg_ALU_out(clk , rst , 1'b1 , out_ALU , writeDataRegFile_MEMWB);
  
  // Reg file register destination
  Reg5 cut_reg_regFileWriteDst(clk , rst , 1'b1 , regWriteDst , out_reg_regWriteDst_MEMWB);
  
  // Controll signals
  Reg1 cut_reg_regWrite(clk , rst , 1'b1 , RegWrite , out_reg_RegWrite_MEMWB);
  Reg1 cut_reg_memtoReg(clk , rst , 1'b1 , memtoReg , out_reg_memtoReg_MEMWB);
  
endmodule
