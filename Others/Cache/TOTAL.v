module Total(input clk,rst,input [14:0] addr,output done,cachHit);
    wire [1:0] offset;
    wire [2:0] cacheTag;
    wire miss,ready,write,cacheValid,dataEnable,hit;
    wire [31:0] data;
    wire [14:0] cacheAddr;
    assign cacheAddr = addr + offset;
    MainMemory main_memory(addr,offset,miss,
               data,ready);
    Cache cache(clk,rst,data,cacheAddr,write,cacheTag,cacheValid);
    assign dataEnable = (addr[14:12] == cacheTag) ? 1'b1 : 1'b0;
    assign hit = cacheValid & dataEnable;
    Controller controller(clk, rst, hit, ready,done,miss, write,cachHit,offset); 
endmodule
