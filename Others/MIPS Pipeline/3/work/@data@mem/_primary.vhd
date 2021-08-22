library verilog;
use verilog.vl_types.all;
entity DataMem is
    port(
        address         : in     vl_logic_vector(31 downto 0);
        writedata       : in     vl_logic_vector(31 downto 0);
        memread         : in     vl_logic;
        memwrite        : in     vl_logic;
        clk             : in     vl_logic;
        readdata        : out    vl_logic_vector(31 downto 0);
        mem1            : out    vl_logic_vector(31 downto 0);
        mem2            : out    vl_logic_vector(31 downto 0);
        rst             : in     vl_logic
    );
end DataMem;
