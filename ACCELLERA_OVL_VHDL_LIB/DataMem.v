module Data_Memory(
  input [63:0] Mem_Addr,
  input clk, MemWrite, MemRead,
  input [63:0] Write_Data,
  output reg [63:0] Read_Data
  
);
  
  reg [7:0] memory [63:0];
  int x;
  initial begin
    for (x=0; x<64; x = x+1)
      begin
        memory[x] = 0;
      end
    memory[3] = 0;  //for checking
  end
  
  
  
  
  always @(posedge clk)
    begin
      if (MemWrite == 1)
        begin
          memory[Mem_Addr+7] = Write_Data[63:56];
          memory[Mem_Addr+6] = Write_Data[55:48];
          memory[Mem_Addr+5] = Write_Data[47:40];
          memory[Mem_Addr+4] = Write_Data[39:32];
          memory[Mem_Addr+3] = Write_Data[31:24];
          memory[Mem_Addr+2] = Write_Data[23:16];
          memory[Mem_Addr+1] = Write_Data[15:8];
          memory[Mem_Addr+0] = Write_Data[7:0];
        end
    end
  
  
  
  always @(*)
    begin
      if(MemRead == 1)
        begin Read_Data = {
          memory[Mem_Addr+7], memory[Mem_Addr+6],
          memory[Mem_Addr+5], memory[Mem_Addr+4],
          memory[Mem_Addr+3], memory[Mem_Addr+2],
          memory[Mem_Addr+1], memory[Mem_Addr+0] 
        };
        end
    end
endmodule
  