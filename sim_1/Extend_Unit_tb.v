`timescale 1ns / 1ps

module Extend_Unit_tb();

    // 1) Declare local reg and wire identifiers
    reg  [31:7] instr_tb;      
    reg  [1:0] immsrc_tb;     
    wire [31:0] immext_tb;     
    
    // 2) Instantiate the module under test
    Extend_Unit uut (
            .instr(instr_tb),
            .immsrc(immsrc_tb),
            .immext(immext_tb)
     );
    
    // 3) Generate stimuli using initial and always
    initial
     begin      
        // Stimulus 1: I-type instruction 
        instr_tb = 25'b111111111111_1111111111111;   immsrc_tb = 2'b00;  #100;       
        instr_tb = 25'b111100001111_0000111000110;   immsrc_tb = 2'b00;  #100; 
              
        // Stimulus 2: S-type instruction 
        instr_tb = 25'b1010101_01010101010101_0101;   immsrc_tb = 2'b01;  #100;   
        instr_tb = 25'b1101110_10101010000101_0100;   immsrc_tb = 2'b01;  #100;
        
        // Stimulus 3: B-type instruction 
        instr_tb = 25'b0_101010_101010101010_1010_1_0;   immsrc_tb = 2'b10;  #100;   
        instr_tb = 25'b1_100110_011001101010_0010_1_0;   immsrc_tb = 2'b10;  #100;
        
        // Stimulus 4: J-type instruction 
        instr_tb = 25'b1_1001100110_0_11001100_11001;   immsrc_tb = 2'b11;  #100; 
        instr_tb = 25'b0_1010101010_1_01010101_01010;   immsrc_tb = 2'b11;  #100;
        
        $stop;
    end
endmodule
