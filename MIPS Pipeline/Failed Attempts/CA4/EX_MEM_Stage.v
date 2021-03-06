`timescale 1ns/1ns
module EX_MEM_Stage(input clk , rst , input [31:0] data1 , data2 , sign_extend_data , input [4:0] Rt , Rd , Rs , MemWBRd , input RegWrite , ALUSrc , 
                    regDst , memWrite , memRead , memtoReg , MemWBregWrite , input[2:0] ALU_operation , input [31:0] regFileWriteData , 
                    output [31:0] ALU_reg_out , memWriteData_reg_out , output [4:0] regWriteDst_reg_out , output zero_reg_out , out_reg_RegWrite ,
                    out_reg_memWrite , out_reg_memRead , out_reg_memtoReg);
  
  wire [31:0] out_alu , ALU_data_in_1 , ALU_data_in_2;
  wire out_zero;
  wire [2:0] alu_operation;
  
  assign ALU_data_in_1 = (out_reg_RegWrite && regWriteDst_reg_out == Rs && regWriteDst_reg_out != 5'b0) ? out_alu :
                  (MemWBregWrite && MemWBRd == Rs && MemWBRd != 5'b0) ? regFileWriteData : data1;
                  
  assign ALU_data_in_2 = (out_reg_RegWrite && regWriteDst_reg_out == Rt && regWriteDst_reg_out != 5'b0) ? out_alu :
                  (MemWBregWrite && MemWBRd == Rt && MemWBRd != 5'b0) ? regFileWriteData : data1;  
  
  // ALU
  ALU cut_ALU(ALU_data_in_1 , ALUSrc ? sign_extend_data : ALU_data_in_2 , ALU_operation , out_alu , out_zero);
  Reg32 cut_reg_out_ALU(clk , rst , 1'b1 , out_alu , ALU_reg_out);
  Reg1 cut_reg_zero(clk , rst , 1'b1 , out_zero , zero_reg_out);
  
  // Data that is going to be written on memory
  Reg32 cut_reg_memWriteData(clk , rst , 1'b1 , data2 , memWriteData_reg_out);
  
  // Destination of register that is going to be written on
  Reg5 cut_reg_regWriteDst(clk , rst , 1'b1 , regDst ? Rd : Rt , regWriteDst_reg_out);
  
  // Controll signals for next stages
  Reg1 cut_reg_regWrite(clk , rst , 1'b1 , RegWrite , out_reg_RegWrite);
  Reg1 cut_reg_memWrite(clk , rst , 1'b1 , memWrite , out_reg_memWrite);
  Reg1 cut_reg_memRead(clk , rst , 1'b1 , memRead , out_reg_memRead);
  Reg1 cut_reg_memtoReg(clk , rst , 1'b1 , memtoReg , out_reg_memtoReg);
  
endmodule
