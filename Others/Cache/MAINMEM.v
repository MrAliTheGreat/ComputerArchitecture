module MainMemory(input [14:0] addr,input [1:0] offset,input miss,
                  output [31:0] data,output ready);
    reg [31:0] memory [32000:0];
    assign data = memory[addr+offset];
    assign ready = miss;
    
    initial begin: TEST
        integer i;
        for (i = 1024; i < 9024;i = i+1) begin
            memory[i] = i - 1023;
        end
    end
endmodule
 