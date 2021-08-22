library verilog;
use verilog.vl_types.all;
entity PipeLine is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mem1            : out    vl_logic_vector(31 downto 0);
        mem2            : out    vl_logic_vector(31 downto 0)
    );
end PipeLine;
