`timescale 1ns/1ns
module InstructionMemory(input[31:0] address , output reg [31:0] instruction);
  reg[31:0] inst_mem[0:99];
  initial  $readmemb("Instruction1.txt", inst_mem);
  always@(address)
    instruction <= inst_mem[address / 4];
endmodule
