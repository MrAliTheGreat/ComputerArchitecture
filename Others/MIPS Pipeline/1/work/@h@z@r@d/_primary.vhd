library verilog;
use verilog.vl_types.all;
entity HZRD is
    port(
        awrite          : out    vl_logic;
        PCwrite         : out    vl_logic;
        ctrl            : out    vl_logic;
        ID_EX_rt        : in     vl_logic_vector(4 downto 0);
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        ID_EX_memread   : in     vl_logic;
        jmp             : in     vl_logic;
        dst             : in     vl_logic;
        memwrite        : in     vl_logic;
        beq             : in     vl_logic;
        bne             : in     vl_logic
    );
end HZRD;
