`timescale 1ns/1ns
module instruction_memory(input[31:0] address, output[31:0] instruction);
  reg[31:0] instmem[2**14-1:0];
  
  assign instruction = instmem[address[15:2]];
  
  initial begin
    $display("loading instruction memory");
    $readmemb("Q1instmem.txt", instmem, 0);
    #3045
    $readmemb("Q2instmem.txt", instmem, 0);
  end
endmodule
