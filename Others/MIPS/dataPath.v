module dataPath(input[1:0] ALUcntrl,toReg,regIn,pcIn ,input clk,rst,memRead,memWrite,aluIn,regWrite,reghi ,output [5:0] operation,output zero);
  reg[31:0] pc;
  wire[31:0] pcNext,instruction,data1,data2,ALUout,memData,B,writeData,memwriteData;
  wire[4:0] writeReg; 
  wire[2:0] ALUop;
  wire regWrite2;
  RegisterFile RegisterFile1(instruction[25:21],instruction[20:16],writeReg,writeData,clk,regWrite2,data1,data2);
  instructionMemory instructionMemory1(pc,instruction);
  DataMemory DataMemory1(ALUout,memwriteData,clk,memWrite,memRead ,memData);
  ALUcontroller ALUcontroller1(instruction[5:0],ALUcntrl,ALUop);
  ALU ALU1(ALUop,data1,B,reghi ,ALUout,zero);
  assign memwriteData = data2;
  assign writeReg = (regIn==0)?instruction[20:16]:
                    (regIn==1)?instruction[15:11]:31;
  assign writeData = (toReg==0)?ALUout:
                      (toReg==1)?memData:pc;
  assign regWrite2=(regWrite==1 && ALUcntrl!=3)?1:0;
  assign B = (aluIn)?{16'b0,instruction[15:0]}:data2;
  assign operation = instruction[31:26];
  assign pcNext = (instruction[5:0]==001000)?data1:
                  (pcIn==0)?pc+4:
                  (pcIn==1)?{4'b0,instruction[26:0],2'b0}:
                  (pcIn==2)?data1:
                  (pcIn==3)?{14'b0,instruction[15:0],2'b0} + pc +4:0;
  always@(posedge clk,posedge rst)
    if(rst)
      pc = 0;
    else
      pc = pcNext;
endmodule

