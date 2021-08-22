module Cache(input clk,rst,input [31:0] data,input[14:0] addr,input write,output [2:0] outTag, output outValid);
    reg [31:0] mem [4095:0];
    reg [2:0] tag [4095:0];
    reg valid [4095:0];

    assign outTag = (rst == 0) ? tag[addr[11:0]] : 2'b00;
    assign outValid = valid[addr[11:0]];

    always @(posedge clk,posedge rst) begin
        if (rst) begin: RST
            integer i;
            for (i = 0;i <= 4096;i = i+1) begin
                valid[i] = 1'b0;
            end
        end
        else if(write) begin
            mem[addr[11:0]] <= data;
            tag[addr[11:0]] <= addr[14:12];
            valid[addr[11:0]] <= 1'b1;
        end
    end

endmodule
