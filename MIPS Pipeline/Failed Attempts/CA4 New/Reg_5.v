`timescale 1ns/1ns
module Reg5(input clk, rst, ld, input [4:0] in, output reg [4:0] out);
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			out <= 5'b0;
		end else begin
			out <= ld ? in : out;
		end
	end
endmodule


