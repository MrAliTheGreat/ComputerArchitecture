`timescale 1ns/1ns
module Register_6_bit(input clk , rst , load, input [5:0] serIn , output reg [5:0] Q);
  always @ (posedge clk , posedge rst) begin
    if(rst) Q <= 6'b0;
    else
      if(load) Q <= serIn;
  end
endmodule
