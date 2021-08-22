module ForwardingUnit(EX_MEM_RegWrite, EX_MEM_Rd, ID_EX_Rs, ID_EX_Rt, MEM_WB_RegWrite, MEM_WB_Rd, SelA, SelB);
input EX_MEM_RegWrite, MEM_WB_RegWrite;
input [4:0]  EX_MEM_Rd, ID_EX_Rs, MEM_WB_Rd, ID_EX_Rt;
output reg [1:0] SelA, SelB;

    always @(EX_MEM_RegWrite, EX_MEM_Rd, ID_EX_Rt, MEM_WB_RegWrite, MEM_WB_Rd, ID_EX_Rt) begin
        SelA = 2'b00;
        SelB = 2'b00;
        if(EX_MEM_RegWrite == 1'b1 && EX_MEM_Rd == ID_EX_Rs && EX_MEM_Rd != 5'b00000)
            SelA = 2'b10;
        else if(MEM_WB_RegWrite == 1'b1 && MEM_WB_Rd == ID_EX_Rs && MEM_WB_Rd != 5'b00000)
            SelA = 2'b01;  
        if(EX_MEM_RegWrite == 1'b1 && EX_MEM_Rd == ID_EX_Rt && EX_MEM_Rd != 5'b00000)
            SelB = 2'b10;
        else if(MEM_WB_RegWrite == 1'b1 && MEM_WB_Rd == ID_EX_Rt && MEM_WB_Rd != 5'b00000)
            SelB = 2'b01;           
    end

endmodule 
