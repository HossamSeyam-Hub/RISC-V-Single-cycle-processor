`timescale 1ns / 1ps


module Data_path(

        input Clk, Reset,Pcsrc,
              AluSrc,RegWrite,  
        input [1:0]ResultSrc,ImmSrc,
        input [2:0] AluControl,
        input [31:0] Instr,
        input [31:0] ReadData,
        output Zero,
        output [31:0] Pc,DataAdr,WriteData    
    );
    
    wire [31:0]PCNext,RD1,RD2,
               PCPlus4,Result,
               ImmExt,PCTarget,SrcB;
    
    Program_Counter PC(
         .clk(Clk),
         .rst(Reset),
	     .PCNext(PCNext),
	     .PC(Pc)
    );
    
     Adder_4 AD4 (
         .PC(Pc),     
         .PCPlus4(PCPlus4)
     );
     
     ALU alu (
         .SrcA(RD1),        
         .SrcB (SrcB),    
         .ALUControl(AluControl),          
         .ALUResult (DataAdr),
         .Zero (Zero)   
    );
    
    J_LMUX Jmux(
    
         .ALUResult(DataAdr),
         .ReadData(ReadData),
         .PCPlus4(PCPlus4),
         .ResultSrc(ResultSrc),
         .Result(Result)
    
    );
    
    Register_File RF (
         .clk(Clk),
         .WE3(RegWrite),
	     .A1(Instr[19:15]),
	     .A2(Instr[24:20]),
	     .A3(Instr[11:7]),
	     .WD3(Result),
	     .RD1(RD1),
	     .RD2(RD2)
    );
    assign WriteData = RD2;
    
    Extend_Unit EXTEND(
         .instr(Instr[31:7]),          
         .immsrc(ImmSrc),        
         .immext(ImmExt)
    
    );
    
    Adder_Target ADDTARGET (
         
         .PC(Pc),      
         .ImmExt(ImmExt), 
         .PCTarget(PCTarget)
   
    );
    
    PCMUX pcmux (
    
         .pc_plus4(PCPlus4),
         .PCTarget(PCTarget),
         .pcsrc (Pcsrc),
         .pc_next(PCNext) 
    
    );
    
    ALUINPUTMUX ALUMUX (
    
         .reg_data(RD2),
         .ImmExx(ImmExt),
         .alu_src(AluSrc) ,
         .SrcB(SrcB) 
    
    );
endmodule
