module Reg5 (clk, rst, in, out);
input clk, rst;
input [4:0] in;
output reg [4:0] out;

    always @(posedge clk , posedge rst) begin
        if(rst == 1'b1)
            out <= 5'b0;
        else
            out <= in;
    end

endmodule