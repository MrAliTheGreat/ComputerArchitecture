library verilog;
use verilog.vl_types.all;
entity allMemories is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        C_write_cache   : in     vl_logic;
        C_main_mem_miss : in     vl_logic;
        C_offset        : in     vl_logic_vector(1 downto 0);
        address         : in     vl_logic_vector(14 downto 0);
        cache_valid     : out    vl_logic;
        main_mem_ready  : out    vl_logic;
        is_wanted_data  : out    vl_logic
    );
end allMemories;
