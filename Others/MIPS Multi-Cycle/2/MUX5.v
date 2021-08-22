module MUX5(input[4:0] s0 , input[4:0] s1 , input s , output[4:0] out);
	assign out = s ? s1 : s0;
endmodule
