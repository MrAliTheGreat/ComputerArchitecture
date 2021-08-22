library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pcWrite         : in     vl_logic;
        pcConditional   : in     vl_logic;
        IorD            : in     vl_logic;
        memRead         : in     vl_logic;
        memWrite        : in     vl_logic;
        IRWrite         : in     vl_logic;
        regWrite        : in     vl_logic;
        ALUSrcA         : in     vl_logic;
        regDst          : in     vl_logic_vector(1 downto 0);
        memtoreg        : in     vl_logic_vector(1 downto 0);
        ALUSrcB         : in     vl_logic_vector(1 downto 0);
        ALUOp           : in     vl_logic_vector(1 downto 0);
        PCSrc           : in     vl_logic_vector(1 downto 0);
        opCode          : out    vl_logic_vector(5 downto 0)
    );
end Datapath;
