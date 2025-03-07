`timescale 1ns / 1ps

module RV32I_Processor(Clk, Reset, Instr, ReadData, Pc, DataAdr, WriteData, MemWrite);

    input  wire Clk;             
    input  wire Reset;   
    input  wire [31:0] Instr, ReadData;   
    output wire MemWrite;     
    output wire [31:0] Pc;       
    output wire [31:0] DataAdr;  
    output wire [31:0] WriteData; 
      
    wire Zero, RegWrite, ALUSrc, PcSrc;
    wire [1:0] ImmSrc, ResultSrc;
    wire [2:0] ALUControl;
    

    // Instantiating the Controller module
    Controller Cont (
        .Zero(Zero),
        .Instr(Instr),
        .MemWrite(MemWrite),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .ALUControl(ALUControl),
        .ResultSrc(ResultSrc),
        .PcSrc(PcSrc)
    );

    // Instantiating the Datapath module
    Data_path DP (
        .Clk(Clk),
        .Reset(Reset),
        .Pcsrc(PcSrc),
        .AluSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ResultSrc(ResultSrc),
        .ImmSrc(ImmSrc),
        .AluControl(ALUControl),
        .Instr(Instr),
        .ReadData(ReadData),
        .Zero(Zero),
        .Pc(Pc),
        .DataAdr(DataAdr),
        .WriteData(WriteData)
    );
    
endmodule
