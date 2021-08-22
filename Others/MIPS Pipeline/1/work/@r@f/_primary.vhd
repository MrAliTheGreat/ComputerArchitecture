library verilog;
use verilog.vl_types.all;
entity RF is
    port(
        rs_content      : out    vl_logic_vector(31 downto 0);
        rt_content      : out    vl_logic_vector(31 downto 0);
        eq              : out    vl_logic;
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        write_reg       : in     vl_logic_vector(4 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        regwrite        : in     vl_logic
    );
end RF;
