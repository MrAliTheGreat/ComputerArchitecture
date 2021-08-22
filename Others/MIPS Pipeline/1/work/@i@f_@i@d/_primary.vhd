library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        jmp_address     : out    vl_logic_vector(25 downto 0);
        opcode          : out    vl_logic_vector(5 downto 0);
        rs              : out    vl_logic_vector(4 downto 0);
        rt              : out    vl_logic_vector(4 downto 0);
        rd              : out    vl_logic_vector(4 downto 0);
        immediate       : out    vl_logic_vector(15 downto 0);
        func            : out    vl_logic_vector(5 downto 0);
        instruction     : in     vl_logic_vector(31 downto 0);
        awrite          : in     vl_logic;
        aclr            : in     vl_logic;
        clk             : in     vl_logic
    );
end IF_ID;
