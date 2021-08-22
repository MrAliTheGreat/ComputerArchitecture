module PcController(branch, branchnot, zero, pcsrc);
input branch, branchnot, zero;
output pcsrc;

    assign pcsrc = (zero & branch) | ((~zero) & branchnot);

endmodule
