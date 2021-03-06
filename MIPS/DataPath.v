`timescale 1ns/1ns
module DataPath(input[1:0] ALUcontrol , regWriteDataSel , regIn , pcSel , input clk , rst , memRead , memWrite , aluIn , regWrite ,output [5:0] opCode , output zero);
  reg[31:0] pc;
  wire[31:0] new_pc , instruction , Data1 , Data2 , ALUout , memOut , ALU_Data2 , writeData , sign_extend_data;
  wire[4:0] writeReg; 
  wire[2:0] ALUop;
  wire regWriteSel;
  
  InstructionMemory cut_instructionMemory(pc , instruction);
  
  RegisterFile cut_RegisterFile(instruction[25:21] , instruction[20:16] , writeReg , writeData , clk , regWriteSel , Data1 , Data2);
  assign writeReg = (regIn == 0) ? instruction[20:16] :
                    (regIn == 1) ? instruction[15:11] : 31;
  
  assign writeData = (regWriteDataSel == 0) ? ALUout :
                     (regWriteDataSel == 1) ? memOut : pc + 4;
  
  assign regWriteSel = (regWrite == 1 && ALUcontrol != 4) ? 1 : 0;
  
  ALU cut_ALU(Data1 , ALU_Data2 , ALUop , ALUout , zero);
  assign sign_extend_data = instruction[15] ? {16'b1111111111111111,instruction[15:0]} : {16'b0,instruction[15:0]};
  
  assign ALU_Data2 = (aluIn) ? sign_extend_data : Data2;
  
  ALUcontroller cut_ALUcontroller(instruction[5:0] , ALUcontrol , ALUop);
  
  DataMemory cut_DataMemory(ALUout , Data2 , clk , memWrite , memRead , memOut);
  

  assign opCode = instruction[31:26];
  
  assign new_pc = (pcSel == 0) ? pc + 4 : // Normal
                  (pcSel == 1) ? {pc[31:28] , instruction[25:0] , 2'b0} : // J , Jal
                  (pcSel == 2) ? Data1 : // jr
                  (pcSel == 3) ? {sign_extend_data , 2'b0} + pc + 4 : 0; // beq , bne
  
  always@(posedge clk , posedge rst)
    if(rst)
      pc = 0;
    else
      pc = new_pc;
endmodule

