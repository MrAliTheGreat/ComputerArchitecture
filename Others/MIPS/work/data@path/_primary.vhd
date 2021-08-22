library verilog;
use verilog.vl_types.all;
entity dataPath is
    port(
        ALUcntrl        : in     vl_logic_vector(1 downto 0);
        toReg           : in     vl_logic_vector(1 downto 0);
        regIn           : in     vl_logic_vector(1 downto 0);
        pcIn            : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        memRead         : in     vl_logic;
        memWrite        : in     vl_logic;
        aluIn           : in     vl_logic;
        regWrite        : in     vl_logic;
        reghi           : in     vl_logic;
        operation       : out    vl_logic_vector(5 downto 0);
        zero            : out    vl_logic
    );
end dataPath;
