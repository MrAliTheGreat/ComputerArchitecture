`timescale 1ns/1ns
module TestBench();
  reg clk = 1 , rst = 0;
  MIPS_Processor cut_MIPS(clk , rst);
  always #10 clk =~ clk; 
  initial begin
    rst = 1;
    #50 rst = 0;
    #20000
    $stop;
end
endmodule
