library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        address         : out    vl_logic_vector(31 downto 0);
        jmp_address     : in     vl_logic_vector(25 downto 0);
        cond_offset     : in     vl_logic_vector(15 downto 0);
        eq              : in     vl_logic;
        jmp             : in     vl_logic;
        beq             : in     vl_logic;
        bne             : in     vl_logic;
        PCwrite         : in     vl_logic;
        clk             : in     vl_logic
    );
end PC;
