library verilog;
use verilog.vl_types.all;
entity MEM_WB_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        out_ALU         : in     vl_logic_vector(31 downto 0);
        memWriteData    : in     vl_logic_vector(31 downto 0);
        regWriteDst     : in     vl_logic_vector(4 downto 0);
        RegWrite        : in     vl_logic;
        memWrite        : in     vl_logic;
        memRead         : in     vl_logic;
        memtoReg        : in     vl_logic;
        memory_reg_out  : out    vl_logic_vector(31 downto 0);
        writeDataRegFile_reg_out: out    vl_logic_vector(31 downto 0);
        regWriteDst_reg_out: out    vl_logic_vector(4 downto 0);
        out_reg_RegWrite: out    vl_logic;
        out_reg_memtoReg: out    vl_logic
    );
end MEM_WB_Stage;
