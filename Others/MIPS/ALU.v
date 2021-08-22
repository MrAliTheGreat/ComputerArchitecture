module ALU(input[2:0] op,input[31:0] A,B ,input rhi ,output [31:0] out,output zero);
  wire[31:0] hi,lo;
  assign zero = (out==0)?1:0;
  assign out = (op==0)?A&B:
                (op==1)?A|B:
                (op==2)?A+B:
                (op==6)?A-B:
                (op==7)?A<B:
                (op==4)?A^B:
                (op==5 & rhi)?hi:lo;
  assign {hi,lo} = A*B;
endmodule

