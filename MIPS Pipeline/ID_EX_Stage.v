`timescale 1ns/1ns
module ID_EX_Stage(input clk , rst , regWrite , out_reg_regWriteMEMWB , ALUSrc , regDst , memWrite , memRead , memtoReg ,
                   input [1:0] ALUop , pcSrc , 
                   input [4:0] out_reg_writeRegMEMWB ,
                   input [31:0] instr , pc , out_reg_writeDataMEMWB ,
                   output out_reg_RegWrite_IDEX , out_reg_ALUSrc_IDEX , out_reg_regDst_IDEX , out_reg_memWrite_IDEX , out_reg_memRead_IDEX ,
                   out_reg_memtoReg_IDEX , equal , 
                   
                   output [2:0] out_reg_ALUop_IDEX , hazard_signals ,
                   output [4:0] out_reg_Rt_IDEX , out_reg_Rd_IDEX , out_reg_Rs_IDEX ,
                   output [5:0] opCode ,
                   output [31:0] out_reg_data1_IDEX , out_reg_data2_IDEX , out_reg_SEData_IDEX , branch_address , jump_address);
  
  wire [31:0] out_regfile_data1 , out_regfile_data2 , sign_extend_data;
  wire [2:0] out_ALUop_controller , hazard;
  
  // register file
  RegisterFile cut_reg_file(instr[25:21] , instr[20:16] , out_reg_writeRegMEMWB , out_reg_writeDataMEMWB , clk , out_reg_regWriteMEMWB , 
                            out_regfile_data1 , out_regfile_data2);
  
  Reg32 cut_reg_data1(clk , rst , 1'b1 , out_regfile_data1 , out_reg_data1_IDEX);
  Reg32 cut_reg_data2(clk , rst , 1'b1 , out_regfile_data2 , out_reg_data2_IDEX);
  
  // sign_extend
  Reg32 cut_reg_sign_extend(clk , rst , 1'b1 , sign_extend_data , out_reg_SEData_IDEX);
  
  // Rs , Rt , Rd
  Reg5 cut_reg_Rs(clk , rst , 1'b1 , instr[25:21] , out_reg_Rs_IDEX);
  Reg5 cut_reg_Rt(clk , rst , 1'b1 , instr[20:16] , out_reg_Rt_IDEX);
  Reg5 cut_reg_Rd(clk , rst , 1'b1 , instr[15:11] , out_reg_Rd_IDEX);

  // ALU controll signals
  ALUcontroller cut_alu_controller(instr[5:0] , ALUop , out_ALUop_controller);
  Reg3_clear cut_reg_alu_controller(clk , rst , 1'b1 , hazard[0] , out_ALUop_controller , out_reg_ALUop_IDEX);

  // Controll signals for next stages
  Reg1_clear cut_reg_regWrite(clk , rst , 1'b1 , hazard[0] , regWrite , out_reg_RegWrite_IDEX);
  Reg1_clear cut_reg_ALUSrc(clk , rst , 1'b1 , hazard[0] , ALUSrc , out_reg_ALUSrc_IDEX);
  Reg1_clear cut_reg_regDst(clk , rst , 1'b1 , hazard[0] , regDst , out_reg_regDst_IDEX);
  Reg1_clear cut_reg_memWrite(clk , rst , 1'b1 , hazard[0] , memWrite , out_reg_memWrite_IDEX);
  Reg1_clear cut_reg_memRead(clk , rst , 1'b1 , hazard[0] , memRead , out_reg_memRead_IDEX);
  Reg1_clear cut_reg_memtoReg(clk , rst , 1'b1 , hazard[0] , memtoReg , out_reg_memtoReg_IDEX);
  
  
  assign sign_extend_data = instr[15] ? {16'b1111111111111111,instr[15:0]} : {16'b0,instr[15:0]};
  
  // Jump
  assign jump_address = {pc[31:28] , instr[25:0] , 2'b0};
  
  // beq address
  assign branch_address = ((sign_extend_data << 2) + (pc));
  
  // opCode for controller
  assign opCode = instr[31:26];
  
  // Equal needed for beq 
  assign equal = (out_regfile_data1 == out_regfile_data2) ? 1'b1 : 1'b0;
  
  // Hazard {ldIFID -> IF , ldPC -> IF , IDEXcontrollSignals_ld -> ID}
  assign hazard = (out_reg_memRead_IDEX & (out_reg_Rt_IDEX != 0) & ((out_reg_Rt_IDEX == instr[25:21] & pcSrc != 2) | (out_reg_Rt_IDEX == instr[20:16] & pcSrc != 2))) ? 3'b001 : 3'b110;
  assign hazard_signals = hazard;

endmodule
