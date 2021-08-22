`timescale 1ns/1ns
module Register(input clk, rst, input [31:0] in, output reg [31:0] out);
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			out <= 32'b0;
		end else begin
			out <= in;
		end
	end
endmodule

