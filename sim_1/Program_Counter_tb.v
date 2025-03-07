`timescale 1ns / 1ps

module Program_Counter_tb(

    );
  reg clk;
  reg [31:0] PCNext;
  wire [31:0] PC;
  
  Program_Counter DUT(
  .clk(clk),
  .PCNext(PCNext),
  .PC(PC)
  );
  
  initial 
  begin 
    clk = 1'b1;
  end
  
  always
  begin
    clk = ~clk;
    #10;         
  end
  
  initial
    begin
       PCNext = 8'h00000001;    #15;
       PCNext = 8'h00000004;    #15;    
       PCNext = 8'h00000008;    #15;       
       PCNext = 8'h0000000C;    #15;
       PCNext = 8'h000000010;   #15;
       PCNext = 8'h000000014;   #15;
       
    end
endmodule
