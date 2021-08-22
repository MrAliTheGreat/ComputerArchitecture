module DataMem(address, writedata, memread, memwrite, clk, readdata,mem1, mem2, rst);
input [31:0] address, writedata;
input memread, memwrite, clk, rst; 
output reg [31:0] readdata;
output reg [31:0] mem1, mem2;
    reg [31:0] mem [0:2047];
    always @(posedge rst) begin
        $readmemb("datamem.txt",mem);
    end
    always @(posedge clk, posedge rst ) begin
        if (rst == 1'b1)
            readdata <= 32'b0;  
        if (memwrite == 1'b1)
            mem[address>>2] <= writedata;
    end
    always @(memread, address) begin
        if (memread == 1'b1)
            readdata = mem[address>>2];        
    end
    always @(mem) begin
        mem1 = mem[500];
        mem2 = mem[501];
    end
endmodule
