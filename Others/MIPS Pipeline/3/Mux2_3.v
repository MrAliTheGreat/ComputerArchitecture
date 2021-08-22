module Mux2_2 (in0, in1, sel, out);
input [1:0] in0, in1;
input  sel;
output [1:0] out;

    assign out = (sel == 1'b0) ? in0 : in1 ;
endmodule 

