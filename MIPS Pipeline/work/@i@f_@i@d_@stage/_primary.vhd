library verilog;
use verilog.vl_types.all;
entity IF_ID_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld_pc           : in     vl_logic;
        ld_reg_instrIFID: in     vl_logic;
        pcSrc           : in     vl_logic_vector(1 downto 0);
        out_pc          : in     vl_logic_vector(31 downto 0);
        out_reg_instrIFID: out    vl_logic_vector(31 downto 0);
        out_reg_pcIFID  : out    vl_logic_vector(31 downto 0)
    );
end IF_ID_Stage;
