`timescale 1ns/1ns
module Reg3_clear(input clk, rst, ld , clear , input [2:0] in, output reg [2:0] out);
	always @(posedge clk, posedge rst) begin
		if(clear) begin
		  // Change z to 0 at the end of project
		  out <= 3'bz;
		end else begin
		  if(rst) begin
			 out <= 3'b0;
		  end else begin
			 out <= ld ? in : out;
		  end
	  end
	end
endmodule


