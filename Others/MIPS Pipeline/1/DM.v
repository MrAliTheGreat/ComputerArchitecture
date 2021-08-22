`timescale 1ns/1ns
module DM (read_data, address, write_data, memread, memwrite, clk);
  
  output reg [31:0] read_data;
  input [31:0] address, write_data;
  input memread, memwrite, clk;

	reg [31:0] memory [511:0];
	initial begin
		$readmemb("memory.txt", memory);
	end
	
	always@(address, write_data, memwrite)begin
		if(clk & memwrite) memory[address/4] <= write_data;
	end
	
	always@(negedge clk)begin
	  $writememb("memory.txt", memory);
	  if(memread) read_data <= memory[address/4];
	end
	
endmodule