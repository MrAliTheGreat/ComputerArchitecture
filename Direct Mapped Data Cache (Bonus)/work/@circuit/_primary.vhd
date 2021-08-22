library verilog;
use verilog.vl_types.all;
entity Circuit is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        address         : in     vl_logic_vector(14 downto 0);
        hit_OUT         : out    vl_logic;
        finish_OUT      : out    vl_logic
    );
end Circuit;
