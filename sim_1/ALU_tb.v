`timescale 1ns / 1ps

module ALU_tb();

    // 1) Declare local reg and wire identifiers with _tb suffix
    reg signed [31:0] SrcA_tb;            
    reg signed [31:0] SrcB_tb;            
    reg  [2:0] ALUControl_tb;       
    wire signed [31:0] ALUResult_tb;      
    wire Zero_tb;                    
    // 2) Instantiate the ALU module under test
    ALU uut (
        .SrcA(SrcA_tb), 
        .SrcB(SrcB_tb), 
        .ALUControl(ALUControl_tb), 
        .ALUResult(ALUResult_tb), 
        .Zero(Zero_tb)
    );
    // 3) Generate stimuli using initial and always
    initial
     begin
        // Test case 0: Addition
        SrcA_tb =  32'd5;             SrcB_tb = 32'd3;       ALUControl_tb = 3'b000;  /* ADD operation*/     #10;
        SrcA_tb = -32'd50;            SrcB_tb = 32'd33;      ALUControl_tb = 3'b000;  /* ADD operation*/     #10;
        
        // Test case 1: Subtraction
        SrcA_tb = 32'd100;            SrcB_tb = 32'd7;       ALUControl_tb = 3'b001;  /* SUB operation*/     #10;
        SrcA_tb = 32'd74;             SrcB_tb = -32'd7;      ALUControl_tb = 3'b001;  /* SUB operation*/     #10;
        
        // Test case 2: Bitwise AND
        SrcA_tb = 32'd30;             SrcB_tb = 32'd7;       ALUControl_tb = 3'b010;  /* AND operation*/     #10;
        SrcA_tb = 32'd33;             SrcB_tb = 32'd4;       ALUControl_tb = 3'b010;  /* AND operation*/     #10;
                
        // Test case 3: Bitwise OR
        SrcA_tb = 32'd45;             SrcB_tb = 32'd202;     ALUControl_tb = 3'b011;  /* OR operation*/      #10;
        SrcA_tb = 32'd505;            SrcB_tb = 32'd20;      ALUControl_tb = 3'b011;  /* OR operation*/      #10;
                
        // Test case 4: Bitwise XOR
        SrcA_tb = 32'd1003;           SrcB_tb = 32'd327;     ALUControl_tb = 3'b100;  /* XOR operation*/     #10;
        SrcA_tb = 32'd103;            SrcB_tb = 32'd317;     ALUControl_tb = 3'b100;  /* XOR operation*/     #10;
                
        // Test case 5: Set Less Than (SLT)
        SrcA_tb = 32'd11;              SrcB_tb =  32'd15;     ALUControl_tb = 3'b101;  /* SLT operation*/    #10;
        SrcA_tb = 32'd10;              SrcB_tb = -32'd15;     ALUControl_tb = 3'b101;  /* SLT operation*/    #10;
        
        // Test case 6: Shift left logical <<
        SrcA_tb = 32'hA;               SrcB_tb = 5'b0010;     ALUControl_tb = 3'b110;  /* SLL operation*/    #10;
        SrcA_tb = 32'hB1;              SrcB_tb = 5'b0100;     ALUControl_tb = 3'b110;  /* XSLL operation*/   #10;
        
        // Test case 7: Shift Right Logical >>
        SrcA_tb = 32'b1100110010;      SrcB_tb = 5'b10110;    ALUControl_tb = 3'b111;  /* SRL operation*/    #10;
        SrcA_tb = 32'd1;               SrcB_tb = 5'b11111;    ALUControl_tb = 3'b111;  /* SRL operation*/    #10;
        
        // Test case 8: beq ( Subtraction ) if Zero = 0 >> Equal
        SrcA_tb = 32'd10;       SrcB_tb = 32'd10;      ALUControl_tb = 3'b001;   /* Branch if equal*/        #10;
        SrcA_tb = 32'd11;       SrcB_tb = 32'd10;      ALUControl_tb = 3'b001;   /* Branch if equal*/        #10;
        
        // Test case 9: beq ( Subtraction ) if Zero = 0 >> Equal
        SrcA_tb = 32'd11;       SrcB_tb = 32'd10;      ALUControl_tb = 3'b001;   /* Branch if not equal*/    #10;
        SrcA_tb = 32'd10;       SrcB_tb = 32'd10;      ALUControl_tb = 3'b001;   /* Branch if not equal*/    #10;
    end

    // 4) Specify a stopwatch to stop the simulation
    initial 
    begin
        #200 $stop;
    end
endmodule
