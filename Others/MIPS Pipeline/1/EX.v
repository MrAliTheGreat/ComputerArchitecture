`timescale 1ns/1ns
module EX (EX_M_result, EX_M_write_data, EX_M_rd, EX_M_memread, EX_M_memwrite, EX_M_memtoreg, EX_M_regwrite, rs_content, rt_content, immediate, rs, rt, rd, M_WB_rd, M_WB_data, M_WB_regwrite, ALUsrc, ALUop, dst, memread, memwrite, memtoreg, regwrite, clk);
  
  output [31:0] EX_M_result, EX_M_write_data;
  output [4:0] EX_M_rd;
  output EX_M_memread, EX_M_memwrite, EX_M_memtoreg, EX_M_regwrite;
  input [31:0] rs_content, rt_content, immediate, M_WB_data;
  input [4:0] rs, rt, rd, M_WB_rd;
  input [2:0] ALUop;
  input M_WB_regwrite, ALUsrc, dst, memread, memwrite, memtoreg, regwrite, clk;
  
  reg [31:0] a, b, write_data;
  wire [31:0] result;
  reg [4:0] rd2;
  wire [1:0] Fa, Fb;
  
  always@(Fa, rs_content, EX_M_result, M_WB_data)begin
    case(Fa)
      2'd0: a = rs_content;
      2'd1: a = M_WB_data;
      2'd2: a = EX_M_result;
    endcase
  end
  
  always@(ALUsrc, Fb, rt_content, EX_M_result, M_WB_data)begin
    if(ALUsrc) b = immediate;
    else begin
      case(Fb)
        2'd0: b = rt_content;
        2'd1: b = M_WB_data;
        2'd2: b = EX_M_result;
      endcase
    end
  end
  
  always@(Fb, rt_content, EX_M_result, M_WB_data)begin
    case(Fb)
      2'd0: write_data = rt_content;
      2'd1: write_data = M_WB_data;
      2'd2: write_data = EX_M_result;
    endcase
  end
  
  always@(rt, rd, dst)begin
    if(dst) rd2 = rd;
    else rd2 = rt;
  end
  
  ALU ALU (result, a, b, ALUop);
  FWRD FWRD (Fa, Fb, rs, rt, EX_M_rd, M_WB_rd, EX_M_regwrite, M_WB_regwrite);
  EX_M EX_M (EX_M_result, EX_M_write_data, EX_M_rd, EX_M_memread, EX_M_memwrite, EX_M_memtoreg, EX_M_regwrite, result, write_data, rd2, memread, memwrite, memtoreg, regwrite, clk);

endmodule