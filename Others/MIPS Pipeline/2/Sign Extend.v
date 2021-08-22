`timescale 1ns/1ns
module sign_extend(input[15:0] sein, output[31:0] seout);
  
  assign seout = {{16{sein[15]}}, sein};
  
endmodule
