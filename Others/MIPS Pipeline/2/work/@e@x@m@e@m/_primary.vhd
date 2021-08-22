library verilog;
use verilog.vl_types.all;
entity EXMEM is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        zeroin          : in     vl_logic;
        RegWritein      : in     vl_logic;
        MemWritein      : in     vl_logic;
        MemReadin       : in     vl_logic;
        PCsrcin         : in     vl_logic;
        MemtoRegin      : in     vl_logic_vector(1 downto 0);
        win             : in     vl_logic_vector(4 downto 0);
        pcp4in          : in     vl_logic_vector(31 downto 0);
        pcin            : in     vl_logic_vector(31 downto 0);
        Oin             : in     vl_logic_vector(31 downto 0);
        rdata2in        : in     vl_logic_vector(31 downto 0)
    );
end EXMEM;
