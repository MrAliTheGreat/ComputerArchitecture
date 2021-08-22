`timescale 1ns/1ns
module Reg2(input clk, rst, ld, input [1:0] in, output reg [1:0] out);
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			out <= 2'b0;
		end else begin
			out <= ld ? in : out;
		end
	end
endmodule

