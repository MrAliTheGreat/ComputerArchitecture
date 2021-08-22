library verilog;
use verilog.vl_types.all;
entity MIPS_Processor is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end MIPS_Processor;
