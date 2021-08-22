`timescale 1ns/1ns
module Reg1(input clk, rst, ld, in, output reg out);
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			out <= 1'b0;
		end else begin
			out <= ld ? in : out;
		end
	end
endmodule


