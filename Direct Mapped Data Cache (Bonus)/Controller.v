`timescale 1ns/1ns
module Controller(input clk , rst , cache_hit , main_mem_ready , output reg [1:0] offset , 
                  output reg finish_OutSignal , hit_OutSignal , cache_miss , write_cache);
  
  reg [1:0] ps , ns , write_counter;
  
  always@(ps , cache_hit , main_mem_ready , write_counter)  begin
    ns = 2'b00;
    case(ps)
      // Start State
      2'b00: ns = cache_hit ? 2'b11 : 2'b01;
      // Missed State
      2'b01: ns = main_mem_ready ? 2'b10 : 2'b01;
      // 4 Writes States
      2'b10: ns = (write_counter != 0) ? 2'b10 : 2'b11;
      // Finish State
      2'b11: ns = 2'b00; 
    endcase    
  end
  
  always@(ps , write_counter) begin
    {finish_OutSignal , hit_OutSignal , cache_miss , write_cache} = 4'b0; offset = 2'b00;
    case(ps)
      2'b00: begin
        hit_OutSignal = cache_hit; offset = 2'b00;
      end
      2'b01: begin
        {cache_miss , hit_OutSignal} = 2'b10; offset = 2'b00;
      end
      2'b10: begin
        {write_cache , hit_OutSignal} = 2'b10; offset = write_counter;
      end
      2'b11: begin
        {finish_OutSignal , hit_OutSignal} = 2'b10; offset = 2'b00;
      end
    endcase
  end
  
  always@(posedge clk , posedge rst) begin
    if(rst)
      ps <= 2'b00;
    else
      ps <= ns;
  end
  
  // Counter for 4 Writes
  always@(posedge clk , posedge rst) begin
    if(rst)
      write_counter <= 2'b11;
    else
      if(ps == 2'b00)
        write_counter <= 2'b11;
      else if(ps == 2'b10)
        write_counter <= write_counter - 1; 
  end
  
endmodule
