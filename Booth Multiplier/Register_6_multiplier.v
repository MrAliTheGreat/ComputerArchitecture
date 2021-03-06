`timescale 1ns/1ns
module Register_6_multiplier(input clk , rst , load , shift_en , input [5:0] serIn , output reg [6:0] Q);
  always @ (posedge clk , posedge rst) begin
    if(rst) Q <= 7'b0;
    else
      if(load) Q <= {serIn , 1'b0};
      if(shift_en) Q <= {1'b0 , Q[6:1]}; 
  end

endmodule

