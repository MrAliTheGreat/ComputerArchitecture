module testbench();
  reg clk=1,rst=0;
  MIPS UT(clk,rst);
always #10 clk=~clk;  
initial begin
  rst=1;
  #21 rst=0;
  #1200
  $stop;
end
endmodule
