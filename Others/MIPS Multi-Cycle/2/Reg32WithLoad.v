module Reg32WithLoad(input[31:0] parIn , input ld,clk,rst , output reg[31:0] out);
	always@(posedge clk , posedge rst) begin
		if(rst) out <= 32'b0;
		else if(ld) out <= parIn;
		else out <= out;
	end
endmodule
