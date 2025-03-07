`timescale 1ns / 1ps

module Main_dec_tb();
    reg [6:0] Op;
    wire Jump,Branch,MemWrite,RegWrite,AluSrc;
    wire [1:0] ImmSrc,ResultSrc,AluOp;
    
    Main_Decoder Dut (
                    .Op(Op),                                       
                    .Jump(Jump),
                    .Branch(Branch),                  
                    .MemWrite(MemWrite),
                    .RegWrite(RegWrite),
                    .AluSrc(AluSrc),
                    .ImmSrc(ImmSrc),
                    .ResultSrc(ResultSrc),
                    .AluOp(AluOp)      
    );
    
    initial 
    begin
    Op = 7'b0000011;#30;
    Op = 7'b0100011;#30;
    Op = 7'b0110011;#30;
    Op = 7'b1101111;#30;
    Op = 7'b0010011;#30;
    Op = 7'b0000000;#30;
    $finish;
    end            
   
endmodule
