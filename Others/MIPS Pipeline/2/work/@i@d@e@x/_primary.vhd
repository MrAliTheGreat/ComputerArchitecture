library verilog;
use verilog.vl_types.all;
entity IDEX is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        RegWritein      : in     vl_logic;
        MemWritein      : in     vl_logic;
        MemReadin       : in     vl_logic;
        PCsrcin         : in     vl_logic;
        ALUsrcin        : in     vl_logic;
        RegDstin        : in     vl_logic_vector(1 downto 0);
        ALUopin         : in     vl_logic_vector(1 downto 0);
        MemtoRegin      : in     vl_logic_vector(1 downto 0);
        inst2016in      : in     vl_logic_vector(4 downto 0);
        inst1511in      : in     vl_logic_vector(4 downto 0);
        funcin          : in     vl_logic_vector(5 downto 0);
        pcp4in          : in     vl_logic_vector(31 downto 0);
        rdata1in        : in     vl_logic_vector(31 downto 0);
        rdata2in        : in     vl_logic_vector(31 downto 0);
        signexin        : in     vl_logic_vector(31 downto 0)
    );
end IDEX;
