library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        cache_hit       : in     vl_logic;
        main_mem_ready  : in     vl_logic;
        offset          : out    vl_logic_vector(1 downto 0);
        finish_OutSignal: out    vl_logic;
        hit_OutSignal   : out    vl_logic;
        cache_miss      : out    vl_logic;
        write_cache     : out    vl_logic
    );
end Controller;
