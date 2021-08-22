module InstMem (address, ins, rst);
input rst;
input [31:0] address; 
output [31:0] ins;

    reg [31:0] mem [0:64];

    always @(posedge rst) begin
        $readmemb("mem.txt", mem);
    end
    assign ins = mem[address>>2];
endmodule 