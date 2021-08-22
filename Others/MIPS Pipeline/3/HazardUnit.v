module HazardUnit (ID_EX_MemRead, ID_EX_Rt,EX_MEM_Rt , Rs, Rt, PcWrite, IF_ID_Write, branch, ID_EX_RegWrite, EX_MEM_RegWrite, WB_RegWrite, WB_Rt, SelController);
input [4:0] EX_MEM_Rt, ID_EX_Rt, Rs, Rt, WB_Rt;
input ID_EX_MemRead, branch, ID_EX_RegWrite, EX_MEM_RegWrite,WB_RegWrite;
output reg PcWrite, IF_ID_Write, SelController;

    always @(ID_EX_MemRead, ID_EX_Rt, EX_MEM_Rt, Rs, Rt, branch, EX_MEM_RegWrite, WB_RegWrite, WB_Rt) begin
        {PcWrite, IF_ID_Write, SelController} = 3'b111;
        if(ID_EX_MemRead == 1'b1)begin
            if((ID_EX_Rt == Rs || ID_EX_Rt == Rt) && ID_EX_Rt != 5'b00000)
                {PcWrite, IF_ID_Write, SelController} = 3'b000;
        end
        if(branch == 1'b1)begin
            if(EX_MEM_RegWrite == 1'b1)begin
                if((EX_MEM_Rt == Rs || EX_MEM_Rt == Rt) && EX_MEM_Rt != 5'b00000)
                    {PcWrite, IF_ID_Write, SelController} = 3'b000; 
            end
            if(ID_EX_RegWrite == 1'b1)begin
                if((ID_EX_Rt == Rs || ID_EX_Rt == Rt) && ID_EX_Rt != 5'b00000)
                    {PcWrite, IF_ID_Write, SelController} = 3'b000;
            end
            if(WB_RegWrite == 1'b1)begin
                if((WB_Rt == Rs || WB_Rt == Rt) && WB_Rt != 5'b00000)
                    {PcWrite, IF_ID_Write, SelController} = 3'b000;
            end
        end   
    end
endmodule

