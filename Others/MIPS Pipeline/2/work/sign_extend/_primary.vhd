library verilog;
use verilog.vl_types.all;
entity sign_extend is
    port(
        sein            : in     vl_logic_vector(15 downto 0);
        seout           : out    vl_logic_vector(31 downto 0)
    );
end sign_extend;
