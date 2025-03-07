`timescale 1ns / 1ps

module ALU_Decoder_tb();

    // 1) Declare local reg and wire identifiers with _tb suffix
    reg  opb5_tb;               
    reg  [2:0] funct3_tb;       
    reg  funct7b5_tb;          
    reg  [1:0] ALUOp_tb;        
    wire [2:0] ALUControl_tb;

    // 2) Instantiate the ALU module under test
    ALU_Decoder uut (
        .opb5(opb5_tb),
        .funct3(funct3_tb),
        .funct7b5(funct7b5_tb),
        .ALUOp(ALUOp_tb),
        .ALUControl(ALUControl_tb)
    );

    // 3) Generate stimuli using initial and always
    initial 
    begin
        //for (lw / sw), output should be ALUControl = 000
        opb5_tb = 1'b1;  funct7b5_tb = 1'b0;  ALUOp_tb = 2'b00;  funct3_tb = 3'b000; #50;      
        opb5_tb = 1'b1;  funct7b5_tb = 1'b1;  ALUOp_tb = 2'b00;  funct3_tb = 3'b000; #50;    
        
        //for ( branch if equal ), output should be ALUControl = 001
        opb5_tb = 1'b0;  funct7b5_tb = 1'b0;  ALUOp_tb = 2'b01;  funct3_tb = 3'b000; #50;    
        opb5_tb = 1'b0;  funct7b5_tb = 1'b1;  ALUOp_tb = 2'b01;  funct3_tb = 3'b000; #50;    
        
        //for ( add / addi ), output should be ALUControl = 000
        opb5_tb = 1'b1;  funct7b5_tb = 1'b0;  ALUOp_tb = 2'b10;  funct3_tb = 3'b000; #50;    
        
        //for ( sub ), output should be ALUControl = 001
        opb5_tb = 1'b1;  funct7b5_tb = 1'b1;  ALUOp_tb = 2'b11;  funct3_tb = 3'b000; #50;    
        
        //for Logic operations
        opb5_tb = 1'b0;  funct7b5_tb = 1'b0;  ALUOp_tb = 2'b10;  funct3_tb = 3'b010; #50;    // for ( slt / slti ), output should be 101
        opb5_tb = 1'b1;  funct7b5_tb = 1'b0;  ALUOp_tb = 2'b11;  funct3_tb = 3'b110; #50;    // for ( or ), output should be  011
        opb5_tb = 1'b0;  funct7b5_tb = 1'b1;  ALUOp_tb = 2'b10;  funct3_tb = 3'b111; #50;    // for ( and ), output should be 010
        opb5_tb = 1'b1;  funct7b5_tb = 1'b1;  ALUOp_tb = 2'b11;  funct3_tb = 3'b100; #50;    // for ( xor ), output should be 100
        
        opb5_tb = 1'b0;  funct7b5_tb = 1'b1;  ALUOp_tb = 2'b11;  funct3_tb = 3'b001; #50;    // for ( sll ), output should be 110
        opb5_tb = 1'b1;  funct7b5_tb = 1'b0;  ALUOp_tb = 2'b10;  funct3_tb = 3'b101; #50;    // for ( srl ), output should be 111
        
        //for default , output should be ALUControl = xxx
        opb5_tb = 1'b1;  funct7b5_tb = 1'b1;  ALUOp_tb = 2'b10;  funct3_tb = 3'b101; #50; 
        opb5_tb = 1'bx;  funct7b5_tb = 1'bx;  ALUOp_tb = 2'b11;  funct3_tb = 3'b011; #50;    
         
    // 4) Specify a stopwatch to stop the simulation
    #600 $stop;
    end
endmodule