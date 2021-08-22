
`timescale 1ns/1ns
module DataPath (
	input clk, rst, 
	// from controller:
	input pcSrc, pcld, addrSrc, wrSrc, rden, wren, IRld, DZorDC, MARSrc, MARld, MDRld,
			ACCld, CYld,
	input [1:0] ALUop, Asrc, Bsrc, ACCsrc, CYsrc,
	// to controller:
	output [11:0] inst,
	output zero, nzCY, nzACC
);
	wire [11:0] ALUout, address, pcIn, pcOut, 
				addrIn, ACCOut, writeData, readData,
				MDROut, mux_4Out, MARIn, 
				ALUa, ALUb, ACCin;
	wire zeroRegIn;

	MUX2 #(12) mux_1 (ALUout, address, pcSrc, pcIn);

	Register #(12) pc (clk, rst, pcld, pcIn, pcOut);

	MUX2 #(12) mux_2 (address, pcOut, addrSrc, addrIn);

	MUX2 #(12) mux_3 (ALUout, ACCOut, wrSrc, writeData);

	memory mem (clk, rst, rden, wren, addrIn, writeData, readData);
	
	Register #(12) IR (clk, rst, IRld, readData, inst);
	Register #(12) MDR (clk, rst, MDRld, readData, MDROut);

	MUX2 #(12) mux_4 ({5'b0, inst[6:0]}, {pcOut[11:7], inst[6:0]}, DZorDC, mux_4Out);
	MUX2 #(12) mux_5 (mux_4Out, readData, MARSrc, MARIn);
	Register #(12) MAR (clk, rst, MARld, MARIn, address);

	MUX4 #(12) mux_a (ACCOut, 12'd1, 12'd2, 12'bz, Asrc, ALUa);
	MUX4 #(12) mux_b (pcOut, MDROut, address, 12'd1, Bsrc, ALUb);

	ALU alu (ALUa, ALUb, ALUop, ALUout, CY, zeroRegIn);
	Register #(1) zeroReg (clk, rst, 1, zeroRegIn, zero);

	MUX4 #(12) mux_acc (12'd0, ALUout, {CY, ACCOut[11:1]}, {ACCOut[10:0], CY}, ACCsrc, ACCin);
	Register #(12) ACC (clk, rst, ACCld, ACCin, ACCOut);
	assign ACCSign = ACCOut[11];
	assign nzACC = |{ACCOut};

	MUX4 #(1) mux_cy (0, CY, ACCOut[0], ACCOut[11], CYsrc, CYin);
	Register #(1) CYreg (clk, rst, CYld, CYin, CYout);
	assign nzCY = CYout;
endmodule
