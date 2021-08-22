library verilog;
use verilog.vl_types.all;
entity InstMem is
    port(
        address         : in     vl_logic_vector(31 downto 0);
        ins             : out    vl_logic_vector(31 downto 0);
        rst             : in     vl_logic
    );
end InstMem;
