library verilog;
use verilog.vl_types.all;
entity MEM is
    port(
        M_WB_data       : out    vl_logic_vector(31 downto 0);
        M_WB_rd         : out    vl_logic_vector(4 downto 0);
        M_WB_regwrite   : out    vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        rd              : in     vl_logic_vector(4 downto 0);
        memread         : in     vl_logic;
        memwrite        : in     vl_logic;
        memtoreg        : in     vl_logic;
        regwrite        : in     vl_logic;
        clk             : in     vl_logic
    );
end MEM;
