`timescale 1ns/1ns
module Shift_register_12_bit(input clk , rst , load , shift_en , shift_value , input [5:0] serIn , output reg [11:0] Q);
  always @ (posedge clk , posedge rst) begin
    if(rst) Q <= 12'b0;
    else
      if(load) Q[11:6] <= serIn;
      if(shift_en) Q <= {shift_value , Q[11:1]};
  end
  
endmodule
