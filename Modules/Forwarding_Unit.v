module Forwarding_Unit(
  input [4:0] ID_EX_rs1,
  input [4:0] ID_EX_rs2,
  input [4:0] EX_Mem_rd,
  input EX_Mem_RegWrite,
  input [4:0] Mem_WB_rd,
  input Mem_WB_RegWrite,
  
  output reg [1:0] Forward_A,
  output reg [1:0] Forward_B  
);
  
  always @(*)
    begin 
      
      //hazard for rs1/forward A  EX 
      if(EX_Mem_rd == ID_EX_rs1 & EX_Mem_RegWrite ==1 & EX_Mem_rd != 0 )
        begin 
          Forward_A = 2'b10;
        end 
      
      // Mem
      else if (Mem_WB_rd == ID_EX_rs1 & Mem_WB_RegWrite == 1 & Mem_WB_rd != 0 &
               !(EX_Mem_RegWrite == 1 & EX_Mem_rd != 0 && EX_Mem_rd == ID_EX_rs1)
              )
        
        begin 
          Forward_A = 2'b01;
        end
      
      else
        begin 
          Forward_A = 2'b00;
        end
        
      
      //hazard for rs2/forward A  EX 
      if(EX_Mem_rd == ID_EX_rs2 & EX_Mem_RegWrite ==1 & EX_Mem_rd != 0 )
        begin 
          Forward_B = 2'b10;
        end 
      
      // Mem
      else if (Mem_WB_rd == ID_EX_rs2 & Mem_WB_RegWrite == 1 & Mem_WB_rd != 0 &
               !(EX_Mem_RegWrite == 1 && EX_Mem_rd != 0 && EX_Mem_rd == ID_EX_rs2)
              )
        begin 
          Forward_B = 2'b01;
        end
      
      else
        begin 
          Forward_B = 2'b00;
        end
    end
  
endmodule

  
      
      