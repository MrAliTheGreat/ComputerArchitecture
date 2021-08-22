module RegFile (readreg1, readreg2, writereg, clk, rst, regwrite, writedata, readdata1, readdata2);
input [4:0] readreg1, readreg2, writereg;
input clk, regwrite, rst;
input [31:0] writedata; 
output reg [31:0] readdata1, readdata2;

    integer i;
    reg [31:0] R [0:31];
    always @(posedge rst) begin
        for (i = 0; i < 32; i = i + 1)
            R[i] = 32'b0;
    end
    always @(negedge clk) begin
        readdata1 <= R[readreg1];
        readdata2 <= R[readreg2];
    end
    always @(posedge clk) begin
        if(regwrite == 1'b1)
            if(writereg != 5'b00000)
                R[writereg] <= writedata;
    end
endmodule
