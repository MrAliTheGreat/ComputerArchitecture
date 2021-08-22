library verilog;
use verilog.vl_types.all;
entity MEM_WB_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        RegWrite        : in     vl_logic;
        memWrite        : in     vl_logic;
        memRead         : in     vl_logic;
        memtoReg        : in     vl_logic;
        regWriteDst     : in     vl_logic_vector(4 downto 0);
        out_ALU         : in     vl_logic_vector(31 downto 0);
        memWriteData    : in     vl_logic_vector(31 downto 0);
        out_reg_RegWrite_MEMWB: out    vl_logic;
        out_reg_memtoReg_MEMWB: out    vl_logic;
        out_reg_regWriteDst_MEMWB: out    vl_logic_vector(4 downto 0);
        out_reg_memoryData_MEMWB: out    vl_logic_vector(31 downto 0);
        writeDataRegFile_MEMWB: out    vl_logic_vector(31 downto 0)
    );
end MEM_WB_Stage;
