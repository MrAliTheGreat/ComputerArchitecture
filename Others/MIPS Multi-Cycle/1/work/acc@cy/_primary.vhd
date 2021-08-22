library verilog;
use verilog.vl_types.all;
entity accCy is
    port(
        accin           : in     vl_logic_vector(11 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clearacc        : in     vl_logic;
        clearcy         : in     vl_logic;
        compacc         : in     vl_logic;
        compcy          : in     vl_logic;
        RL              : in     vl_logic;
        RR              : in     vl_logic;
        cywrite         : in     vl_logic;
        accwrite        : in     vl_logic;
        cyin            : in     vl_logic;
        accout          : out    vl_logic_vector(11 downto 0);
        cyout           : out    vl_logic;
        accminus        : out    vl_logic;
        acczero         : out    vl_logic
    );
end accCy;
