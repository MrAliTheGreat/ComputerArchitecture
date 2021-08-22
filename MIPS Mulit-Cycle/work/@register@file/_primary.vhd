library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        readData1       : in     vl_logic_vector(4 downto 0);
        readData2       : in     vl_logic_vector(4 downto 0);
        writeReg        : in     vl_logic_vector(4 downto 0);
        writeData       : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        regWrite        : in     vl_logic;
        Data1           : out    vl_logic_vector(31 downto 0);
        Data2           : out    vl_logic_vector(31 downto 0)
    );
end RegisterFile;
