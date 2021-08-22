`timescale 1ns/1ns
module allMemories(input clk , rst , C_write_cache , C_main_mem_miss , input [1:0] C_offset , input[14:0] address , 
                  output cache_valid , main_mem_ready , is_wanted_data);
  
  wire [2:0] cache_tag;
  wire [31:0] mem_data;
  
  Cache cut_cache(clk , rst , C_write_cache , address + C_offset , mem_data , cache_valid , cache_tag);
  MainMemory cut_main_mem(C_main_mem_miss , C_offset , address , main_mem_ready , mem_data);
  
  assign is_wanted_data = (cache_tag == address[14:12]) ? 1'b1 : 1'b0;
  
endmodule
