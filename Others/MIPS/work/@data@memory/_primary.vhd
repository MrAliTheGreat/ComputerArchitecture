library verilog;
use verilog.vl_types.all;
entity DataMemory is
    port(
        address1        : in     vl_logic_vector(31 downto 0);
        writeData       : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        write           : in     vl_logic;
        read            : in     vl_logic;
        readData        : out    vl_logic_vector(31 downto 0)
    );
end DataMemory;
