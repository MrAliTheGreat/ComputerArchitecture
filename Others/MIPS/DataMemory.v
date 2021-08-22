module DataMemory(input[31:0] address1,writeData,input clk,write,read,output reg [31:0] readData);
  reg[31:0] mem[59:0];
  initial  $readmemb("memory.txt", mem);
  wire[32:0] address;
  assign address={1'b0,address1};
  always@(address,write,read,writeData)begin
    if(read)begin
      if (address<1999)
        readData = mem[address-1000];
      else if (address<2999)
        readData = mem[address-2000+20];
      else if (address<3999)
        readData = mem[address-3000+40]; 
    end
  end 
  always@(negedge clk)
    if (write)begin
      if (address<1999)
        mem[address-1000] = writeData;
      else if (address<2999)
        mem[address-2000+20] = writeData;
      else if (address<3999)
        mem[address-3000+40] = writeData;
    end
endmodule

