`timescale 1ns/1ns
module register_file(input clk, rst, RegWrite, input[4:0] r1, r2, w, input[31:0] wdata, output reg[31:0] rdata1, rdata2);
  integer i;
  reg[31:0] R[31:0];
  
  
  always@(negedge clk) begin
    rdata1 = R[r1];
    rdata2 = R[r2];
  end
  
  always@(clk, rst, RegWrite, r1,  r2, w, wdata) begin
    R[0] <= 32'b0;
  end
  
  always@(posedge clk, posedge rst, RegWrite, w, wdata) begin
    if(rst) begin
      for(i=0;i<32;i=i+1) begin
        R[i] <= 32'b0;
      end
    end
    
    else if(RegWrite) 
      R[w] = wdata;
    R[0] = 32'b0;
  end
endmodule