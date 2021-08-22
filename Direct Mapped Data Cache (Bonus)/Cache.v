`timescale 1ns/1ns
module Cache(input clk , rst , write , input [14:0] address , input [31:0] data , output valid , output [2:0] tag);
    // 4k-> cache = 12 bit num blocks , 32k -> main memory = tag -> 32 / 4 = 8 -> 3 bits  --> 12 + 3 = 15 bit address
  reg [31:0] cache [0:4095];
  reg [2:0] tag_cache [0:4095];
  
  reg [0:4095] valid_cache;
  
  always@(posedge clk , posedge rst) begin
    if(rst)
      valid_cache <= 4096'b0;
    else if(write) begin
      cache[address[11:0]] <= data;
      tag_cache[address[11:0]] <= address[14:12];
      valid_cache[address[11:0]] <= 1'b1;
    end
  end
  
  assign tag = rst ? 3'b000 : tag_cache[address[11:0]];
  assign valid = valid_cache[address[11:0]];
  
endmodule
