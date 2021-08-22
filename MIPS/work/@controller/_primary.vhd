library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        ALUcontrol      : out    vl_logic_vector(1 downto 0);
        regWriteDataSel : out    vl_logic_vector(1 downto 0);
        regIn           : out    vl_logic_vector(1 downto 0);
        pcSel           : out    vl_logic_vector(1 downto 0);
        memRead         : out    vl_logic;
        memWrite        : out    vl_logic;
        aluIn           : out    vl_logic;
        regWrite        : out    vl_logic;
        opCode          : in     vl_logic_vector(5 downto 0);
        zero            : in     vl_logic
    );
end Controller;
