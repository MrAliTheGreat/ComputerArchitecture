module Memory(input clk, MemRead , MemWrite, rst,input [31:0]writeData, input[31:0]Address, output[31:0] ReadData);
	reg[31:0] mem[0:4095];
	integer counter;
	initial begin
		#1000
		$readmemh("./instructions.hex",mem,0);
      	$readmemh("./data.hex",mem,250);
		$monitor(mem[500],mem[501]);
	end
	assign ReadData = MemRead ? mem[Address[31:2]] : 32'bZ;	
	always @(posedge clk , posedge rst)begin
    		if(rst)begin
			for(counter = 0;counter < 4096;counter = counter + 1)
				mem[counter] <= 32'b0;
		end
		if(MemWrite)
			mem[Address[31:2]] <= writeData;
	end
endmodule
