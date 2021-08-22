module PipeLine (clk, rst, mem1, mem2);
input clk, rst;
output [31:0] mem1, mem2;
    wire pcwrite, selpc, pcsrc, IF_ID_write, eq, regdst, regwrite, alusrc, memread, memwrite, memtoreg, selsignal, flush, Flush;
    wire [1:0] mem, wb, ex_mem, ex_wb, sela, selb, mem_wb, mem_mem, wb_wb;
    wire [2:0] aluoperation;
    wire [4:0] ex, ex_ex, ex_rt, ex_rs, ex_rd, regrd, mem_rd, wb_rd;  
    wire [31:0] pcin, pcout, nextpc, pcnotb, pcb, inst, id_pc, id_inst, data1, data2, se, label, jamp, bpc, aluout, 
                ex_data1, ex_data2, ex_se, a, b, bf, mem_address, mem_data, readdata, wb_alu, wb_memory, writedata;    
    // start IF
    Pc pc(.in(pcin), .ld(pcwrite), .clk(clk), .rst(rst), .out(pcout));
    Adder32 addIF(.A(32'b00000000000000000000000000000100),.B(pcout), .sum(nextpc));
    Mux2_32 m1(.in0(nextpc), .in1({id_pc[31:28], jamp[27:0]}), .sel(selpc), .out(pcnotb)),  m2(.in0(pcnotb), .in1(pcb), .sel(pcsrc), .out(pcin));
    InstMem instmem(.address(pcout), .ins(inst), .rst(rst));
    // end IF
    Reg32_Ld r1(.clk(clk), .rst(rst), .clr(flush), .ld(IF_ID_write), .in(nextpc), .out(id_pc)), 
             r2(.clk(clk), .rst(rst), .clr(flush), .ld(IF_ID_write), .in(inst), .out(id_inst));
    //start ID
    RegFile regfile(.readreg1(id_inst[25:21]), .readreg2(id_inst[20:16]), .writereg(wb_rd),
                    .clk(clk), .rst(rst), .regwrite(wb_wb[1]), .writedata(writedata), .readdata1(data1), .readdata2(data2));
    Equal equal(.in1(data1), .in2(data2), .out(eq));
    SignExtend signextend(.in(id_inst[15:0]), .out(se));
    Shl2 shl1(.in(se), .out(label)), shl2(.in(id_inst[25:0]), .out(jamp));
    Adder32 addID(.A(id_pc), .B(label), .sum(pcb));
    Controller c(.OpCode(id_inst[31:26]), .func(id_inst[5:0]), .Zero(eq), .RegDst(regdst), .RegWrite(regwrite),
                 .AluSrc(alusrc), .MemRead(memread), .MemWrite(memwrite), .MemToReg(memtoreg),
                 .SelPc(selpc), .AluOperation(aluoperation), .PcSrc(pcsrc), .Flush(Flush));
    assign flush = Flush & IF_ID_write;
    Mux2_5 m3(.in1({alusrc, aluoperation, regdst}), .in0(5'b00000), .sel(selsignal), .out(ex));
    Mux2_2 m4(.in1({memread, memwrite}), .in0(2'b00), .sel(selsignal), .out(mem)), 
           m5(.in1({regwrite, memtoreg}), .in0(2'b00), .sel(selsignal), .out(wb));
    HazardUnit hazardunit(.ID_EX_MemRead(ex_mem[1]), .ID_EX_Rt(ex_rt), .EX_MEM_Rt(mem_rd), .Rs(id_inst[25:21]), .Rt(id_inst[20:16]),
                          .PcWrite(pcwrite), .IF_ID_Write(IF_ID_write), .branch(pcsrc), .ID_EX_RegWrite(ex_wb[1]),
                           .EX_MEM_RegWrite(mem_wb[1]),.WB_RegWrite(wb_wb[1]), .WB_Rt(wb_rd), .SelController(selsignal));
    // end ID
    Reg5 r3(.clk(clk), .rst(rst), .in(ex), .out(ex_ex)), r4(.clk(clk), .rst(rst), .in(id_inst[20:16]), .out(ex_rt)),
         r5(.clk(clk), .rst(rst), .in(id_inst[15:11]), .out(ex_rd)), r6(.clk(clk), .rst(rst), .in(id_inst[25:21]), .out(ex_rs));
    Reg32 r7(.clk(clk), .rst(rst), .in(data1), .out(ex_data1)), r8(.clk(clk), .rst(rst), .in(data2), .out(ex_data2)),
          r9(.clk(clk), .rst(rst), .in(se), .out(ex_se));
    Reg2 r10(.clk(clk), .rst(rst), .in(wb), .out(ex_wb)), r11(.clk(clk), .rst(rst), .in(mem), .out(ex_mem));
    // start EX
    ForwardingUnit fu(.EX_MEM_RegWrite(mem_wb[1]), .EX_MEM_Rd(mem_rd), .ID_EX_Rs(ex_rs), .ID_EX_Rt(ex_rt),
                      .MEM_WB_RegWrite(wb_wb[1]), .MEM_WB_Rd(wb_rd), .SelA(sela), .SelB(selb));
    Mux2_5 m6(.in0(ex_rt), .in1(ex_rd), .sel(ex_ex[0]), .out(regrd));
    Mux3_32 m7(.in0(ex_data1), .in1(writedata), .in2(mem_address), .sel(sela), .out(a)),
            m8(.in0(ex_data2), .in1(writedata), .in2(mem_address), .sel(selb), .out(b));
    Mux2_32 m9(.in0(b), .in1(ex_se), .sel(ex_ex[4]), .out(bf));
    Alu alu(.A(a), .B(bf), .aluOperation(ex_ex[3:1]), .out(aluout));
    // end EX
    Reg2 r12(.clk(clk), .rst(rst), .in(ex_wb), .out(mem_wb)), r13(.clk(clk), .rst(rst), .in(ex_mem), .out(mem_mem));
    Reg32 r14(.clk(clk), .rst(rst), .in(aluout), .out(mem_address)), r15(.clk(clk), .rst(rst), .in(b), .out(mem_data));
    Reg5 r16(.clk(clk), .rst(rst), .in(regrd), .out(mem_rd));  
    // start MEM
    DataMem datamem(.address(mem_address), .writedata(mem_data), .memread(mem_mem[1]), .memwrite(mem_mem[0]),
                    .clk(clk), .readdata(readdata), .mem1(mem1), .mem2(mem2), .rst(rst));
    // end MEM
    Reg2 r17(.clk(clk), .rst(rst), .in(mem_wb), .out(wb_wb));
    Reg32 r18(.clk(clk), .rst(rst), .in(readdata), .out(wb_memory)), r19(.clk(clk), .rst(rst), .in(mem_address), .out(wb_alu));
    Reg5 r20(.clk(clk), .rst(rst), .in(mem_rd), .out(wb_rd));  
    // start WB
    Mux2_32 m10(.in0(wb_alu), .in1(wb_memory), .sel(wb_wb[0]), .out(writedata));
    // end WB
endmodule 
