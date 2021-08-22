module MIPS(input clk,rst);
  wire[1:0] ALUcntrl,toReg,regIn,pcIn;
  wire memRead,memWrite,aluIn,regWrite,reghi, zero ;
  wire[5:0] operation;
  dataPath dataPath1(ALUcntrl,toReg,regIn,pcIn ,clk,rst,memRead,memWrite,aluIn,regWrite,reghi ,operation,zero);
  controller controller1(ALUcntrl,toReg,regIn,pcIn ,memRead,memWrite,aluIn,regWrite,reghi,operation,zero);
endmodule

