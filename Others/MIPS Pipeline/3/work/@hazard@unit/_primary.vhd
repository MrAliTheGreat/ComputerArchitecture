library verilog;
use verilog.vl_types.all;
entity HazardUnit is
    port(
        ID_EX_MemRead   : in     vl_logic;
        ID_EX_Rt        : in     vl_logic_vector(4 downto 0);
        EX_MEM_Rt       : in     vl_logic_vector(4 downto 0);
        Rs              : in     vl_logic_vector(4 downto 0);
        Rt              : in     vl_logic_vector(4 downto 0);
        PcWrite         : out    vl_logic;
        IF_ID_Write     : out    vl_logic;
        branch          : in     vl_logic;
        ID_EX_RegWrite  : in     vl_logic;
        EX_MEM_RegWrite : in     vl_logic;
        WB_RegWrite     : in     vl_logic;
        WB_Rt           : in     vl_logic_vector(4 downto 0);
        SelController   : out    vl_logic
    );
end HazardUnit;
