module controller(output reg[1:0] ALUcntrl,toReg,regIn,pcIn ,output reg memRead,memWrite,aluIn,regWrite,reghi ,input[5:0] operation,input zero);
  always@(operation,zero)begin
    case(operation)
      6'b000000: begin
        ALUcntrl=10;
        toReg=0;
        regIn=1;
        pcIn=0;
        {memRead,memWrite,aluIn,regWrite,reghi} = 5'b00010;
      end
      6'b001000: begin 
        ALUcntrl=10;
        toReg=0;
        regIn=0;
        pcIn=0;
        {memRead,memWrite,aluIn,regWrite,reghi} = 5'b00110;
      end
      6'b001010: begin 
        ALUcntrl=10;
        toReg=0;
        regIn=1;
        pcIn=0;
        {memRead,memWrite,aluIn,regWrite,reghi} = 5'b00110;
      end
      6'b100011: begin 
        ALUcntrl=00;
        toReg=1;
        regIn=0;
        pcIn=0;
        {memRead,memWrite,aluIn,regWrite,reghi} = 5'b10110;
      end
      6'b101011: begin 
        ALUcntrl=00;
        pcIn=0;
        {memRead,memWrite,aluIn,regWrite,reghi} = 5'b01100;
      end
      6'b000010: begin 
        pcIn=1;
        {memRead,memWrite,aluIn,regWrite,reghi} = 5'b00000;
      end 
      6'b000011: begin
        toReg=2;
        regIn=2;
        pcIn=1;
        {memRead,memWrite,aluIn,regWrite,reghi} = 5'b00010;
      end
      6'b000100: begin 
        ALUcntrl=01;
        if(zero) pcIn = 3;
        else  pcIn = 0;
        {memRead,memWrite,aluIn,regWrite,reghi} = 5'b00000;
      end
      6'b000101: begin 
        ALUcntrl=01;
        if(zero) pcIn = 0;
        else  pcIn = 3;
        {memRead,memWrite,aluIn,regWrite,reghi} = 5'b00000;
      end
      default:begin
        ALUcntrl=00;
        toReg=0;
        regIn=0;
        pcIn=0;
        {memRead,memWrite,aluIn,regWrite,reghi} = 5'b00000;
      end
    endcase
  end
endmodule
