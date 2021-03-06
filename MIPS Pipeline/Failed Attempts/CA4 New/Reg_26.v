`timescale 1ns/1ns
module Reg26(input clk, rst, ld, input [25:0] in, output reg [25:0] out);
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			out <= 26'b0;
		end else begin
			out <= ld ? in : out;
		end
	end
endmodule

