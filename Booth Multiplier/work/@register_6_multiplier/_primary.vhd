library verilog;
use verilog.vl_types.all;
entity Register_6_multiplier is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        shift_en        : in     vl_logic;
        serIn           : in     vl_logic_vector(5 downto 0);
        Q               : out    vl_logic_vector(6 downto 0)
    );
end Register_6_multiplier;
