module Alu (A, B, aluOperation, out, zero);
input [31:0] A, B; 
input [2:0] aluOperation; 
output reg [31:0] out; 
output reg zero;

  integer i;
    always @(A,B,aluOperation) begin
        case (aluOperation)
            3'b000:  out = A + B;
            3'b001:  out = A - B;
            3'b010:begin
              for(i=0;i<32;i=i+1)
                out[i] = A[i] & B[i];
            end
            3'b011:begin
              for(i=0;i<32;i=i+1)
                out[i] = A[i] | B[i];
            end
            3'b100:begin
              if (A[31] > B[31])
                out = 32'b00000000000000000000000000000001;
              else begin
                if(A < B)
                  out = 32'b00000000000000000000000000000001;
                else 
                  out = 32'b00000000000000000000000000000000;
              end
            end
            default: out = 32'b0;
        endcase
        if(out == 32'b0)
          zero = 1'b1;
        else
          zero = 1'b0;
    end
endmodule
