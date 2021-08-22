library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pcWrite         : out    vl_logic;
        pcConditional   : out    vl_logic;
        IorD            : out    vl_logic;
        memRead         : out    vl_logic;
        memWrite        : out    vl_logic;
        IRWrite         : out    vl_logic;
        regWrite        : out    vl_logic;
        ALUSrcA         : out    vl_logic;
        regDst          : out    vl_logic_vector(1 downto 0);
        memtoreg        : out    vl_logic_vector(1 downto 0);
        ALUSrcB         : out    vl_logic_vector(1 downto 0);
        ALUOp           : out    vl_logic_vector(1 downto 0);
        PCSrc           : out    vl_logic_vector(1 downto 0);
        opCode          : in     vl_logic_vector(5 downto 0)
    );
end Controller;
