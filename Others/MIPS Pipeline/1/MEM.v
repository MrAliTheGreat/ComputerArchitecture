`timescale 1ns/1ns
module MEM (M_WB_data, M_WB_rd, M_WB_regwrite, address, write_data, rd, memread, memwrite, memtoreg, regwrite, clk);
  
  output [31:0] M_WB_data;
  output [4:0] M_WB_rd;
  output M_WB_regwrite;
  input [31:0] address, write_data;
  input [4:0] rd;
  input memread, memwrite, memtoreg, regwrite, clk;
  
  wire [31:0] read_data;
  
  DM DM (read_data, address, write_data, memread, memwrite, clk);
  M_WB M_WB (M_WB_data, M_WB_rd, M_WB_regwrite, read_data, address, rd, memtoreg, regwrite, clk);

endmodule

