library verilog;
use verilog.vl_types.all;
entity EX is
    port(
        EX_M_result     : out    vl_logic_vector(31 downto 0);
        EX_M_write_data : out    vl_logic_vector(31 downto 0);
        EX_M_rd         : out    vl_logic_vector(4 downto 0);
        EX_M_memread    : out    vl_logic;
        EX_M_memwrite   : out    vl_logic;
        EX_M_memtoreg   : out    vl_logic;
        EX_M_regwrite   : out    vl_logic;
        rs_content      : in     vl_logic_vector(31 downto 0);
        rt_content      : in     vl_logic_vector(31 downto 0);
        immediate       : in     vl_logic_vector(31 downto 0);
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        M_WB_rd         : in     vl_logic_vector(4 downto 0);
        M_WB_data       : in     vl_logic_vector(31 downto 0);
        M_WB_regwrite   : in     vl_logic;
        ALUsrc          : in     vl_logic;
        ALUop           : in     vl_logic_vector(2 downto 0);
        dst             : in     vl_logic;
        memread         : in     vl_logic;
        memwrite        : in     vl_logic;
        memtoreg        : in     vl_logic;
        regwrite        : in     vl_logic;
        clk             : in     vl_logic
    );
end EX;
