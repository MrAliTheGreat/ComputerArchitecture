`timescale 1ns/1ns
module TestBench();
  reg clk = 1'b0 , rst = 1'b0;
  MIPS_Pipeline cut_MIPS(clk , rst);
  always #10 clk =~ clk; 
  initial begin
    rst = 1'b1;
    #40 rst = 1'b0;
    #20000
    $stop;
end
endmodule

