module Reg2(clk, rst, in, out);
input clk, rst;
input [1:0] in;
output reg [1:0] out;

    always @(posedge clk , posedge rst) begin
        if(rst == 1'b1)
            out <= 2'b0;
        else
            out <= in;
    end

endmodule