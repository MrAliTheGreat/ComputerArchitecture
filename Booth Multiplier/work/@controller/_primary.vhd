library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        x               : in     vl_logic_vector(5 downto 0);
        y               : in     vl_logic_vector(6 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        start           : in     vl_logic;
        ready           : out    vl_logic;
        ldx             : out    vl_logic;
        ldy             : out    vl_logic;
        ldp             : out    vl_logic;
        rst_p           : out    vl_logic;
        shift_p         : out    vl_logic;
        shift_y         : out    vl_logic;
        x_adder         : out    vl_logic_vector(5 downto 0)
    );
end Controller;
