`timescale 1ns/1ns
module ID_EX (
  output reg [31:0] ID_EX_rs_content, ID_EX_rt_content, ID_EX_immediate,
  output reg [4:0] ID_EX_rs, ID_EX_rt, ID_EX_rd,
  output reg [2:0] ID_EX_ALUop,
  output reg ID_EX_ALUsrc, ID_EX_dst, ID_EX_memread, ID_EX_memwrite, ID_EX_memtoreg, ID_EX_regwrite,
  input [31:0] rs_content, rt_content,
  input [15:0] immediate,
  input [4:0] rs, rt, rd,
  input [2:0] ALUop,
  input ALUsrc, dst, memread, memwrite, memtoreg, regwrite, ctrl, clk
  );
  always@(posedge clk)begin
    ID_EX_rs_content <= rs_content;
    ID_EX_rt_content <= rt_content;
    ID_EX_immediate <= {{16{immediate[15]}}, immediate};
    ID_EX_rs <= rs;
    ID_EX_rt <= rt;
    ID_EX_rd <= rd;
    if(ctrl)begin
      ID_EX_ALUsrc <= ALUsrc;
      ID_EX_dst <= dst;
      ID_EX_memread <= memread;
      ID_EX_memwrite <= memwrite;
      ID_EX_memtoreg <= memtoreg;
      ID_EX_regwrite <= regwrite;
      ID_EX_ALUop <= ALUop;
    end
    else begin
      ID_EX_ALUsrc <= 1'b0;
      ID_EX_dst <= 1'b0;
      ID_EX_memread <= 1'b0;
      ID_EX_memwrite <= 1'b0;
      ID_EX_memtoreg <= 1'b0;
      ID_EX_regwrite <= 1'b0;
      ID_EX_ALUop <= 3'b0;
    end
  end
endmodule

