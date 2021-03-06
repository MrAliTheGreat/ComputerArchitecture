`timescale 1ns/1ns
module Controller(input [5:0] x , input [6:0] y , input clk , rst , start , output reg ready , ldx , ldy , ldp , rst_p , shift_p , shift_y , output reg [5:0] x_adder);
  reg [1:0] ns , ps;
  integer counter;
  
  always @(posedge clk) begin
    ps <= ns;
  end 
  
  always @(ps , start , counter) begin
    case(ps)
      2'b00: ns = start ? 2'b01 : 2'b00;
      2'b01: ns = 2'b10;
      2'b10: ns = 2'b11;
      2'b11: ns = (counter == 6)? 2'b00 : 2'b10;
      default ps = 2'b00;
    endcase
  end
  
  always @(ps) begin
    {ldx , ldy , ldp , rst_p , shift_p , shift_y , ready} = 7'b0;
    case(ps)
      2'b00: ready = 1;
      2'b01: begin
        ldx = 1;
        ldy = 1;
        rst_p = 1;
        counter = 0;
      end
      2'b10: begin
        ldp = 1;
        if({y[1] , y[0]} == 2'b10)
          x_adder = ~x + 1;
        else if({y[1] , y[0]} == 2'b01)
          x_adder = x;
        else
          x_adder = 6'b0;
      end
      2'b11: begin 
      shift_p = 1;
      shift_y = 1;
      counter = counter + 1;
      end
      default ps = 2'b00;
    endcase
  end
endmodule
