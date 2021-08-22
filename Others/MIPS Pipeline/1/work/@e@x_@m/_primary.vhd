library verilog;
use verilog.vl_types.all;
entity EX_M is
    port(
        EX_M_result     : out    vl_logic_vector(31 downto 0);
        EX_M_write_data : out    vl_logic_vector(31 downto 0);
        EX_M_rd         : out    vl_logic_vector(4 downto 0);
        EX_M_memread    : out    vl_logic;
        EX_M_memwrite   : out    vl_logic;
        EX_M_memtoreg   : out    vl_logic;
        EX_M_regwrite   : out    vl_logic;
        result          : in     vl_logic_vector(31 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        memread         : in     vl_logic;
        memwrite        : in     vl_logic;
        memtoreg        : in     vl_logic;
        regwrite        : in     vl_logic;
        clk             : in     vl_logic
    );
end EX_M;
