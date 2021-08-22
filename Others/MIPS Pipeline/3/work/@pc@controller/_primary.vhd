library verilog;
use verilog.vl_types.all;
entity PcController is
    port(
        branch          : in     vl_logic;
        branchnot       : in     vl_logic;
        zero            : in     vl_logic;
        pcsrc           : out    vl_logic
    );
end PcController;
