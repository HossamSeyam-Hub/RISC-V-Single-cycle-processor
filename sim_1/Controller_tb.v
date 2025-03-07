`timescale 1ns / 1ps

module Controller_tb();
// 1) Declare local reg and wire identifiers
    reg Zero_tb;
    reg [31:0] Instr_tb;
    wire MemWrite_tb;
    wire RegWrite_tb;
    wire [1:0] ImmSrc_tb;
    wire  ALUSrc_tb;
    wire [2:0] ALUControl_tb;
    wire [1:0] ResultSrc_tb;
    wire  PcSrc_tb;
    
// 2) Instantiate the module under test    
    Controller uut (
            .Zero(Zero_tb), 
            .Instr(Instr_tb), 
            .MemWrite(MemWrite_tb), 
            .RegWrite(RegWrite_tb), 
            .ImmSrc(ImmSrc_tb), 
            .ALUSrc(ALUSrc_tb), 
            .ALUControl(ALUControl_tb), 
            .ResultSrc(ResultSrc_tb), 
            .PcSrc(PcSrc_tb)
      );
//3) Generate stimuli, using initial and always 
    initial 
    begin 
        Instr_tb = 32'b0; // Initialize all bits to 0
        
        // Load & Store 
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'bxxx;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0000011;   #50;      //(lw)
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'bxxx;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0100011;   #50;      //(sw)
        
        // R-type
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b000;   Instr_tb[29] = 1'b0;   Instr_tb[6:0] = 7'b0110011;   #50;      //add
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b000;   Instr_tb[29] = 1'b1;   Instr_tb[6:0] = 7'b0110011;   #50;      //sub
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b010;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0110011;   #50;      //slt
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b001;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0110011;   #50;      //sll
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b101;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0110011;   #50;      //srl
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b111;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0110011;   #50;      //and
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b110;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0110011;   #50;      //or
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b100;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0110011;   #50;      //xor
        
        // Branch                                                                                                   
        Zero_tb = 1'b0;   Instr_tb[14:12] = 3'b000;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b1100011;   #50;       //beq
        Zero_tb = 1'b1;   Instr_tb[14:12] = 3'b000;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b1100011;   #50;       //beq
        Zero_tb = 1'b0;   Instr_tb[14:12] = 3'b001;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b1100011;   #50;       //bne
        Zero_tb = 1'b1;   Instr_tb[14:12] = 3'b001;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b1100011;   #50;       //bne
        
        // I-type 
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b000;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0010011;   #50;       //addi
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b010;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0010011;   #50;       //slti
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b001;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0010011;   #50;       //slli
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b101;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0010011;   #50;       //srli
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b111;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0010011;   #50;       //andi
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b110;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0010011;   #50;       //ori
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'b100;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b0010011;   #50;       //xori
        
        // Jump                                                                                                         
        Zero_tb = 1'bx;   Instr_tb[14:12] = 3'bxxx;   Instr_tb[29] = 1'bx;   Instr_tb[6:0] = 7'b1101111;   #50;       //(jal)
    end
    
    initial 
    begin  
         //4) Specify a stopwatch to stop the simulation
         #1100 $stop;     
    end
     

endmodule




