library verilog;
use verilog.vl_types.all;
entity DataPath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        C_ALUSrc        : in     vl_logic;
        C_regWrite      : in     vl_logic;
        C_memWrite      : in     vl_logic;
        C_memRead       : in     vl_logic;
        C_memtoReg      : in     vl_logic;
        C_regDst        : in     vl_logic;
        C_ALUOperation  : in     vl_logic_vector(1 downto 0);
        C_pcSrc         : in     vl_logic_vector(1 downto 0);
        equal           : out    vl_logic;
        opCode          : out    vl_logic_vector(5 downto 0)
    );
end DataPath;
