`timescale 1ns/1ns
module M_WB (M_WB_data, M_WB_rd, M_WB_regwrite, read_data, address, rd, memtoreg, regwrite, clk);
  
  output reg [31:0] M_WB_data;
  output reg [4:0] M_WB_rd;
  output reg M_WB_regwrite;
  input [31:0] read_data, address;
  input [4:0] rd;
  input memtoreg, regwrite, clk;
  
  always@(posedge clk)begin
    if(memtoreg) M_WB_data <= read_data;
    else M_WB_data <= address;
    M_WB_rd <= rd;
    M_WB_regwrite <= regwrite;
  end
endmodule

