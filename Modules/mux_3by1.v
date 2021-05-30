module mux_3by1(
  output reg [63:0] data_out,
  input [1:0] S,
  input [63:0] A,
  input [63:0] B,
  input [63:0] C
);
  always @(*)
    begin
      case (S)
        2'b00: data_out = A; 
        2'b01: data_out = B;
        2'b10: data_out = C;
        
  endcase
  
    end
  
endmodule

