module controller(input[11:0] instruction,input clk,rst,cyout,accminus,acczero,output reg[1:0] readadsrc,Asrc,writedatasrc ,output reg memwrite,ldALUnext,ldinst,Bsrc,writeadsrc,doi,ld1,ld2,pcld,pcsrc,op,clearacc,clearcy,compacc,compcy,RL,RR,cywrite,accwrite);
  reg[3:0] state,nextstate;
  always@(negedge clk,posedge rst)
    if(rst)
      state<=0;
    else
      state<=nextstate;
  always@(posedge clk,posedge rst)
    if(rst) begin
      state=0;
      nextstate=0;
      {ldinst,Asrc,Bsrc,writedatasrc,writeadsrc,memwrite,ldALUnext} <= 0;
      {doi,ld1,ld2,pcld,pcsrc,op,readadsrc,clearacc} <= 0;
      {clearcy,compacc,compcy,RL,RR,cywrite,accwrite} <= 0;
    end
    else begin
      {ldinst,Asrc,Bsrc,writedatasrc,writeadsrc,memwrite,ldALUnext} <= 0;
      {doi,ld1,ld2,pcld,pcsrc,op,readadsrc,clearacc} <= 0;
      {clearcy,compacc,compcy,RL,RR,cywrite,accwrite} <= 0;
      case(state)
        0:begin{ldinst,op,ldALUnext}<=3'b111; nextstate<=1; end
        1: begin {op,pcld}<=2'b11; 
           if(instruction[11:8]==4'b1111) nextstate<=2; 
           else if(instruction[11:8]==4'b1110 &&instruction[2]&&instruction[3]&&instruction[1]) nextstate<=4;
           else if(instruction[11:8]==4'b1110 &&instruction[2]&&instruction[3]&&~instruction[1]) nextstate<=5;
           else if(instruction[11:8]==4'b1110) nextstate<=3;
           else if(instruction[8]==1) nextstate<=6;
           else if(instruction[8]==0) nextstate<=7;
           end
        2:begin op<=1; pcld <=(instruction[7]&accminus)|(instruction[6]&acczero)|(instruction[5]&cyout); nextstate<=0; end
        3:begin{clearacc,clearcy,compacc,compcy}<=instruction[7:4]; 
          {op,Asrc}<=3'b101; accwrite <= instruction[0]; nextstate<=0; end
        4:begin{RR,RL}<=instruction[3:2]; nextstate<=5; end
        5:begin{RR,RL}<=instruction[3:2]; nextstate<=0; end
        6:begin{readadsrc,ld1}<=3'b011; doi <= instruction[7];  nextstate<=7; end
        7:begin if(instruction[8]) readadsrc<=2; else readadsrc<=1;
          ld2<=1; nextstate<=8; end
        8:begin nextstate<=0; if(instruction[11:9]==0){Asrc,Bsrc,accwrite}<=4'b0111;
                else if(instruction[11:9]==3'b001) {Asrc,Bsrc,accwrite,op,cywrite}<=6'b011111;
                else if(instruction[11:9]==3'b010) {Asrc,Bsrc,op,memwrite,writeadsrc}<={5'b10111,instruction[8]}; 
                else if(instruction[11:9]==3'b011) begin {writedatasrc,memwrite,writeadsrc}<={3'b011,instruction[8]}; nextstate <= 9; end 
                else if(instruction[11:10]==2'b10) begin {writedatasrc,pcld,pcsrc}<={4'b1011}; memwrite<=instruction[9]; writeadsrc<=instruction[9]; end
           end
        9:begin nextstate<=0; clearacc<=1; end
      endcase
    end
    

endmodule