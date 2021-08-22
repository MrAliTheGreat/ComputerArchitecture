library verilog;
use verilog.vl_types.all;
entity Controller is
    generic(
        Idle            : integer := 0;
        Miss            : integer := 1;
        Write1          : integer := 2;
        Write2          : integer := 3;
        Write3          : integer := 4;
        Write4          : integer := 5;
        \Done\          : integer := 6
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        hit             : in     vl_logic;
        mainMemReady    : in     vl_logic;
        done            : out    vl_logic;
        cachMiss        : out    vl_logic;
        cachWrite       : out    vl_logic;
        cacheHit        : out    vl_logic;
        offset          : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Idle : constant is 1;
    attribute mti_svvh_generic_type of Miss : constant is 1;
    attribute mti_svvh_generic_type of Write1 : constant is 1;
    attribute mti_svvh_generic_type of Write2 : constant is 1;
    attribute mti_svvh_generic_type of Write3 : constant is 1;
    attribute mti_svvh_generic_type of Write4 : constant is 1;
    attribute mti_svvh_generic_type of \Done\ : constant is 1;
end Controller;
