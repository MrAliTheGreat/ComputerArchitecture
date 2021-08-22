`timescale 1ns/1ns
module Reg32_clear(input clk, rst, ld , clear , input [31:0] in, output reg [31:0] out);
	always @(posedge clk, posedge rst) begin
		if(clear)
		  // Change z to 0 at the end of project
		  out <= 32'bz;
		else begin
		  if(rst) begin
			 out <= 32'b0;
		  end else begin
			 out <= ld ? in : out;
		  end
	  end
	end
endmodule

