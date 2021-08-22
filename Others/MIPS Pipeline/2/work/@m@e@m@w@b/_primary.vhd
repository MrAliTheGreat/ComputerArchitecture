library verilog;
use verilog.vl_types.all;
entity MEMWB is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        RegWritein      : in     vl_logic;
        MemtoRegin      : in     vl_logic_vector(1 downto 0);
        win             : in     vl_logic_vector(4 downto 0);
        pcp4in          : in     vl_logic_vector(31 downto 0);
        rdatain         : in     vl_logic_vector(31 downto 0);
        Oin             : in     vl_logic_vector(31 downto 0)
    );
end MEMWB;
