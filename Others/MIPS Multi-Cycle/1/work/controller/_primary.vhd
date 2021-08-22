library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        instruction     : in     vl_logic_vector(11 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        cyout           : in     vl_logic;
        accminus        : in     vl_logic;
        acczero         : in     vl_logic;
        readadsrc       : out    vl_logic_vector(1 downto 0);
        Asrc            : out    vl_logic_vector(1 downto 0);
        writedatasrc    : out    vl_logic_vector(1 downto 0);
        memwrite        : out    vl_logic;
        ldALUnext       : out    vl_logic;
        ldinst          : out    vl_logic;
        Bsrc            : out    vl_logic;
        writeadsrc      : out    vl_logic;
        doi             : out    vl_logic;
        ld1             : out    vl_logic;
        ld2             : out    vl_logic;
        pcld            : out    vl_logic;
        pcsrc           : out    vl_logic;
        op              : out    vl_logic;
        clearacc        : out    vl_logic;
        clearcy         : out    vl_logic;
        compacc         : out    vl_logic;
        compcy          : out    vl_logic;
        RL              : out    vl_logic;
        RR              : out    vl_logic;
        cywrite         : out    vl_logic;
        accwrite        : out    vl_logic
    );
end controller;
