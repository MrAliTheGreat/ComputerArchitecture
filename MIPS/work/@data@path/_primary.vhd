library verilog;
use verilog.vl_types.all;
entity DataPath is
    port(
        ALUcontrol      : in     vl_logic_vector(1 downto 0);
        regWriteDataSel : in     vl_logic_vector(1 downto 0);
        regIn           : in     vl_logic_vector(1 downto 0);
        pcSel           : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        memRead         : in     vl_logic;
        memWrite        : in     vl_logic;
        aluIn           : in     vl_logic;
        regWrite        : in     vl_logic;
        opCode          : out    vl_logic_vector(5 downto 0);
        zero            : out    vl_logic
    );
end DataPath;
