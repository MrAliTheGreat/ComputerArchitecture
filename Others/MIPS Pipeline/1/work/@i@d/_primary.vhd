library verilog;
use verilog.vl_types.all;
entity ID is
    port(
        ID_EX_rs_content: out    vl_logic_vector(31 downto 0);
        ID_EX_rt_content: out    vl_logic_vector(31 downto 0);
        ID_EX_immediate : out    vl_logic_vector(31 downto 0);
        ID_EX_rs        : out    vl_logic_vector(4 downto 0);
        ID_EX_rt        : out    vl_logic_vector(4 downto 0);
        ID_EX_rd        : out    vl_logic_vector(4 downto 0);
        ID_EX_ALUop     : out    vl_logic_vector(2 downto 0);
        eq              : out    vl_logic;
        jmp             : out    vl_logic;
        beq             : out    vl_logic;
        bne             : out    vl_logic;
        PCwrite         : out    vl_logic;
        awrite          : out    vl_logic;
        ID_EX_ALUsrc    : out    vl_logic;
        ID_EX_dst       : out    vl_logic;
        ID_EX_memread   : out    vl_logic;
        ID_EX_memwrite  : out    vl_logic;
        ID_EX_memtoreg  : out    vl_logic;
        ID_EX_regwrite  : out    vl_logic;
        M_WB_write_data : in     vl_logic_vector(31 downto 0);
        immediate       : in     vl_logic_vector(15 downto 0);
        opcode          : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        M_WB_write_reg  : in     vl_logic_vector(4 downto 0);
        M_WB_regwrite   : in     vl_logic;
        clk             : in     vl_logic
    );
end ID;
