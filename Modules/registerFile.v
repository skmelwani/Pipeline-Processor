module registerFile(
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] rd, 
  input clk,
  input reset,
  input regWrite,
  input [63:0] writeData,
  
  output reg [63:0] readData1,
  output reg [63:0] readData2
  
);
  
  reg [63:0] registers [31:0];
  
  int x;
  initial
    begin
      for (x = 0; x < 32; x+=1)
        begin
          registers[x] = x;
        end
    end
  
  always @ (*)
    begin
      if (reset == 1)
        begin
          readData1 = 64'b0;
          readData2 = 64'b0;
        end
      
      else
        begin
          readData1 = registers[rs1];
          readData2 = registers[rs2];
        end
    end
  
  always @ (posedge clk)
    begin
      if (regWrite)
        begin
          registers[rd] = writeData;
        end
    end
  
endmodule


