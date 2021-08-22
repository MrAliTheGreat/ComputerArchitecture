library verilog;
use verilog.vl_types.all;
entity ForwardingUnit is
    port(
        EX_MEM_RegWrite : in     vl_logic;
        EX_MEM_Rd       : in     vl_logic_vector(4 downto 0);
        ID_EX_Rs        : in     vl_logic_vector(4 downto 0);
        ID_EX_Rt        : in     vl_logic_vector(4 downto 0);
        MEM_WB_RegWrite : in     vl_logic;
        MEM_WB_Rd       : in     vl_logic_vector(4 downto 0);
        SelA            : out    vl_logic_vector(1 downto 0);
        SelB            : out    vl_logic_vector(1 downto 0)
    );
end ForwardingUnit;
