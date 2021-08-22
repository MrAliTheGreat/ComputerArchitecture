library verilog;
use verilog.vl_types.all;
entity Reg1 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld              : in     vl_logic;
        \in\            : in     vl_logic;
        \out\           : out    vl_logic
    );
end Reg1;
