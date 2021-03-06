module instructionMemory(input[31:0] address,output reg [31:0] instruction);
  reg[31:0] inst[100:0];
  initial  $readmemb("instruction2.txt", inst);
  always@(address)
    instruction = inst[address[31:2]];
endmodule