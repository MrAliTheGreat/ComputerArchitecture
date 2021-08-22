module TB();
  reg clk, rst;
  mips mp(.rst(rst), .clk(clk));
 
  initial begin
    rst = 1'b1;
    #100
    clk = 1'b0;
    rst = 1'b0;
    #1500
    repeat(2000) #150 clk = ~clk;
    
  end
endmodule
