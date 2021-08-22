library verilog;
use verilog.vl_types.all;
entity data_memory is
    port(
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        rdata           : out    vl_logic_vector(31 downto 0)
    );
end data_memory;
