library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        op              : in     vl_logic_vector(5 downto 0);
        RegWrite        : out    vl_logic;
        alusrc          : out    vl_logic;
        branch          : out    vl_logic;
        branchnot       : out    vl_logic;
        jump            : out    vl_logic;
        MemRead         : out    vl_logic;
        MemWrite        : out    vl_logic;
        aluop           : out    vl_logic_vector(1 downto 0);
        MemtoReg        : out    vl_logic_vector(1 downto 0);
        RegDst          : out    vl_logic_vector(1 downto 0)
    );
end controller;
