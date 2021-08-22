library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        result          : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        ALUop           : in     vl_logic_vector(2 downto 0)
    );
end ALU;
