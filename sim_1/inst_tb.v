`timescale 1ns / 1ps

module inst_tb();
    reg  [31:0]A;
    wire [31:0] RD;
    Instruction_memory Dut (.A(A),.RD(RD));
    
    initial 
    begin
    A = 0;	#30;
    A = 4;	#30;
    A = 8;	#30;
    A= 64;	#30;
    $finish;
    
    end
endmodule
