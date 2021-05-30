module mux(
  output [63:0] data_out,
  input S,
  input [63:0] A,
  input [63:0] B
);
  
  assign data_out = S ? B : A;
      
endmodule

