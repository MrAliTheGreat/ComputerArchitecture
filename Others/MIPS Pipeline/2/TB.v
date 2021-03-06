`timescale 1ns/1ns
module TB();
  reg clk=0, rst=0;
  
  mips DP(clk, rst);
    
  always #(10) clk = ~clk;
  
  initial begin
    #10000
    $stop;
  end
  
  initial begin
    #2770
    rst=1;
    #275
    rst=0;
  end
  
  
endmodule

