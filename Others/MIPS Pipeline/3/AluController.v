module AluController(func, aluop, aluoperation);
input [5:0] func;
input [1:0] aluop;
output reg [2:0] aluoperation;

    always @(func, aluop) begin
        case (aluop)
            2'b00: aluoperation = 3'b000;
            2'b01: aluoperation = 3'b001;
            2'b10:begin
                case (func)
                    6'b100000: aluoperation = 3'b000;
                    6'b100100: aluoperation = 3'b010;
                    6'b100101: aluoperation = 3'b011;
                    6'b100010: aluoperation = 3'b001;
                    6'b101010: aluoperation = 3'b100;
                    default: aluoperation = 3'b000;
                endcase
            end
            2'b11: aluoperation = 3'b010;
            
            default: aluoperation = 3'b000;
        endcase
    end

endmodule 
