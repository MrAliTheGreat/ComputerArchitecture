module Shift2b32(input[31:0] in,output[31:0] out);
	assign out = {in[29:0] , 2'b00};
endmodule
