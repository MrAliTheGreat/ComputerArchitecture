library verilog;
use verilog.vl_types.all;
entity DM is
    port(
        read_data       : out    vl_logic_vector(31 downto 0);
        address         : in     vl_logic_vector(31 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        memread         : in     vl_logic;
        memwrite        : in     vl_logic;
        clk             : in     vl_logic
    );
end DM;
