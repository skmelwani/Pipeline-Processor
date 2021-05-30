module EX_Mem(
  input clk, reset,
  
  input ID_EX_Branch, 
  input ID_EX_MemRead,
  input ID_EX_MemtoReg, 
  input ID_EX_MemWrite, 
  input ID_EX_RegWrite,
  
  input	[63:0] Adder,
  
  input Zero,
  input	[63:0] ALU_Rslt,
  
  input [63:0] ForwardB_MUX,
  input [4:0] ID_EX_rd,
  
  output reg EX_Mem_Branch,
  output reg EX_Mem_MemRead,
  output reg EX_Mem_MemtoReg, 
  output reg EX_Mem_MemWrite,
  output reg EX_Mem_RegWrite,
  
  output reg[63:0] EX_Mem_Adder,
  
  output reg EX_Mem_Zero,
  output reg [63:0] EX_Mem_ALU_Rslt,
  
  output reg [63:0] EX_Mem_ForwardB_MUX,
  output reg [4:0] EX_Mem_rd  
	
);
  
  always @ (posedge clk or posedge reset)
    begin
      if (reset)
        begin
          
          EX_Mem_Branch   = 0;
          EX_Mem_MemRead	= 0;
          EX_Mem_MemtoReg 	= 0;
          EX_Mem_MemWrite	= 0;
          EX_Mem_RegWrite	= 0;

          EX_Mem_Adder	= 0;

          EX_Mem_Zero	= 0;
          EX_Mem_ALU_Rslt	= 0;

          EX_Mem_ForwardB_MUX	= 0;
          EX_Mem_rd	= 0;
        end
      
      else
        begin
          EX_Mem_Branch   		= ID_EX_Branch;
          EX_Mem_MemRead		= ID_EX_MemRead;
          EX_Mem_MemtoReg 		= ID_EX_MemtoReg;
          EX_Mem_MemWrite		= ID_EX_MemWrite;
          EX_Mem_RegWrite		= ID_EX_RegWrite;

          EX_Mem_Adder			= Adder;

          EX_Mem_Zero			= Zero;
          EX_Mem_ALU_Rslt		= ALU_Rslt;

          EX_Mem_ForwardB_MUX	= ForwardB_MUX;
          EX_Mem_rd				= ID_EX_rd;
        end
      
    end
  
  
endmodule