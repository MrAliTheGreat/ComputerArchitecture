library verilog;
use verilog.vl_types.all;
entity ALUcontroller is
    port(
        opCode          : in     vl_logic_vector(5 downto 0);
        ALUOp           : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end ALUcontroller;
