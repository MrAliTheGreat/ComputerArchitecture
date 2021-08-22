library verilog;
use verilog.vl_types.all;
entity AluController is
    port(
        func            : in     vl_logic_vector(5 downto 0);
        aluop           : in     vl_logic_vector(1 downto 0);
        aluoperation    : out    vl_logic_vector(2 downto 0)
    );
end AluController;
