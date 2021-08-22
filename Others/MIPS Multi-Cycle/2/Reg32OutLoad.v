module Reg32OutLoad(input[31:0] parIn , input rst,clk, output reg[31:0] out);
	always@(posedge clk , posedge rst)begin
		if(rst) out <= 32'b0;
		else out <= parIn;
	end
endmodule
