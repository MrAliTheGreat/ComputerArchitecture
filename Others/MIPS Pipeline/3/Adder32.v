module Adder32(A,B, sum);
input [31:0] A, B;
output [31:0] sum;
    assign sum = A + B;
endmodule 