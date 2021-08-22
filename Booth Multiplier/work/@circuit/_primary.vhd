library verilog;
use verilog.vl_types.all;
entity Circuit is
    port(
        x               : in     vl_logic_vector(5 downto 0);
        y               : in     vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        ready           : out    vl_logic;
        result          : out    vl_logic_vector(10 downto 0)
    );
end Circuit;
