library verilog;
use verilog.vl_types.all;
entity IFID is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        flush           : in     vl_logic;
        pcin            : in     vl_logic_vector(31 downto 0);
        instin          : in     vl_logic_vector(31 downto 0)
    );
end IFID;
