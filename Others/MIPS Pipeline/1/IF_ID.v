`timescale 1ns/1ns
module IF_ID(
  output reg [25:0] jmp_address,
	output reg [5:0] opcode,
	output reg [4:0] rs, rt, rd,
	output reg [15:0] immediate,
	output reg [5:0] func,
	input [31:0] instruction,
	input awrite, aclr, clk
	);
	always@(posedge clk)begin
		if(awrite)begin
		  jmp_address <= instruction[25:0];
			if(aclr) opcode <= 6'b111111;
			else opcode <= instruction[31:26];
			rs <= instruction[25:21];	
			rt <= instruction[20:16];
			rd <= instruction[15:11];
			immediate <= instruction[15:0];
			func <= instruction[5:0];	
		end
	end
endmodule

