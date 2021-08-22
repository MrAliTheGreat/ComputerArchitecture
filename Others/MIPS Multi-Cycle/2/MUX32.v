module MUX32(input[31:0] s0 , input[31:0] s1 , input s , output[31:0] out);
	assign out = s ? s1 : s0;
endmodule
