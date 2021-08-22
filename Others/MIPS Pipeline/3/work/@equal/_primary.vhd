library verilog;
use verilog.vl_types.all;
entity Equal is
    port(
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic
    );
end Equal;
