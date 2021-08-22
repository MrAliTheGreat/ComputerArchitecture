`timescale 1ns/1ns
module Reg3(input clk, rst, ld, input [2:0] in, output reg [2:0] out);
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			out <= 3'b0;
		end else begin
			out <= ld ? in : out;
		end
	end
endmodule






