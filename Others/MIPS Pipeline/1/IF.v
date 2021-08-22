`timescale 1ns/1ns
module IF(opcode, rs, rt, rd, immediate, func, eq, jmp, beq, bne, PCwrite, awrite, clk);
	
	output [5:0] opcode;
	output [4:0] rs, rt, rd;
	output [15:0] immediate;
	output [5:0] func;
 	input eq, jmp, beq, bne, PCwrite, awrite, clk;
	
	wire [31:0] address, instruction;
	wire [25:0] jmp_address;
	wire aclr;
	
	assign aclr = jmp | (eq & beq) | (~eq & bne);
	IF_ID IF_ID (jmp_address, opcode, rs, rt, rd, immediate, func, instruction, awrite, aclr, clk);
	IM IM (instruction, address);
	PC PC (address, jmp_address, immediate, eq, jmp, beq, bne, PCwrite, clk);
endmodule

