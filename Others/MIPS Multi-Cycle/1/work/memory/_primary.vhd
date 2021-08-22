library verilog;
use verilog.vl_types.all;
entity memory is
    port(
        readad          : in     vl_logic_vector(11 downto 0);
        writead         : in     vl_logic_vector(11 downto 0);
        data            : in     vl_logic_vector(11 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        memwrite        : in     vl_logic;
        \out\           : out    vl_logic_vector(11 downto 0)
    );
end memory;
