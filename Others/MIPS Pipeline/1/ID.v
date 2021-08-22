`timescale 1ns/1ns
module ID (ID_EX_rs_content, ID_EX_rt_content, ID_EX_immediate, ID_EX_rs, ID_EX_rt, ID_EX_rd, ID_EX_ALUop, eq, jmp, beq, bne, PCwrite, awrite, ID_EX_ALUsrc, ID_EX_dst, ID_EX_memread, ID_EX_memwrite, ID_EX_memtoreg, ID_EX_regwrite, M_WB_write_data, immediate, opcode, func, rs, rt, rd, M_WB_write_reg, M_WB_regwrite, clk); 
  
  output [31:0] ID_EX_rs_content, ID_EX_rt_content, ID_EX_immediate;
  output [4:0] ID_EX_rs, ID_EX_rt, ID_EX_rd;
  output [2:0] ID_EX_ALUop;
  output eq, jmp, beq, bne, PCwrite, awrite, ID_EX_ALUsrc, ID_EX_dst, ID_EX_memread, ID_EX_memwrite, ID_EX_memtoreg, ID_EX_regwrite;
  input [31:0] M_WB_write_data;
  input [15:0] immediate;
	input [5:0] opcode, func;
	input [4:0] rs, rt, rd, M_WB_write_reg;
	input M_WB_regwrite, clk;
	
	wire [31:0] rs_content, rt_content;
	wire [2:0] ALUop;
	wire ctrl, ALUsrc, dst, memread, memwrite, memtoreg, regwrite;
	
	RF RF (rs_content, rt_content, eq, rs, rt, M_WB_write_reg, M_WB_write_data, clk, M_WB_regwrite);
	CTRL CTRL (jmp, beq, bne, ALUsrc, dst, memread, memwrite, memtoreg, regwrite, ALUop, opcode, func);
	HZRD HZRD (awrite, PCwrite, ctrl, ID_EX_rt, rs, rt, ID_EX_memread, jmp, dst, memwrite, beq, bne);
	ID_EX ID_EX (ID_EX_rs_content, ID_EX_rt_content, ID_EX_immediate, ID_EX_rs, ID_EX_rt, ID_EX_rd, ID_EX_ALUop,
	             ID_EX_ALUsrc, ID_EX_dst, ID_EX_memread, ID_EX_memwrite, ID_EX_memtoreg, ID_EX_regwrite, rs_content, rt_content,
	             immediate, rs, rt, rd, ALUop, ALUsrc, dst, memread, memwrite, memtoreg, regwrite, ctrl, clk); 
endmodule
	
	


