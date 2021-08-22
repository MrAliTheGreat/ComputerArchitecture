library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        equal           : in     vl_logic;
        opCode          : in     vl_logic_vector(5 downto 0);
        ALUSrc          : out    vl_logic;
        regWrite        : out    vl_logic;
        memWrite        : out    vl_logic;
        memRead         : out    vl_logic;
        memtoReg        : out    vl_logic;
        regDst          : out    vl_logic;
        ALUOperation    : out    vl_logic_vector(1 downto 0);
        pcSrc           : out    vl_logic_vector(1 downto 0)
    );
end Controller;
