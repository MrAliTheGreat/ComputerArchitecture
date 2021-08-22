
`timescale 1ns/1ns
module CTRL (
  output reg jmp, beq, bne, ALUsrc, dst, memread, memwrite, memtoreg, regwrite, 
  output reg [2:0] ALUop,
  input [5:0] opcode, func
  );
  
  always@(opcode, func)begin
    jmp = 1'b0; 
    beq = 1'b0; 
    bne = 1'b0; 
    ALUsrc = 1'b0; 
    dst = 1'b0; 
    memread = 1'b0;
    memwrite = 1'b0;
    memtoreg = 1'b0; 
    regwrite = 1'b0;
    ALUop = 3'b0;
    
    case(opcode)
      6'b000000:begin // RT
        dst = 1'b1;
        regwrite = 1'b1;
        case(func)
          6'b100100: ALUop = 3'd0; // and
          6'b100101: ALUop = 3'd1; // or
          6'b100000: ALUop = 3'd2; // add
          6'b100010: ALUop = 3'd3; // sub
          6'b101010: ALUop = 3'd4; // slt
          default: ALUop = 3'd0;
        endcase
      end
      
      6'b001100:begin // andi
        ALUsrc = 1'b1;
        regwrite = 1'b1;
        ALUop = 3'd0;
      end
      
      6'b001000:begin // addi
        ALUsrc = 1'b1;
        regwrite = 1'b1;
        ALUop = 3'd2;
      end
      
      6'b100011:begin // lw
        ALUsrc = 1'b1;
        memread = 1'b1;
        memtoreg = 1'b1;
        regwrite = 1'b1;
        ALUop = 3'd2;
      end
      
      6'b101011:begin // sw
        ALUsrc = 1'b1;
        memwrite = 1'b1;
        ALUop = 3'd2;
      end
      
      6'b000010: jmp = 1'b1; // jmp
      
      6'b000100: beq = 1'b1; // beq
      
      6'b000101: bne = 1'b1; // bne
    endcase
  end
endmodule