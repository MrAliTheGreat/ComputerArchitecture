
`timescale 1ns/1ns
module Controller (
	input clk, rst, 
	// from controller
	output reg pcSrc, pcld, addrSrc, wrSrc, rden, wren, IRld, DZorDC, MARSrc, MARld, MDRld,
			ACCld, CYld,
	output reg [1:0] ALUop, Asrc, Bsrc, ACCsrc, CYsrc,
	// to controller:
	input [11:0] inst,
	input zero, nzCY, nzACC
);
	reg [4:0] ps, ns;
	always@(posedge clk, posedge rst) begin
		if(rst)
			ps <= 5'd0;
		else 
			ps <= ns;
	end
	always@(ps, inst, zero, nzACC, nzCY) begin 
		{pcSrc, pcld, addrSrc, wrSrc, rden, wren, IRld, DZorDC, MARSrc, MARld, MDRld, ACCld, CYld} <= 13'b0;
		ns <= 5'd0;
		case(ps)
			5'd0: begin // IF
				{addrSrc, rden, IRld} <= 3'b111;
				ns <= 5'd20;
			end
			5'd20: begin // Group decode
				ns <= &{inst[11:9]} ?  
				( 
					inst[8] == 1'b0 ? 5'd30 : // group 1
					5'd30 // group 2
				) : // group 0
				(
					inst[8:7] == 2'b00 ? 5'd4 : // zero page addressing
					inst[8:7] == 2'b01 ? 5'd3 : // current page addressing
					inst[8:7] == 2'b10 ? 5'd2 : // indirect zero page addressing
					5'd1 // indirect current page addressing
				);
			end
			5'd1: begin // group 0, indirect current page addressing
				ns <= 5'd5;
				{DZorDC, MARSrc, MARld} <= 3'b101;
			end
			5'd2: begin // group 0, indirect zero page addressing
				ns <= 5'd5;
				{DZorDC, MARSrc, MARld} <= 3'b001;
			end
			5'd3: begin // group 0, current page addressing
				ns <= 5'd6;
				{DZorDC, MARSrc, MARld} <= 3'b001;
			end
			5'd4: begin // group 0, zero page addressing
				ns <= 5'd6;
				{DZorDC, MARSrc, MARld} <= 3'b101;
			end
			5'd5: begin 
				ns <= 5'd6;
				{addrSrc, rden, MARSrc, MARld} <= 4'b0111;
			end
			5'd6: begin // ID
				{addrSrc, rden, MDRld} <= 3'b011;
				ns <= 	inst[11:9] == 3'b000 ? 5'd7 : // and
						inst[11:9] == 3'b001 ? 5'd8 : // add
						inst[11:9] == 3'b010 ? 5'd9 : // isz
						inst[11:9] == 3'b011 ? 5'd10 : // dca
						inst[11:9] == 3'b100 ? 5'd11 : // jmp
						inst[11:9] == 3'b101 ? 5'd13 : // jms
						5'd0;
			end
			5'd7: begin // and
				ns <= 5'd13;
				Asrc <= 2'd0;
				Bsrc <= 2'd1;
				ALUop <= 2'b00;
				ACCld <= 1'b1;
				ACCsrc <= 2'd1;
			end
			5'd8: begin // add
				ns <= 5'd13;
				Asrc <= 2'd0;
				Bsrc <= 2'd1;
				ALUop <= 2'b01;
				ACCld <= 1'b1;
				ACCsrc <= 2'd1;
				CYld <= 1'b1;
				CYsrc <= 2'd1;
			end
			5'd9: begin // isz
				ns <= zero == 1'b0 ? 5'd13 : 5'd14;
				Asrc <= 2'd1;
				Bsrc <= 2'd1;
				ALUop <= 2'b01;
				wrSrc <= 1'b0;
				addrSrc <= 1'b0;
				wren <= 1'b1;
			end
			5'd10: begin // dca
				ns <= 5'd15;
				addrSrc <= 1'b0;
				wren <= 1'b1;
				wrSrc <= 1'b1;
			end
			5'd11: begin // jmp
				ns <= 5'd0;
				pcSrc <= 1'b1;
				pcld <= 1'b1;
			end
			5'd12: begin // jms
				ns <= 5'd16;
				Asrc <= 2'd1;
				Bsrc <= 2'd0;
				wrSrc <= 1'b0;
				wren <= 1'b1;
				addrSrc <= 1'b1;
				ALUop <= 2'b01;
			end
			5'd13: begin // IncPC
				ns <= 5'd0;
				Asrc <= 2'd1;
				Bsrc <= 2'd0;
				pcld <= 1'b1;
				pcSrc <= 1'b0;
				ALUop <= 2'b01;
			end
			5'd14: begin // 
				ns <= 5'd0;
				Asrc <= 2'd2;
				Bsrc <= 2'd0;
				pcld <= 1'b1;
				pcSrc <= 1'b0;
				ALUop <= 2'b01;
			end
			5'd15: begin // 
				ns <= 5'd13;
				ACCsrc <= 2'd0;
				ACCld <= 1'b1;
			end
			5'd16: begin // 
				ns <= 5'd0;
				Asrc <= 2'd1;
				Bsrc <= 2'd2;
				ALUop <= 2'b01;
				pcSrc <= 1'b0;
				pcld <= 1'b1;
			end
		endcase
	end
endmodule

