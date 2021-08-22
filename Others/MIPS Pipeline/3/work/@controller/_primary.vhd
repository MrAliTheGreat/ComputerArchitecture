library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        OpCode          : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        Zero            : in     vl_logic;
        RegDst          : out    vl_logic;
        RegWrite        : out    vl_logic;
        AluSrc          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemWrite        : out    vl_logic;
        MemToReg        : out    vl_logic;
        SelWriteReg     : out    vl_logic;
        SelData         : out    vl_logic;
        SelPc           : out    vl_logic;
        AluOperation    : out    vl_logic_vector(2 downto 0);
        PcSrc           : out    vl_logic;
        Flush           : out    vl_logic
    );
end Controller;
