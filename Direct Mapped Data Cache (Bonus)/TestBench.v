`timescale 1ns/1ns
module TestBench();
  reg clk = 0 , rst;
  wire hit_OUT , finish_OUT;
  wire [14:0] address;
  integer adr = 1024;
  integer num_hits = 0;
  
  assign address = adr;
  Circuit cut_circuit(clk , rst , address , hit_OUT , finish_OUT);
  
  always #50 clk = ~clk;
  initial begin
    rst = 1;
    #100 rst = 0;
    #50
    // 8k -> 8192 -> 1024 to 9215
    while (adr <= 9215) begin
      #100;
      if(hit_OUT)
        num_hits = num_hits + 1;
      if (finish_OUT) begin
        adr = adr + 1;
      end
    end
    #1000;
    $display("Number of Cache Hits In 8k = 8192 Calls:%d" , num_hits);
    $stop;
  end
endmodule