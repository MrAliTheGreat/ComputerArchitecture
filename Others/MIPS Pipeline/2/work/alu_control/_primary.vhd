library verilog;
use verilog.vl_types.all;
entity alu_control is
    port(
        aluop           : in     vl_logic_vector(1 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        f               : out    vl_logic_vector(3 downto 0)
    );
end alu_control;
