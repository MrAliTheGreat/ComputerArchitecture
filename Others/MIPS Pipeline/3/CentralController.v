module CentralController(OpCode, RegDst, RegWrite, AluSrc, MemRead, MemWrite, MemToReg, SelPc, Branch, BranchNot, AluOp);
input [5:0] OpCode;
output reg RegDst, RegWrite, AluSrc, MemRead, MemWrite, MemToReg, SelPc;
output reg Branch, BranchNot;
output reg [1:0]  AluOp;
    always @(OpCode) begin
        { RegDst, RegWrite, AluSrc, MemRead, MemWrite, MemToReg, SelPc, Branch, BranchNot} = 9'b0;
        AluOp = 2'b00;
        case (OpCode)
            6'b000000: begin //R Type
                {RegDst, RegWrite} = 2'b11;
                AluOp = 2'b10;
            end 
            6'b100011: begin // LW
                {RegWrite, AluSrc, MemRead, MemToReg} = 4'b1111;
                AluOp = 2'b00;
            end 
            6'b101011: begin // SW
                {AluSrc, MemWrite} = 2'b11;
                AluOp = 2'b00;
            end 
            6'b000100: begin // BE
                Branch = 1'b1;
            end 
           6'b000101: begin // BNE
                BranchNot = 1'b1;
            end 
            6'b001000: begin // ADDi
                {RegWrite, AluSrc} = 2'b11;
                AluOp = 2'b00;
            end 
            6'b001100: begin // ANDi
                {RegWrite, AluSrc} = 2'b11;
                AluOp = 2'b11;
            end 
            6'b000010: begin // J
                SelPc = 1'b1;
            end 
        endcase
    end
endmodule