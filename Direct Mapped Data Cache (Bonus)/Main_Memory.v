`timescale 1ns/1ns
module MainMemory(input main_mem_miss , input [1:0] offset , input [14:0] address , output main_mem_ready , output [31:0] main_mem_data);
  // 32k = 32 * 1024 = 32768
  reg [31:0] main_memory [0:32767];
  integer adr , data;
    
  initial begin: Main_Mem_Fill
    data = 1;
    // 8k -> 8192 -> 1024 to 9215
    for (adr = 1024 ; adr <= 9215 ; adr = adr + 1) begin
      main_memory[adr] = data;
      data = data + 1;
    end
  end
  
  assign main_mem_data = main_memory[address + offset];
  assign main_mem_ready = main_mem_miss;
  
endmodule
