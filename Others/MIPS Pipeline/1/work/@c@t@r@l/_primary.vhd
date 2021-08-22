library verilog;
use verilog.vl_types.all;
entity CTRL is
    port(
        jmp             : out    vl_logic;
        beq             : out    vl_logic;
        bne             : out    vl_logic;
        ALUsrc          : out    vl_logic;
        dst             : out    vl_logic;
        memread         : out    vl_logic;
        memwrite        : out    vl_logic;
        memtoreg        : out    vl_logic;
        regwrite        : out    vl_logic;
        ALUop           : out    vl_logic_vector(2 downto 0);
        opcode          : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0)
    );
end CTRL;
