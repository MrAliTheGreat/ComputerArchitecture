
`timescale 1ns/1ns
module memory (
	input clk, rst, rden, wren, input [11:0] addr, writeData, output [11:0] readData
);
	reg [11:0] data [0:4095];
	// assign readData = data[addr];
	assign readData = rden ? data[addr] : 12'bz;

	always @(posedge clk, posedge rst) begin
		if(rst) begin
			for (int i = 0; i <= 4095; i = i + 1) begin
				data[i] <= 11'd0;
			end
			for (int i = 100; i < 110; i = i + 1) begin
				data[i] <= i-90;
			end
			for (int i = 200; i < 210; i = i + 1) begin
				data[i] <= i-190;
			end
			data[125] <= 12'd100;
			data[126] <= 12'd200;
			data[127] <= 12'd300;

			data[0] <= {3'b001, 1'b1, 1'b0, 7'd125};
			data[1] <= {3'b001, 1'b1, 1'b0, 7'd126};
			data[2] <= {3'b011, 1'b1, 1'b0, 7'd127};

			data[3] <= {3'b010, 1'b0, 1'b0, 7'd125};
			data[4] <= {3'b010, 1'b0, 1'b0, 7'd126};
			data[5] <= {3'b010, 1'b0, 1'b0, 7'd127};

			data[6] <= {3'b100, 1'b0, 1'b0, 7'd0};

		end else begin
			data[addr] <= wren ? writeData : data[addr];
		end
	end
endmodule
