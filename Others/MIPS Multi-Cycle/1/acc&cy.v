module accCy(input[11:0] accin,input clk,rst,clearacc,clearcy,compacc,compcy,RL,RR,cywrite,accwrite,cyin,output reg[11:0] accout,output reg cyout,output accminus,acczero);
  assign accminus = (accout<0)?1:0;
  assign acczero = (accout==0)?1:0;
  always@(posedge clk,posedge rst)
    if (rst)begin
      accout<=0;
      cyout<=0;
    end
    else begin
      if(accwrite)
        accout <=accin;
      else if(cywrite)
        cyout <= cyin;
      else if(clearacc)
        accout<=0;
      else if(clearcy)
        cyout<=0;
      else if(compacc)
        accout<=~accout;
      else if(compcy)
        cyout<=~cyout;
      else if(RL)
        {cyout,accout}<={accout,cyout};
      else if(RL)
        {cyout,accout}<={accout[0],cyout,accout[11:1]};
    end
endmodule