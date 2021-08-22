library verilog;
use verilog.vl_types.all;
entity EX_MEM_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        RegWrite        : in     vl_logic;
        ALUSrc          : in     vl_logic;
        regDst          : in     vl_logic;
        memWrite        : in     vl_logic;
        memRead         : in     vl_logic;
        memtoReg        : in     vl_logic;
        MemWBregWrite   : in     vl_logic;
        ALU_operation   : in     vl_logic_vector(2 downto 0);
        Rt              : in     vl_logic_vector(4 downto 0);
        Rd              : in     vl_logic_vector(4 downto 0);
        Rs              : in     vl_logic_vector(4 downto 0);
        MemWBRd         : in     vl_logic_vector(4 downto 0);
        data1           : in     vl_logic_vector(31 downto 0);
        data2           : in     vl_logic_vector(31 downto 0);
        sign_extend_data: in     vl_logic_vector(31 downto 0);
        regFileWriteData_in: in     vl_logic_vector(31 downto 0);
        out_reg_zero_EXMEM: out    vl_logic;
        out_reg_RegWrite_EX_MEM: out    vl_logic;
        out_reg_memWrite_EX_MEM: out    vl_logic;
        out_reg_memRead_EX_MEM: out    vl_logic;
        out_reg_memtoReg_EX_MEM: out    vl_logic;
        out_reg_writeDst_EXMEM: out    vl_logic_vector(4 downto 0);
        out_reg_ALU_EXMEM: out    vl_logic_vector(31 downto 0);
        out_reg_memWriteData_EXMEM: out    vl_logic_vector(31 downto 0)
    );
end EX_MEM_Stage;
