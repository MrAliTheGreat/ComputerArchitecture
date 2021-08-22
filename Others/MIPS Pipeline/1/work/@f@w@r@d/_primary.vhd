library verilog;
use verilog.vl_types.all;
entity FWRD is
    port(
        Fa              : out    vl_logic_vector(1 downto 0);
        Fb              : out    vl_logic_vector(1 downto 0);
        rs              : in     vl_logic_vector(4 downto 0);
        rt              : in     vl_logic_vector(4 downto 0);
        EX_M_rd         : in     vl_logic_vector(4 downto 0);
        M_WB_rd         : in     vl_logic_vector(4 downto 0);
        EX_M_regwrite   : in     vl_logic;
        M_WB_regwrite   : in     vl_logic
    );
end FWRD;
