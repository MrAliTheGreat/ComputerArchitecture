library verilog;
use verilog.vl_types.all;
entity Adder_6_bit is
    port(
        y               : in     vl_logic_vector(5 downto 0);
        p               : in     vl_logic_vector(5 downto 0);
        Q               : out    vl_logic_vector(5 downto 0)
    );
end Adder_6_bit;
