library verilog;
use verilog.vl_types.all;
entity ID_EX_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        regWrite        : in     vl_logic;
        out_reg_regWriteMEMWB: in     vl_logic;
        ALUSrc          : in     vl_logic;
        regDst          : in     vl_logic;
        memWrite        : in     vl_logic;
        memRead         : in     vl_logic;
        memtoReg        : in     vl_logic;
        ALUop           : in     vl_logic_vector(1 downto 0);
        pcSrc           : in     vl_logic_vector(1 downto 0);
        out_reg_writeRegMEMWB: in     vl_logic_vector(4 downto 0);
        instr           : in     vl_logic_vector(31 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        out_reg_writeDataMEMWB: in     vl_logic_vector(31 downto 0);
        out_reg_RegWrite_IDEX: out    vl_logic;
        out_reg_ALUSrc_IDEX: out    vl_logic;
        out_reg_regDst_IDEX: out    vl_logic;
        out_reg_memWrite_IDEX: out    vl_logic;
        out_reg_memRead_IDEX: out    vl_logic;
        out_reg_memtoReg_IDEX: out    vl_logic;
        equal           : out    vl_logic;
        out_reg_ALUop_IDEX: out    vl_logic_vector(2 downto 0);
        hazard_signals  : out    vl_logic_vector(2 downto 0);
        out_reg_Rt_IDEX : out    vl_logic_vector(4 downto 0);
        out_reg_Rd_IDEX : out    vl_logic_vector(4 downto 0);
        out_reg_Rs_IDEX : out    vl_logic_vector(4 downto 0);
        opCode          : out    vl_logic_vector(5 downto 0);
        out_reg_data1_IDEX: out    vl_logic_vector(31 downto 0);
        out_reg_data2_IDEX: out    vl_logic_vector(31 downto 0);
        out_reg_SEData_IDEX: out    vl_logic_vector(31 downto 0);
        branch_address  : out    vl_logic_vector(31 downto 0);
        jump_address    : out    vl_logic_vector(31 downto 0)
    );
end ID_EX_Stage;
