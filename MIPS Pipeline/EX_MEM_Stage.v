`timescale 1ns/1ns
module EX_MEM_Stage(input clk , rst , RegWrite , ALUSrc , regDst , memWrite , memRead , memtoReg , MemWBregWrite , 
                    input [2:0] ALU_operation ,
                    input [4:0] Rt , Rd , Rs , MemWBRd ,
                    input [31:0] data1 , data2 , sign_extend_data , regFileWriteData_in ,
                    output out_reg_zero_EXMEM , out_reg_RegWrite_EX_MEM , out_reg_memWrite_EX_MEM , out_reg_memRead_EX_MEM , out_reg_memtoReg_EX_MEM , 
                    output [4:0] out_reg_writeDst_EXMEM ,
                    output [31:0] out_reg_ALU_EXMEM , out_reg_memWriteData_EXMEM);
  
  wire [31:0] out_alu , ALU_data_in_1 , ALU_data_in_2;
  wire out_zero;
  
  // Forwarding
  assign ALU_data_in_1 = (out_reg_RegWrite_EX_MEM && out_reg_writeDst_EXMEM == Rs && out_reg_writeDst_EXMEM != 5'b0) ? out_reg_ALU_EXMEM :
                         (MemWBregWrite && MemWBRd == Rs && MemWBRd != 5'b0) ? regFileWriteData_in : data1;
                  
  assign ALU_data_in_2 = (out_reg_RegWrite_EX_MEM && out_reg_writeDst_EXMEM == Rt && out_reg_writeDst_EXMEM != 5'b0) ? out_reg_ALU_EXMEM :
                         (MemWBregWrite && MemWBRd == Rt && MemWBRd != 5'b0) ? regFileWriteData_in : data2;  
  
  // ALU
  ALU cut_ALU(ALU_data_in_1 , ALUSrc ? sign_extend_data : ALU_data_in_2 , ALU_operation , out_alu , out_zero);
  Reg32 cut_reg_out_ALU(clk , rst , 1'b1 , out_alu , out_reg_ALU_EXMEM);
  Reg1 cut_reg_zero(clk , rst , 1'b1 , out_zero , out_reg_zero_EXMEM);
  
  // Data that is going to be written on memory
  Reg32 cut_reg_memWriteData(clk , rst , 1'b1 , ALU_data_in_2 , out_reg_memWriteData_EXMEM);
  
  // Destination of register that is going to be written on
  Reg5 cut_reg_regWriteDst(clk , rst , 1'b1 , regDst ? Rd : Rt , out_reg_writeDst_EXMEM);
  
  // Controll signals for next stages
  Reg1 cut_reg_regWrite(clk , rst , 1'b1 , RegWrite , out_reg_RegWrite_EX_MEM);
  Reg1 cut_reg_memWrite(clk , rst , 1'b1 , memWrite , out_reg_memWrite_EX_MEM);
  Reg1 cut_reg_memRead(clk , rst , 1'b1 , memRead , out_reg_memRead_EX_MEM);
  Reg1 cut_reg_memtoReg(clk , rst , 1'b1 , memtoReg , out_reg_memtoReg_EX_MEM);
  
endmodule


