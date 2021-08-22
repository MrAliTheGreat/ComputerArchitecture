`timescale 1ns/1ns
module IF_ID_Stage(input clk , rst , ld_pc , ld_reg_instrIFID , input [1:0] pcSrc , input [31:0] out_pc , output [31:0] out_reg_instrIFID , out_reg_pcIFID);
  wire [31:0] out_instr_mem;
  wire clearIFID;
  
  InstructionMemory cut_instr_mem(out_pc , out_instr_mem);
                      
  assign clearIFID = (pcSrc != 0) ? 1'b1 : 1'b0;
  Reg32_clear reg_instr(clk , rst , ld_reg_instrIFID , clearIFID , out_instr_mem , out_reg_instrIFID);
  Reg32 reg_pc_IFID(clk , rst , ld_pc , out_pc + 4 , out_reg_pcIFID);
  
endmodule


