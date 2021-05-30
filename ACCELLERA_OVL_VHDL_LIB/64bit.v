module ALU_64_bit (
  input [63:0]a,
  input [63:0]b,
  input [3:0] ALUOp,
  output reg [63:0]  result,
  output zero
);
  

  always @ (a or b or ALUOp)
    begin
      case (ALUOp)
        4'b0000: result = a & b;    
        4'b0001: result = a | b;    
        4'b0010: result = a + b;    
        4'b0110: result = a - b;    
        4'b1100: result = ~(a | b); 
      endcase
    end
  	assign zero = result ? 1'b0 : 1'b1;  
    
endmodule