library verilog;
use verilog.vl_types.all;
entity Reg2 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld              : in     vl_logic;
        \in\            : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(1 downto 0)
    );
end Reg2;
