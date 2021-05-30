module Instruction_Memory(
  input [63:0] Inst_Address,
  output reg [31:0] Instruction

);
  
  reg [7:0] Instruction_Memory [15:0];
  
  initial
    begin 
      
      Instruction_Memory[7] = 8'b00000000;   // this 2nd
      Instruction_Memory[6] = 8'b10100;    // addi x9, x9, 1
      Instruction_Memory[5] = 8'b10000100;     // Start the binary code from left into 0
      Instruction_Memory[4] = 8'b10010011;
      
      Instruction_Memory[3] = 8'b00000000;		// sabse pahle ye chalaygi
      Instruction_Memory[2] = 8'b10011010;    // add x9, x21, x9
      Instruction_Memory[1] = 8'b10000100;     // Start the binary code from right into 0
      Instruction_Memory[0] = 8'b10110011;
      
    end
  
  always @ (Inst_Address)
    begin
      Instruction = {Instruction_Memory[Inst_Address+3], Instruction_Memory[Inst_Address+2], Instruction_Memory[Inst_Address+1], Instruction_Memory[Inst_Address+0]};
    end
  
endmodule