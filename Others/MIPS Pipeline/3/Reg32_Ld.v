module Reg32_Ld(clk, rst, clr, ld, in, out);
input clk, rst, ld, clr;
input [31:0] in;
output reg [31:0] out;

    always @(posedge clk , posedge rst) begin
        if(rst == 1'b1)
            out <= 32'b0;
        else if(clr == 1'b1)
            out <= 32'b0;
        else if(ld == 1'b1)
            out <= in;
    end
endmodule