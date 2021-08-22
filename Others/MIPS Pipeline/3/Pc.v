module Pc (in, ld, clk, rst, out);
input [31:0] in; 
input clk, rst, ld; 
output reg [31:0] out;

    always @(posedge clk , posedge rst ) begin
        if (rst == 1'b1)
            out <= 32'b0;
        else if (ld == 1'b1)
            out <= in;
    end
endmodule
