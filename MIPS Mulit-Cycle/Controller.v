`timescale 1ns/1ns
module Controller(input clk , rst , output reg pcWrite , pcConditional , IorD , memRead , memWrite , IRWrite , regWrite , ALUSrcA , output reg [1:0] regDst , memtoreg , ALUSrcB , ALUOp , PCSrc , input [5:0] opCode);
  // 0 -> instruction Fetch , 1 -> instruction decode , 2 -> add sub and or slt , 3 -> continue 2 , 4 -> addi , 5 -> continue 4 and 15 , 6 -> memory ref
  // 7 -> sw , 8 -> lw , 9 -> continue 8 , 10 -> j , 11 -> jr , 12 -> jal , 13 -> beq , 14 -> bneq , 15 ->andi
  reg[3:0] ps , ns;
 	always@(ps, opCode)begin
    ns = 0;
    case(ps)
      0: begin
        ns = 1;
      end
      1: begin
        ns = (opCode == 6'b000000) ? 2 :
             (opCode == 6'b001000) ? 4 :
             (opCode == 6'b001100) ? 15 :
             (opCode == 6'b100011 || opCode == 6'b101011) ? 6 :
             (opCode == 6'b000010) ? 10 :
             (opCode == 6'b000001) ? 11 :
             (opCode == 6'b000011) ? 12 :              
             (opCode == 6'b000100) ? 13 : 
             (opCode == 6'b000101) ? 14 : 0;
      end
      2: begin
        ns = 3;
      end
      3: begin
        ns = 0;
      end
      4: begin
        ns = 5;
      end
      5: begin
        ns = 0;
      end
      6: begin
        ns = (opCode == 6'b100011) ? 8 : 7;
      end
      7: begin
        ns = 0;
      end
      8: begin
        ns = 9;
      end
      9: begin
        ns = 0;
      end
      10: begin
        ns = 0;
      end
      11: begin
        ns = 0;
      end
      12: begin
        ns = 0;
      end
      13: begin
        ns = 0;
      end
      14: begin
        ns = 0;
      end
      15: begin
        ns = 5;
      end
    endcase   
	end
	
	always @(ps , opCode) begin
	  {pcWrite , pcConditional , IorD , memRead , memWrite , IRWrite , regWrite , ALUSrcA , regDst , memtoreg , ALUSrcB , ALUOp , PCSrc} = 18'b0;
	  case(ps)
	    0: begin
	      {IorD , memRead , IRWrite , ALUSrcA , pcWrite} = 5'b01101;
        ALUOp = 2'b00;
        PCSrc = 2'b00;
        ALUSrcB = 2'b01;
	    end
	    1: begin
	      ALUSrcA = 0;
	      ALUOp = 2'b00;
	      ALUSrcB = 2'b11;
	    end  
      2: begin
	      ALUSrcA = 1;
	      ALUOp = 2'b10;
	      ALUSrcB = 2'b00;        
      end
      3: begin
        memtoreg = 2'b00;
        regWrite = 1; 
        regDst = 2'b01;
      end
      4: begin
	      ALUSrcA = 1;
	      ALUOp = 2'b10;
	      ALUSrcB = 2'b10;
      end
      5: begin
        memtoreg = 2'b00;
        regWrite = 1;
        regDst = 2'b00;
      end
      6: begin
	      ALUSrcA = 1;
	      ALUOp = 2'b00;
	      ALUSrcB = 2'b10;        
      end
      7: begin
        {IorD , memWrite} = 2'b11;
      end
      8: begin
        {IorD , memRead} = 2'b11;
      end
      9: begin
        regWrite = 1;
        memtoreg = 2'b01;
        regDst = 2'b00;
      end
      10: begin
        pcWrite = 1;
        PCSrc = 2'b01;
      end
      11: begin
        pcWrite = 1;
        PCSrc = 2'b11;
      end
      12: begin
        {regWrite , pcWrite} = 2'b11;
        regDst = 2'b10;
        memtoreg = 2'b10;
        PCSrc = 2'b01;
      end
      13: begin
        pcConditional = 1;
        ALUSrcA = 1;
        ALUSrcB = 2'b00;
        PCSrc = 2'b10;
        ALUOp = 2'b01;
      end
      14: begin
        pcConditional = 1;
        ALUSrcA = 1;
        ALUSrcB = 2'b00;
        PCSrc = 2'b10;
        ALUOp = 2'b01;        
      end
      15: begin
	      ALUSrcA = 1;
	      ALUOp = 2'b10;
	      ALUSrcB = 2'b10;        
      end	    
	  endcase
	  
	end
  
  always@(posedge clk, posedge rst) begin
    if(rst) ps <= 0;
    else  ps <= ns;
  end
endmodule
