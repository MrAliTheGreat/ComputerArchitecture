module test();
  reg clk,rst;
  PDP_8 U(clk,rst);
  always #5 clk=~clk;
  initial begin
  clk=1;
  rst=1;
  clk=0;
  #9 rst=0;
  #10000
  $stop;
end
endmodule
