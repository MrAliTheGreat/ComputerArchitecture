module ALUtest();
  reg[2:0] op;
  reg[31:0] A,B;
  wire[31:0] out;
  wire zero;
  reg rhi;
  ALU UT( op,A,B ,rhi ,out,zero); 
initial begin
  #10 op=3'b010; A = 21; B=32; rhi =0;
  #10 op=3'b110 ;
  #10 op=3'b111 ;
  #10 
  $stop;
end
endmodule


