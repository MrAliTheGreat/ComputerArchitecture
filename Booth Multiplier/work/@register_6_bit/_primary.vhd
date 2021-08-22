library verilog;
use verilog.vl_types.all;
entity Register_6_bit is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        serIn           : in     vl_logic_vector(5 downto 0);
        Q               : out    vl_logic_vector(5 downto 0)
    );
end Register_6_bit;
