`timescale 1ns/1ns
module DataPath(input clk , rst , ALUSrc , regWrite , memWrite , memRead , memtoReg , regDst , clearIFID , input [1:0] ALUOperation , pcSrc , 
                output [5:0] opCode , output equal , select_cancel_controller);
  
  wire [31:0] pc , instruction , pc_con1 , regFileWriteData , data1 , data2 , sign_extend_data , result_ALU , branch_address , memWriteData;
  wire [31:0] out_memory , writeDataRegFile_aluout , new_pc , jump_address;
  wire [4:0] regFileWriteDst , regWriteDst_con1 , Rt , Rd , Rs;
  wire [2:0] ALUop_con1 , lw_hazard;
  wire ALUSrc_con1 , regWrite_con1 , regWrite_con2 , regDst_con1 , memWrite_con1 , memWrite_con2 , memRead_con1 , memRead_con2 , memtoReg_con1;
  wire memtoReg_con2 , regWrite_con3 , memtoReg_con3 , zero;
  
  IF_ID_Stage cut_IF_ID(clk , rst , clearIFID , lw_hazard , pc , instruction , pc_con1);
  
  ID_EX_Stage cut_ID_EX(clk , rst , instruction , pc_con1 , regFileWriteData , regWrite , regWrite_con3 , ALUSrc , regDst , memWrite , memRead , 
                       memtoReg , ALUOperation , pcSrc , regFileWriteDst , data1 , data2 , sign_extend_data , Rt , Rd , regWrite_con1 , 
                       ALUSrc_con1 , regDst_con1 , memWrite_con1 , memRead_con1 , memtoReg_con1 , ALUop_con1 , opCode , equal , 
                       branch_address , jump_address , Rs);
  
  EX_MEM_Stage cut_EX_MEM(clk , rst , data1 , data2 , sign_extend_data , Rt , Rd , Rs , regFileWriteDst , regWrite_con1 , ALUSrc_con1 , regDst_con1 , 
                          memWrite_con1 , memRead_con1 , memtoReg_con1 , regWrite_con3 , ALUop_con1 , regFileWriteData , result_ALU , memWriteData , 
                          regWriteDst_con1 , zero , regWrite_con2 , memWrite_con2 , memRead_con2 , memtoReg_con2);
  
  MEM_WB_Stage cut_MEM_WB(clk , rst , result_ALU , memWriteData , regWriteDst_con1 , regWrite_con2 , memWrite_con2 , memRead_con2 , memtoReg_con2 , 
                          out_memory , writeDataRegFile_aluout , regFileWriteDst ,regWrite_con3 , memtoReg_con3);
  
  
  assign regFileWriteData = memtoReg_con3 ? out_memory : writeDataRegFile_aluout;
  
  assign new_pc = (pcSrc == 0) ? pc + 4 :
                  (pcSrc == 1) ? branch_address :
                  (pcSrc == 2) ? jump_address : 0;
  
  // lw_hazard [2:0] = {write_IFID , write_pc , select_cancel_controll_signals};
  assign lw_hazard = (memRead_con1 && (Rt == instruction[25:21] || Rt == instruction[20:16]) && Rt != 0) ? 3'b000 :
                      (pcSrc == 1) ? (regWrite_con1 && (Rt == instruction[25:21] || Rt == instruction[20:16]) && Rt != 0) ? 3'b000 :
                                     (regWrite_con2 && (regWriteDst_con1 == instruction[25:21] || regWriteDst_con1 == instruction[20:16]) && regWriteDst_con1 != 0) ? 3'b000 :
                                     (regWrite_con3 && (regFileWriteDst == instruction[25:21] || regFileWriteDst == instruction[20:16]) && regFileWriteDst != 0) ? 3'b000 : 3'b111 : 3'b111;
  
  assign select_cancel_controller = lw_hazard[0];
  
  Reg32 reg_pc(clk , rst , lw_hazard[1] , new_pc , pc);
  
endmodule