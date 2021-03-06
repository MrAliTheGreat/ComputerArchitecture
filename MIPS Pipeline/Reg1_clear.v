`timescale 1ns/1ns
module Reg1_clear(input clk, rst, ld , clear , in, output reg out);
	always @(posedge clk, posedge rst) begin
		if(clear) begin
		  // Change z to 0 at the end of project
		  out <= 1'b0;
		end else begin
		  if(rst) begin
			 out <= 1'b0;
		  end else begin
			 out <= ld ? in : out;
		  end
	  end
	end
endmodule


