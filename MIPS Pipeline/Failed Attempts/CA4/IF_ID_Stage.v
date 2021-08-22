`timescale 1ns/1ns
module IF_ID_Stage(input clk , rst , clearIFID , input [2:0] lw_hazard , input [31:0] current_pc , output [31:0] instr_reg_out , pc_reg_out);
  wire [31:0] out_instr_mem;
  
  InstructionMemory cut_instr_mem(current_pc , out_instr_mem);
  Reg32_clear reg_instr(clk , rst , lw_hazard[2] , clearIFID , out_instr_mem , instr_reg_out);
  Reg32_clear reg_pc(clk , rst , lw_hazard[1] , clearIFID , current_pc + 4 , pc_reg_out);
  
endmodule
