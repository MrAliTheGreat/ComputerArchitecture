library verilog;
use verilog.vl_types.all;
entity Reg3_clear is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld              : in     vl_logic;
        clear           : in     vl_logic;
        \in\            : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end Reg3_clear;
