module memory(input [11:0] readad,writead,data,input clk,rst,memwrite,output reg[11:0] out);
  reg[11:0] mem[89:0];
  initial  $readmemb("memory.txt", mem);
  wire[12:0] ad;
  assign ad={1'b0,writead};
  always@(posedge clk,posedge rst)
  #1
    if(rst)
      out <= 0;
    else begin
      if(readad<1000)begin
        out <= mem[readad];
      end
      else if(readad<2000)begin
        out <= mem[readad-1000+60];
      end
      else if(readad<3000)begin
        out <= mem[readad-2000+70];
      end
      else if(readad<4000)begin
        out <= mem[readad-3000+80];
      end

      if(memwrite)
        if(ad<1000)begin
          mem[ad] <= data;
        end
        else if(ad<2000)begin
          mem[ad-1000+60] <= data;
        end
        else if(ad<3000)begin
          mem[ad-2000+70] <= data;
        end
        else if(ad<4000)begin
          mem[ad-3000+80] <= data;
        end 
    end
    
endmodule