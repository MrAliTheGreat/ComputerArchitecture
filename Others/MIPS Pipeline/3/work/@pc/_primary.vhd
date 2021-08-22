library verilog;
use verilog.vl_types.all;
entity Pc is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        ld              : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end Pc;
