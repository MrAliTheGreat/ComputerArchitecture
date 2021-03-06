`timescale 1ns/1ns
module Circuit(input clk , rst , input[14:0] address , output hit_OUT , finish_OUT);
  
  wire C_write_cache , C_main_mem_miss , cache_valid , main_mem_ready , is_wanted_data;
  wire [1:0] C_offset;
  
  allMemories cut_memories(clk , rst , C_write_cache , C_main_mem_miss , C_offset , address , 
                           cache_valid , main_mem_ready , is_wanted_data);
  
  Controller cut_controller(clk , rst , is_wanted_data & cache_valid , main_mem_ready , C_offset , 
                            finish_OUT , hit_OUT , C_main_mem_miss , C_write_cache);
  
endmodule
