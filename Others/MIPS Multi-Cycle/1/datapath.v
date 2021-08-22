module datapath(output reg[11:0] instruction,input[1:0] readadsrc,Asrc,writedatasrc ,input memwrite,ldALUnext,ldinst,Bsrc,writeadsrc,doi,ld1,ld2,pcld,pcsrc,op,clk,rst,clearacc,clearcy,compacc,compcy,RL,RR,cywrite,accwrite,output cyout,accminus,acczero);
  wire[11:0] nextpc,readad,writead,writedata,accout,A,B,aluout,memout;
  reg [11:0] pc,data1,data2,ALUnext;
  reg cyin;
  accCy U1(aluout,clk,rst,clearacc,clearcy,compacc,compcy,RL,RR,cywrite,accwrite,cyin,accout,cyout,accminus,acczero);
  ALU U2(op,A,B,aluout,carry);
  memory U3(readad,writead,writedata,clk,rst,memwrite,memout);
  assign nextpc = (~pcsrc)?ALUnext:data2;
  assign readad = (readadsrc==0)?pc:
                  (readadsrc==1)?{(doi)?pc[11:7]:5'b0,instruction[6:0]}:data1;
  assign writead = (~writeadsrc)?{(doi)?pc[11:7]:5'b0,instruction[6:0]}:data1;
  assign writedata = (writedatasrc==0)?aluout:(writedatasrc==1)?accout:ALUnext;
  assign A = (Asrc==0)?pc:(Asrc==1)?accout:1;
  assign B = (~Bsrc)?1:data2;
  always@(negedge clk,posedge rst)
    if(rst)begin
      pc<=0;
      data1<=0;
      data2<=0;
      instruction<=0;
    end
    else begin
      if(ld1)
        data1<=memout;
      if(ld2)
        data2<=memout;
      if(ldALUnext)
        ALUnext<=aluout;
      if(ldinst)
        instruction<=memout;
      if(pcld)
        pc<=nextpc;
    end 
endmodule