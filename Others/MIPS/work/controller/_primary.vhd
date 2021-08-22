library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        ALUcntrl        : out    vl_logic_vector(1 downto 0);
        toReg           : out    vl_logic_vector(1 downto 0);
        regIn           : out    vl_logic_vector(1 downto 0);
        pcIn            : out    vl_logic_vector(1 downto 0);
        memRead         : out    vl_logic;
        memWrite        : out    vl_logic;
        aluIn           : out    vl_logic;
        regWrite        : out    vl_logic;
        reghi           : out    vl_logic;
        operation       : in     vl_logic_vector(5 downto 0);
        zero            : in     vl_logic
    );
end controller;
