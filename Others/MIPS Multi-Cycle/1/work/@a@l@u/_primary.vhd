library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        op              : in     vl_logic;
        A               : in     vl_logic_vector(11 downto 0);
        B               : in     vl_logic_vector(11 downto 0);
        \out\           : out    vl_logic_vector(11 downto 0);
        carry           : out    vl_logic
    );
end ALU;
