`timescale 1ns/1ns
module PDP8 (input clk, rst);

    wire pcSrc, pcld, addrSrc, wrSrc, rden, wren, IRld, DZorDC, MARSrc, MARld, MDRld, ACCld, CYld;
    wire [1:0] ALUop, Asrc, Bsrc, ACCsrc, CYsrc;
    wire [11:0] inst;
    wire zero, nzCY, nzACC;

    DataPath DP (
        clk, rst, 
        // from controller:
        pcSrc, pcld, addrSrc, wrSrc, rden, wren, IRld, DZorDC, MARSrc, MARld, MDRld, ACCld, CYld,
        ALUop, Asrc, Bsrc, ACCsrc, CYsrc,
        // to controller:
        inst,
        zero, nzCY, nzACC
    );

    Controller CU (
        clk, rst, 
        // from controller
        pcSrc, pcld, addrSrc, wrSrc, rden, wren, IRld, DZorDC, MARSrc, MARld, MDRld, ACCld, CYld,
        ALUop, Asrc, Bsrc, ACCsrc, CYsrc,
        // to controller:
        inst,
        zero, nzCY, nzACC
    );

endmodule