library verilog;
use verilog.vl_types.all;
entity MainMemory is
    port(
        addr            : in     vl_logic_vector(14 downto 0);
        offset          : in     vl_logic_vector(1 downto 0);
        miss            : in     vl_logic;
        data            : out    vl_logic_vector(31 downto 0);
        ready           : out    vl_logic
    );
end MainMemory;
