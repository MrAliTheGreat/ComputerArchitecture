module RF (
	output reg [31:0] rs_content, rt_content,
	output reg eq,
	input [4:0] rs, rt, write_reg,
	input [31:0] write_data,
	input clk, regwrite
);

	reg [31:0] registers [31:0];
	initial begin
		$readmemb("registers.txt", registers);
	end
	
	always@(write_reg, write_data, regwrite)begin
		if(clk & regwrite & (write_reg != 5'd0)) begin
		  registers[write_reg] <= write_data;		  
		end
	end

	always@(negedge clk)begin
	  $writememb("registers.txt", registers);
	  rs_content <= registers[rs];
		rt_content <= registers[rt];
	end
	
	always@(rs_content, rt_content)begin
	 	if(rs_content == rt_content) eq <= 1'b1;
		else eq <= 1'b0;
	end
	
endmodule


