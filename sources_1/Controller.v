`timescale 1ns / 1ps

module Controller (Zero, Instr, MemWrite, RegWrite, ImmSrc, ALUSrc, ALUControl, ResultSrc, PcSrc);

    // input-output ports
    input  wire Zero;
    input  wire [31:0] Instr;
    output wire  MemWrite;
    output wire  RegWrite;
    output wire [1:0] ImmSrc;
    output wire  ALUSrc;
    output wire [2:0] ALUControl;
    output wire [1:0] ResultSrc;
    output wire  PcSrc;
    
    //internal signals
    wire Jump, Branch;
    wire [1:0] AluOp;
   
    //main decoder instantiation
    Main_Decoder MD(
            .Op(Instr[6:0]), 
            .Jump(Jump), 
            .Branch(Branch), 
            .MemWrite(MemWrite), 
            .RegWrite(RegWrite), 
            .AluSrc(ALUSrc), 
            .ImmSrc(ImmSrc), 
            .ResultSrc(ResultSrc), 
            .AluOp(AluOp)
        );
    assign PcSrc = Jump | ((Zero ^ ( Instr[12])) & Branch);
    
    //ALU Decoder instantiation
    ALU_Decoder AD (
        .opb5(Instr[5]),
        .funct3(Instr[14:12]), 
        .funct7b5(Instr[30]),
        .ALUOp(AluOp), 
        .ALUControl(ALUControl)
    );
    
endmodule
