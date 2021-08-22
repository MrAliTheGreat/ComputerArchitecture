`timescale 1ns/1ns
module FWRD (Fa, Fb, rs, rt, EX_M_rd, M_WB_rd, EX_M_regwrite, M_WB_regwrite);
  
  output reg [1:0] Fa, Fb;
  input [4:0] rs, rt, EX_M_rd, M_WB_rd;
  input EX_M_regwrite, M_WB_regwrite;
  
  always@(rs, EX_M_rd, M_WB_rd, EX_M_regwrite, M_WB_regwrite)begin
    if(EX_M_regwrite &(EX_M_rd==rs)&(EX_M_rd!=5'd0)) Fa = 2'd2;
    else if(M_WB_regwrite &(M_WB_rd==rs)&(M_WB_rd!=5'd0)) Fa = 2'd1;
    else Fa = 2'd0;
  end

  always@(rt, EX_M_rd, M_WB_rd, EX_M_regwrite, M_WB_regwrite)begin
    if(EX_M_regwrite &(EX_M_rd==rt)&(EX_M_rd!=5'd0)) Fb = 2'd2;
    else if(M_WB_regwrite &(M_WB_rd==rt)&(M_WB_rd!=5'd0)) Fb = 2'd1;
    else Fb = 2'd0;
  end
  
endmodule