`timescale 1ns/1ns
module PC (
  output reg [31:0] address, 
  input [25:0] jmp_address,
  input [15:0] cond_offset,
  input eq, jmp, beq, bne, PCwrite, clk
);
	reg signed [31:0] s_cond_offset;
	initial address = 32'b0;
	
	always@(cond_offset) s_cond_offset = {{14{cond_offset[15]}}, cond_offset, 2'b0};
	
	always@(posedge clk)begin
  		if(PCwrite)begin
 			if(jmp) address <= {address[31:28],jmp_address,2'b0};
 			else if((eq&beq)|(~eq&bne)) address <= address + s_cond_offset;
 			else address <= address + 32'd4;
  		end
  	end
endmodule

