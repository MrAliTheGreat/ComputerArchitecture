library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        RegWrite        : in     vl_logic;
        r1              : in     vl_logic_vector(4 downto 0);
        r2              : in     vl_logic_vector(4 downto 0);
        w               : in     vl_logic_vector(4 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        rdata1          : out    vl_logic_vector(31 downto 0);
        rdata2          : out    vl_logic_vector(31 downto 0)
    );
end register_file;
