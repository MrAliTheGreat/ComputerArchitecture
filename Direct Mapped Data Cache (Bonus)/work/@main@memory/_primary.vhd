library verilog;
use verilog.vl_types.all;
entity MainMemory is
    port(
        main_mem_miss   : in     vl_logic;
        offset          : in     vl_logic_vector(1 downto 0);
        address         : in     vl_logic_vector(14 downto 0);
        main_mem_ready  : out    vl_logic;
        main_mem_data   : out    vl_logic_vector(31 downto 0)
    );
end MainMemory;
