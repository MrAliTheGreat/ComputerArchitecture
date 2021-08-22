`timescale 1ns/1ns
module HZRD (
  output reg awrite, PCwrite, ctrl,
  input [4:0] ID_EX_rt, rs, rt,
  input ID_EX_memread, jmp, dst, memwrite, beq, bne
  );
  
  always@(*)begin
    if(ID_EX_memread & (ID_EX_rt != 5'b0) & (
      ( (ID_EX_rt == rs)&(~jmp) ) |
      ( (ID_EX_rt == rt)&(dst|beq|bne|memwrite) )     
    ))begin
      awrite = 1'b0;
      PCwrite = 1'b0;
      ctrl = 1'b0;
    end
    else begin
    awrite = 1'b1;
    PCwrite = 1'b1;
    ctrl = 1'b1;
    end
  end
endmodule