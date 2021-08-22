library verilog;
use verilog.vl_types.all;
entity ALUcontroller is
    port(
        func            : in     vl_logic_vector(5 downto 0);
        ALUOp           : in     vl_logic_vector(1 downto 0);
        Q               : out    vl_logic_vector(2 downto 0)
    );
end ALUcontroller;
