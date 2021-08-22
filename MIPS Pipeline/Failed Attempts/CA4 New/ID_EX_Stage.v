`timescale 1ns/1ns
module ID_EX_Stage(input clk , rst , input[31:0] instr , pc , writeData , input RegWrite , RegWriteFinal , ALUSrc , regDst , memWrite , memRead , memtoReg , 
                   input [1:0] ALUop , input [4:0] writeReg , output [31:0] data1_reg_out , data2_reg_out , out_reg_sign_extend , 
                   output [4:0] out_reg_Rt , out_reg_Rd , output out_reg_RegWrite , out_reg_ALUSrc , out_reg_regDst , out_reg_memWrite , 
                   out_reg_memRead , out_reg_memtoReg , output [2:0] out_reg_ALUop , lw_hazard , output [5:0] opCode , output equal ,
                   output [31:0] branch_address , jump_address , output [4:0] out_reg_Rs);
  
  wire[31:0] out_data1 , out_data2 , sign_extend_data;
  
  assign sign_extend_data = instr[15] ? {16'b1111111111111111,instr[15:0]} : {16'b0,instr[15:0]};
  
  // lw_hazard [2:0] = {write_IFID , write_pc , select_cancel_controll_signals};
  assign lw_hazard = (out_reg_memRead && (out_reg_Rt == instr[25:21] || out_reg_Rt == instr[20:16]) && out_reg_Rt != 0) ? 3'b000 : 3'b111;
  
  // register file
  RegisterFile cut_reg_file(instr[25:21] , instr[20:16] , writeReg , writeData , clk , RegWriteFinal , out_data1 , out_data2);
  
  Reg32 cut_reg_data1(clk , rst , 1'b1 , out_data1 , data1_reg_out);
  Reg32 cut_reg_data2(clk , rst , 1'b1 , out_data2 , data2_reg_out);
  
  // sign_extend
  Reg32 cut_reg_sign_extend(clk , rst , 1'b1 , sign_extend_data , out_reg_sign_extend);
  
  // Rs , Rt , Rd
  Reg5 cut_reg_Rs(clk , rst , 1'b1 , instr[25:21] , out_reg_Rs);
  Reg5 cut_reg_Rt(clk , rst , 1'b1 , instr[20:16] , out_reg_Rt);
  Reg5 cut_reg_Rd(clk , rst , 1'b1 , instr[15:11] , out_reg_Rd);

  // ALU controll signals
  ALUcontroller cut_alu_controller(instr[31:26] , ALUop , out_reg_ALUop);

  // Controll signals for next stages
  Reg1 cut_reg_regWrite(clk , rst , 1'b1 , RegWrite , out_reg_RegWrite);
  Reg1 cut_reg_ALUSrc(clk , rst , 1'b1 , ALUSrc , out_reg_ALUSrc);
  Reg1 cut_reg_regDst(clk , rst , 1'b1 , regDst , out_reg_regDst);
  Reg1 cut_reg_memWrite(clk , rst , 1'b1 , memWrite , out_reg_memWrite);
  Reg1 cut_reg_memRead(clk , rst , 1'b1 , memRead , out_reg_memRead);
  Reg1 cut_reg_memtoReg(clk , rst , 1'b1 , memtoReg , out_reg_memtoReg);
  
  // Jump
  assign jump_address = {pc[31:28] , instr[25:0] , 2'b0};
  
  // opCode for controller
  assign opCode = instr[31:26];
  
  // Equal needed for beq 
  assign equal = (out_data1 == out_data2) ? 1'b1 : 1'b0;
  
  // beq address
  assign branch_address = ((sign_extend_data << 2) + (pc));

endmodule


