library verilog;
use verilog.vl_types.all;
entity \IF\ is
    port(
        opcode          : out    vl_logic_vector(5 downto 0);
        rs              : out    vl_logic_vector(4 downto 0);
        rt              : out    vl_logic_vector(4 downto 0);
        rd              : out    vl_logic_vector(4 downto 0);
        immediate       : out    vl_logic_vector(15 downto 0);
        func            : out    vl_logic_vector(5 downto 0);
        eq              : in     vl_logic;
        jmp             : in     vl_logic;
        beq             : in     vl_logic;
        bne             : in     vl_logic;
        PCwrite         : in     vl_logic;
        awrite          : in     vl_logic;
        clk             : in     vl_logic
    );
end \IF\;
