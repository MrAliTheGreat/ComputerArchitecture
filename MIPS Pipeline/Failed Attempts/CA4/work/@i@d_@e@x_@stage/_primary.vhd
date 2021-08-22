library verilog;
use verilog.vl_types.all;
entity ID_EX_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instr           : in     vl_logic_vector(31 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        writeData       : in     vl_logic_vector(31 downto 0);
        RegWrite        : in     vl_logic;
        RegWriteFinal   : in     vl_logic;
        ALUSrc          : in     vl_logic;
        regDst          : in     vl_logic;
        memWrite        : in     vl_logic;
        memRead         : in     vl_logic;
        memtoReg        : in     vl_logic;
        ALUop           : in     vl_logic_vector(1 downto 0);
        pcSrc           : in     vl_logic_vector(1 downto 0);
        writeReg        : in     vl_logic_vector(4 downto 0);
        data1_reg_out   : out    vl_logic_vector(31 downto 0);
        data2_reg_out   : out    vl_logic_vector(31 downto 0);
        out_reg_sign_extend: out    vl_logic_vector(31 downto 0);
        out_reg_Rt      : out    vl_logic_vector(4 downto 0);
        out_reg_Rd      : out    vl_logic_vector(4 downto 0);
        out_reg_RegWrite: out    vl_logic;
        out_reg_ALUSrc  : out    vl_logic;
        out_reg_regDst  : out    vl_logic;
        out_reg_memWrite: out    vl_logic;
        out_reg_memRead : out    vl_logic;
        out_reg_memtoReg: out    vl_logic;
        out_reg_ALUop   : out    vl_logic_vector(2 downto 0);
        opCode          : out    vl_logic_vector(5 downto 0);
        equal           : out    vl_logic;
        branch_address  : out    vl_logic_vector(31 downto 0);
        jump_address    : out    vl_logic_vector(31 downto 0);
        out_reg_Rs      : out    vl_logic_vector(4 downto 0)
    );
end ID_EX_Stage;
