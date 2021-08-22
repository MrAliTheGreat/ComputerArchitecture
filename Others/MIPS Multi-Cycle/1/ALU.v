module ALU(input op,input[11:0] A,B ,output [11:0] out,output carry);
  assign {carry,out} = (~op)?A&B:A+B;
endmodule