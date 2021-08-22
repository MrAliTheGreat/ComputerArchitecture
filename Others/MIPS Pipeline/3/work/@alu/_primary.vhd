library verilog;
use verilog.vl_types.all;
entity Alu is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        aluOperation    : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic
    );
end Alu;
