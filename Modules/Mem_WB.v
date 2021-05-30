module Mem_WB(
  input clk, reset,
  input EX_Mem_MemtoReg,
  input EX_Mem_RegWrite,
  input [63:0] Read_Data, 
  input [63:0] EX_Mem_ALU_Rslt,
  input [4:0] EX_Mem_rd,
  
  output reg Mem_WB_MemtoReg,
  output reg Mem_WB_RegWrite,
  output reg [63:0] Mem_WB_Read_Data,
  output reg [63:0] Mem_WB_ALU_Result,
  output reg [4:0] Mem_WB_rd
);
  
  always @(posedge clk or posedge reset)
    begin
      if (reset)
        begin
          Mem_WB_MemtoReg = 1'b0;
          Mem_WB_RegWrite = 1'b0;
          Mem_WB_Read_Data = 64'b0;
          
          Mem_WB_ALU_Result = 64'b0;
          Mem_WB_rd = 5'b0;
        end
      else
        begin
          Mem_WB_MemtoReg = EX_Mem_MemtoReg;
          Mem_WB_RegWrite = EX_Mem_RegWrite;
          Mem_WB_Read_Data = Read_Data;
          Mem_WB_ALU_Result = EX_Mem_ALU_Rslt;
          Mem_WB_rd = EX_Mem_rd;
        end
       
    end
  
endmodule