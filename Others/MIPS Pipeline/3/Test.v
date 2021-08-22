module Test();
    reg clk,rst;
    wire [31:0] mem1, mem2;
    PipeLine CUT(clk, rst, mem1, mem2);
    initial begin
        forever begin
        clk=0;
        #100
        clk=1;
        #100
        clk=0;
        end
    end
    initial begin
    rst = 1'b1;
    #400 rst = 1'b0;
   #50000   $stop;
 end
endmodule 
