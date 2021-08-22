library verilog;
use verilog.vl_types.all;
entity RegFile is
    port(
        readreg1        : in     vl_logic_vector(4 downto 0);
        readreg2        : in     vl_logic_vector(4 downto 0);
        writereg        : in     vl_logic_vector(4 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        regwrite        : in     vl_logic;
        writedata       : in     vl_logic_vector(31 downto 0);
        readdata1       : out    vl_logic_vector(31 downto 0);
        readdata2       : out    vl_logic_vector(31 downto 0)
    );
end RegFile;
