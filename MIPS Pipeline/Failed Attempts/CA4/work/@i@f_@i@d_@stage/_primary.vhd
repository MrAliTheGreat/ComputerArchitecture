library verilog;
use verilog.vl_types.all;
entity IF_ID_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clearIFID       : in     vl_logic;
        lw_hazard       : in     vl_logic_vector(2 downto 0);
        current_pc      : in     vl_logic_vector(31 downto 0);
        instr_reg_out   : out    vl_logic_vector(31 downto 0);
        pc_reg_out      : out    vl_logic_vector(31 downto 0)
    );
end IF_ID_Stage;
