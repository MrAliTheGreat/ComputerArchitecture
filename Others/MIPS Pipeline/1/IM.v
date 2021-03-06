`timescale 1ns/1ns
module IM (
	output reg [31:0] instruction,
	input [31:0] address
	);
	reg [31:0] instructions [255:0];
	initial $readmemb("instructions2.txt",instructions);
	always@(address)begin
		instruction = instructions[address/4];
	end
endmodule

