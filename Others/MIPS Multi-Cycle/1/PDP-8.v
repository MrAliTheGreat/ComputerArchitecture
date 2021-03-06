module PDP_8(input clk,rst);
  wire[1:0] readadsrc,Asrc,writedatasrc;
  wire[11:0] instruction; 
  wire cyout,accminus,acczero,memwrite,ldALUnext,ldinst,Bsrc,writeadsrc,doi,ld1,ld2,pcld,pcsrc,op,clearacc,clearcy,compacc,compcy,RL,RR,cywrite,accwrite;
  controller U1(instruction,clk,rst,cyout,accminus,acczero,readadsrc,Asrc,writedatasrc,memwrite,ldALUnext,ldinst,Bsrc,writeadsrc,doi,ld1,ld2,pcld,pcsrc,op,clearacc,clearcy,compacc,compcy,RL,RR,cywrite,accwrite);
  datapath U2(instruction,readadsrc,Asrc,writedatasrc,memwrite,ldALUnext,ldinst,Bsrc,writeadsrc,doi,ld1,ld2,pcld,pcsrc,op,clk,rst,clearacc,clearcy,compacc,compcy,RL,RR,cywrite,accwrite,cyout,accminus,acczero);  
endmodule
