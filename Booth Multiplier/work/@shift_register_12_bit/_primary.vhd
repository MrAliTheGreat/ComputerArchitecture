library verilog;
use verilog.vl_types.all;
entity Shift_register_12_bit is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        shift_en        : in     vl_logic;
        shift_value     : in     vl_logic;
        serIn           : in     vl_logic_vector(5 downto 0);
        Q               : out    vl_logic_vector(11 downto 0)
    );
end Shift_register_12_bit;
