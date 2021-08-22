`timescale 1ns/1ns
module DATAPATH (clk);
  input clk;
  
  wire [31:0] ID_rs_content, ID_rt_content, ID_immediate, EX_result, EX_write_data, M_data;
  wire [15:0] IF_immediate;
  wire [5:0] IF_opcode, IF_func;
  wire [4:0] IF_rs, IF_rt, IF_rd, ID_rs, ID_rt, ID_rd, EX_rd, M_rd;
  wire [2:0] ID_ALUop;
  wire ID_eq, ID_jmp, ID_beq, ID_bne, ID_PCwrite, ID_awrite,
       ID_ALUsrc, ID_dst, ID_memread, ID_memwrite, ID_memtoreg, ID_regwrite,
       EX_memread, EX_memwrite, EX_memtoreg, EX_regwrite, M_regwrite;
  
  IF IF (IF_opcode, IF_rs, IF_rt, IF_rd, IF_immediate, IF_func, ID_eq, ID_jmp, ID_beq, ID_bne, ID_PCwrite, ID_awrite, clk);
  ID ID (ID_rs_content, ID_rt_content, ID_immediate, ID_rs, ID_rt, ID_rd, ID_ALUop, ID_eq, ID_jmp, ID_beq, ID_bne, ID_PCwrite, ID_awrite, ID_ALUsrc, ID_dst, ID_memread, ID_memwrite, ID_memtoreg, ID_regwrite, M_data, IF_immediate, IF_opcode, IF_func, IF_rs, IF_rt, IF_rd, M_rd, M_regwrite, clk);
  EX EX (EX_result, EX_write_data, EX_rd, EX_memread, EX_memwrite, EX_memtoreg, EX_regwrite, ID_rs_content, ID_rt_content, ID_immediate, ID_rs, ID_rt, ID_rd, M_rd, M_data, M_regwrite, ID_ALUsrc, ID_ALUop, ID_dst, ID_memread, ID_memwrite, ID_memtoreg, ID_regwrite, clk);
  MEM MEM (M_data, M_rd, M_regwrite, EX_result, EX_write_data, EX_rd, EX_memread, EX_memwrite, EX_memtoreg, EX_regwrite, clk);
  
endmodule