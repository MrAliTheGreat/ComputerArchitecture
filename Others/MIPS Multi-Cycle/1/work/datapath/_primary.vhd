library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        instruction     : out    vl_logic_vector(11 downto 0);
        readadsrc       : in     vl_logic_vector(1 downto 0);
        Asrc            : in     vl_logic_vector(1 downto 0);
        writedatasrc    : in     vl_logic_vector(1 downto 0);
        memwrite        : in     vl_logic;
        ldALUnext       : in     vl_logic;
        ldinst          : in     vl_logic;
        Bsrc            : in     vl_logic;
        writeadsrc      : in     vl_logic;
        doi             : in     vl_logic;
        ld1             : in     vl_logic;
        ld2             : in     vl_logic;
        pcld            : in     vl_logic;
        pcsrc           : in     vl_logic;
        op              : in     vl_logic;
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
        cyout           : out    vl_logic;
        accminus        : out    vl_logic;
        acczero         : out    vl_logic
    );
end datapath;
