library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        x               : in     vl_logic_vector(5 downto 0);
        y               : in     vl_logic_vector(5 downto 0);
        x_adder         : in     vl_logic_vector(5 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ldx             : in     vl_logic;
        ldy             : in     vl_logic;
        ldp             : in     vl_logic;
        shift_y         : in     vl_logic;
        shift_p         : in     vl_logic;
        rst_p           : in     vl_logic;
        output_y        : out    vl_logic_vector(6 downto 0);
        result          : out    vl_logic_vector(10 downto 0)
    );
end Datapath;
