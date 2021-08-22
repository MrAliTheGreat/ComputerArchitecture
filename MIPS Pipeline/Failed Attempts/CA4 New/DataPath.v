`timescale 1ns/1ns
module DataPath();
  
  
  // 1 -> lw_hazard[1]
  Reg32 reg_pc(clk , rst , 1'b1 , new_pc , pc);
endmodule