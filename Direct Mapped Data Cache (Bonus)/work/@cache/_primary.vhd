library verilog;
use verilog.vl_types.all;
entity Cache is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        write           : in     vl_logic;
        address         : in     vl_logic_vector(14 downto 0);
        data            : in     vl_logic_vector(31 downto 0);
        valid           : out    vl_logic;
        tag             : out    vl_logic_vector(1 downto 0)
    );
end Cache;
