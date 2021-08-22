library verilog;
use verilog.vl_types.all;
entity Cache is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        addr            : in     vl_logic_vector(14 downto 0);
        write           : in     vl_logic;
        outTag          : out    vl_logic_vector(2 downto 0);
        outValid        : out    vl_logic
    );
end Cache;
