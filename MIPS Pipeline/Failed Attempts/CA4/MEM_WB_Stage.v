`timescale 1ns/1ns
module MEM_WB_Stage(input clk , rst , input [31:0] out_ALU , memWriteData , input [4:0] regWriteDst ,
                    input RegWrite , memWrite , memRead , memtoReg , output [31:0] memory_reg_out , writeDataRegFile_reg_out , 
                    output [4:0] regWriteDst_reg_out , output out_reg_RegWrite , out_reg_memtoReg);
  
  wire [31:0] out_data_memory;
  
  // Memory
  DataMemory cut_data_mem(out_ALU , memWriteData , clk , memWrite , memRead , out_data_memory);
  Reg32 cut_reg_out_mem(clk , rst , 1'b1 , out_data_memory , memory_reg_out);
  
  // Reg file data
  Reg32 cut_reg_ALU_out(clk , rst , 1'b1 , out_ALU , writeDataRegFile_reg_out);
  
  // Reg file register destination
  Reg5 cut_reg_regFileWriteDst(clk , rst , 1'b1 , regWriteDst , regWriteDst_reg_out);
  
  // Controll signals
  Reg1 cut_reg_regWrite(clk , rst , 1'b1 , RegWrite , out_reg_RegWrite);
  Reg1 cut_reg_memtoReg(clk , rst , 1'b1 , memtoReg , out_reg_memtoReg);
  
endmodule
