module ID_EX(
  input clk, reset,
  input [3:0] IF_ID_Instruction,
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] rd,
  input [63:0] imm_data,
  input [63:0] ReadData1,
  input [63:0] ReadData2,
  input [63:0] PC,
  input [1:0] ALUOp,
  input Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
  
  output reg [3:0] ID_EX_Instruction,
  output reg [4:0] ID_EX_rs1,
  output reg [4:0] ID_EX_rs2,
  output reg [4:0] ID_EX_rd,
  output reg [63:0] ID_EX_imm_data,
  output reg [63:0] ID_EX_ReadData1,
  output reg [63:0] ID_EX_ReadData2,
  output reg [63:0] ID_EX_PC,
  
  output reg [1:0] ID_EX__ALUOp,
  output reg ID_EX__ALUSrc,
  
  output reg ID_EX__Branch,
  
  output reg ID_EX__MemRead,
  output reg ID_EX__MemtoReg,
  output reg ID_EX__MemWrite,
  
  output reg ID_EX__RegWrite  
);
  
  always @(posedge clk or posedge reset)
    begin 
      if(reset)
        begin
          ID_EX_Instruction		= 0;
          ID_EX_rs1 			= 0;
          ID_EX_rs2				= 0;
          ID_EX_rd 				= 0;
          ID_EX_imm_data		= 0;
          ID_EX_ReadData1		= 0;
          ID_EX_ReadData2		= 0;
          ID_EX_PC				= 0;
          ID_EX__ALUOp			= 0;
          ID_EX__Branch			= 0;
          ID_EX__MemRead		= 0;
          ID_EX__MemtoReg		= 0;
          ID_EX__MemWrite		= 0;
          ID_EX__ALUSrc			= 0;
          ID_EX__RegWrite		= 0;
        end
      else
        begin 
          ID_EX_Instruction		= IF_ID_Instruction;
          ID_EX_rs1 			= rs1;
          ID_EX_rs2				= rs2;
          ID_EX_rd 				= rd;
          ID_EX_imm_data		= imm_data;
          ID_EX_ReadData1		= ReadData1;
          ID_EX_ReadData2		= ReadData2;
          ID_EX_PC				= PC;
          ID_EX__ALUOp			= ALUOp;
          ID_EX__Branch			= Branch;
          ID_EX__MemRead		= MemRead;
          ID_EX__MemtoReg		= MemtoReg;
          ID_EX__MemWrite		= MemWrite;
          ID_EX__ALUSrc			= ALUSrc;
          ID_EX__RegWrite		= RegWrite;
        end
    end
endmodule

          
          