module IF_ID(
  input clk, reset,
  input [31:0] Instruction,
  input [63:0] PC,
  output reg [31:0] IF_ID_Instruction,
  output reg [63:0] IF_ID_PC
);
  
  always @(posedge clk or posedge reset)
    begin
      if (reset)
        begin 
          IF_ID_Instruction = 0;
          IF_ID_PC = 0;
        end
      else
        begin 
          IF_ID_Instruction = Instruction;
          IF_ID_PC = PC;
        end
    end
endmodule

  
  