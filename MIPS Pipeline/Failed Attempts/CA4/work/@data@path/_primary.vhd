library verilog;
use verilog.vl_types.all;
entity DataPath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ALUSrc          : in     vl_logic;
        regWrite        : in     vl_logic;
        memWrite        : in     vl_logic;
        memRead         : in     vl_logic;
        memtoReg        : in     vl_logic;
        regDst          : in     vl_logic;
        clearIFID       : in     vl_logic;
        ALUOperation    : in     vl_logic_vector(1 downto 0);
        pcSrc           : in     vl_logic_vector(1 downto 0);
        opCode          : out    vl_logic_vector(5 downto 0);
        equal           : out    vl_logic;
        select_cancel_controller: out    vl_logic
    );
end DataPath;
