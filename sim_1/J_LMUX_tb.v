`timescale 1ns / 1ps

module J_LMUX_tb(

    );
    
		 reg  [31 : 0] ALUResult_tb;
		 reg  [31 : 0] ReadData_tb;
		 reg  [31 : 0] PCPlus4_tb;
		 reg  [1 : 0 ] ResultSrc_tb;
		 wire [31 : 0] Result_tb;
    
        J_LMUX uut (
			 .ALUResult(ALUResult_tb),
			 .ReadData(ReadData_tb),
			 .PCPlus4(PCPlus4_tb),
			 .ResultSrc(ResultSrc_tb),
			 .Result(Result_tb)
        );
    
        initial begin
            ALUResult_tb = 32'h00000004; 	ReadData_tb = 32'h00000008;		PCPlus4_tb = 32'h00000004; ResultSrc_tb = 2'b00; #50;
            ALUResult_tb = 32'h00000004; 	ReadData_tb = 32'h00000008;		PCPlus4_tb = 32'h00000004; ResultSrc_tb = 2'b01; #50;
            ALUResult_tb = 32'h00000004; 	ReadData_tb = 32'h00000008;		PCPlus4_tb = 32'h00000004; ResultSrc_tb = 2'b10; #50;
            ALUResult_tb = 32'h00000004; 	ReadData_tb = 32'h00000008;		PCPlus4_tb = 32'h00000004; ResultSrc_tb = 2'b11; #50;
    
            $finish;
        end
    endmodule




