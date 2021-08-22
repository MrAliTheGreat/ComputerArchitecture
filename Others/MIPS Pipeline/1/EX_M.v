`timescale 1ns/1ns
module EX_M (EX_M_result, EX_M_write_data, EX_M_rd, EX_M_memread, EX_M_memwrite, EX_M_memtoreg, EX_M_regwrite, result, write_data, rd, memread, memwrite, memtoreg, regwrite, clk);
  
  output reg [31:0] EX_M_result, EX_M_write_data;
  output reg [4:0] EX_M_rd;
  output reg EX_M_memread, EX_M_memwrite, EX_M_memtoreg, EX_M_regwrite;
  input [31:0] result, write_data;
  input [4:0] rd;
  input memread, memwrite, memtoreg, regwrite, clk;
  
  always@(posedge clk)begin
    EX_M_result <= result;
    EX_M_write_data <= write_data;
    EX_M_rd <= rd; 
    EX_M_memread <= memread;
    EX_M_memwrite <= memwrite;
    EX_M_memtoreg <= memtoreg;
    EX_M_regwrite <= regwrite;
  end
endmodule