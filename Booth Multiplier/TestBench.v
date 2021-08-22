`timescale 1ns/1ns
module TestBench();
  reg [5:0] x , y;
  reg clk , rst , start;
  wire ready;
  wire[10:0] result;
  Circuit cut_circuit(x , y , clk , rst , start , ready , result);
  
  initial begin
    start = 0;
    rst = 0;
    #50 clk = 1;
    start = 1;
    x = 6'b110010;
    y = 6'b001110;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;  
  end
  
endmodule




module TestBench_Controller();
  reg [5:0] x;
  reg [6:0] y;
  wire [1:0] ns , ps;
  reg clk , rst , start;
  wire ready , ldx , ldy , ldp , rst_p , shift_p , shift_y;
  wire[5:0] x_adder;
  Controller cut_controller(x , y , clk , rst , start , ready , ldx , ldy , ldp , rst_p , shift_p , shift_y , x_adder , ns , ps);
  
  initial begin
    start = 0;
    rst = 0;
    #50 clk = 1;
    start = 1;
    x = 6'b110010;
    y = 7'b0011110;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;  
  end
  
endmodule



module TestBench_DataPath();
  reg [5:0] x , y , x_adder;
  reg clk , rst , ldx , ldy , ldp , shift_y , shift_p , rst_p;
  wire [10:0] result;
  wire [6:0] output_y;
  Datapath cut_dp(x , y , x_adder , clk , rst , ldx , ldy , ldp , shift_y , shift_p , rst_p , output_y , result);
  
  initial begin
    rst = 0;
    ldx = 1;
    ldy = 1;
    rst_p = 1;
    x = 6'b110010;
    y = 6'b001111;
    #50 clk = 1;
    #50 clk = 0;
    rst_p = 0;
    ldx = 0;
    ldy = 0;
    #50 clk = 1;
    #50 clk = 0;
    x_adder = 6'b001110;
    #50 clk = 1;
    #50 clk = 0;
    ldp = 1;
    #50 clk = 1;
    #50 clk = 0;
    ldp = 0;
    shift_y = 1;
    shift_p = 1;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;  
  end
  
endmodule



module TestBench_12_bit();
  reg [5:0] serIn;
  reg clk , rst , load , shift_en , shift_value;
  wire[11:0] Q;
  Shift_register_12_bit cut_12(clk , rst , load , shift_en , shift_value , serIn , Q);
  
  initial begin
    #50 clk = 1;
    #50 clk = 0;
    rst = 1;
    serIn = 6'b110010;
    #50 clk = 1;
    #50 clk = 0;
    rst = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    load = 1;
    #50 clk = 1;
    #50 clk = 0;
    load = 0;
    #50 clk = 1;
    #50 clk = 0;
    shift_en = 1;
    shift_value = 0;
    #50 clk = 1;
    #50 clk = 0;
    shift_value = 1;
    #50 clk = 1;
    #50 clk = 0;
    shift_en = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;
    #50 clk = 1;
    #50 clk = 0;  
  end
  
endmodule