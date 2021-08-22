module ALU(input[31:0] A,input[31:0] B,input[2:0] AluOperation,output zero,output reg[31:0] out);
	assign zero = (out == 0) ? 1'b1 : 1'b0;
	always@(A , B , AluOperation) begin
		case(AluOperation)
			3'b000: out = A & B;
			3'b001: out = A | B;
			3'b010: out = A + B;
			3'b110:	out = A - B;
			3'b111: out = (A < B) ? 1 : 0;
			default: out = 0;
		endcase
	end
endmodule
