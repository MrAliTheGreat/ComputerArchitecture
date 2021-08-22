module TestBench();
    reg clk = 0,rst;
    wire done;
    wire cachHit;
    wire [14:0] addr;
    Total uut(clk,rst,addr,done,cachHit);
    always #50 clk = ~clk;
    integer i = 1024;
    assign addr = i;
    initial begin: TB
        rst = 1;
        #100
        rst = 0;
        #50
        while (i < 9024) begin
            #100;
            if (done == 1) begin
                i = i+1;
            end
        end
        #1000
        $stop;
    end
endmodule