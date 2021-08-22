`timescale 1ns/1ns
module IFID(
  input clk, rst, flush,
  input[31:0] pcin, instin
  );
  
  reg[31:0] pc, inst; 
  
  always@(posedge clk, posedge rst) begin
    if(rst | flush) begin
      pc = 32'b0;
      inst = 32'b0;
    end
    else begin
      pc = pcin;
      inst = instin;
    end
  end
endmodule
