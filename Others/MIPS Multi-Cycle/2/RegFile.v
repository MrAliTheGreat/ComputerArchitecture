module RegFile(input[4:0] r1,input[4:0] r2,input[4:0] rw,input clk,rst,regWrite,input[31:0] wd,output[31:0] rd1,output[31:0] rd2);
	reg[31:0] Reg[0:31];
	integer counter;
	assign rd1 = Reg[r1];
	assign rd2 = Reg[r2];
	always@(posedge clk,posedge rst) begin
		if(rst) begin
			for(counter = 0;counter < 32;counter = counter + 1)
				Reg[counter] <= 32'b0;
		end
		if(regWrite) begin
			if (rw != 0)          
                		Reg[rw] <= wd;
           		else
                		Reg[rw] <= 32'b0;
		end
	end
endmodule
