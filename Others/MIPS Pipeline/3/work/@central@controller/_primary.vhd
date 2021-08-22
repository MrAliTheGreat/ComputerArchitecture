library verilog;
use verilog.vl_types.all;
entity CentralController is
    port(
        OpCode          : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic;
        RegWrite        : out    vl_logic;
        AluSrc          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemWrite        : out    vl_logic;
        MemToReg        : out    vl_logic;
        SelPc           : out    vl_logic;
        Branch          : out    vl_logic;
        BranchNot       : out    vl_logic;
        AluOp           : out    vl_logic_vector(1 downto 0)
    );
end CentralController;
