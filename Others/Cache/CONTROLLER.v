module Controller(input clk, rst,hit, mainMemReady,output reg done, cachMiss, cachWrite,cacheHit,output reg [1:0] offset);
    parameter Idle =0 , Miss = 1, Write1 = 2, Write2 = 3 , Write3 = 4, Write4 = 5,Done = 6 ;
    reg  [2:0] ps,ns;
    always @(ps) begin
        ns = Idle;
        {done, cachMiss, cachWrite, offset} = 5'b0;
        case(ps)
            Idle: begin
                done = 1'b0;
                cachMiss = 1'b0;
                cachWrite = 1'b0;
                offset = 2'b00;
                ns = (hit) ? Done : Miss;
                cacheHit = hit;
            end
            Miss: begin
                done = 1'b0;
                cachMiss = 1'b1;
                cachWrite = 1'b0;
                offset = 2'b00;
                ns = (mainMemReady) ? Miss : Write1;
                cacheHit = 0;
            end
            Write1: begin
                done = 1'b0;
                cachMiss = 1'b0;
                cachWrite = 1'b1;
                offset = 2'b00;
                ns = Write2;
                cacheHit = 0;
            end
            Write2: begin
                done = 1'b0;
                cachMiss = 1'b0;
                cachWrite = 1'b1;
                offset = 2'b01;
                ns = Write3;
                cacheHit = 0;
            end
            Write3: begin
                done = 1'b0;
                cachMiss = 1'b0;
                cachWrite = 1'b1;
                offset = 2'b10;
                ns = Write4;
                cacheHit = 0;
            end
            Write4: begin
                done = 1'b0;
                cachMiss = 1'b0;
                cachWrite = 1'b1;
                offset = 2'b11;
                ns = Done;
                cacheHit = 0;
            end
            Done: begin
                done = 1'b1;
                cachMiss = 1'b0;
                cachWrite = 1'b0;
                offset = 2'b00;
                ns = Idle;
                cacheHit = 0;
            end
        endcase
    end
    always@(posedge clk, posedge rst)begin
        if(rst) ps <= Idle;
        else ps <= ns;
    end
endmodule
