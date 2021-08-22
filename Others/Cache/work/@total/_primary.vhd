library verilog;
use verilog.vl_types.all;
entity Total is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        addr            : in     vl_logic_vector(14 downto 0);
        done            : out    vl_logic;
        cachHit         : out    vl_logic
    );
end Total;
