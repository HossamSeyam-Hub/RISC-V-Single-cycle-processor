module Adder_4_tb ();

	reg [31:0] PC;         
	wire [31:0] PCPlus4;


	Adder_4 uut (
	.PC(PC),
	.PCPlus4(PCPlus4)
	);


	initial
	begin 
		PC = 32'd0;  		#100;	      
		PC = 32'd40; 		#100;
		PC = 32'd43; 		#100;
		PC = 32'd455;    	#100;     
		PC = 32'd4666; 		#100;
		PC = 32'd44; 		#100;
		PC = 32'd42; 		#100;
		PC = 32'd100;       #100;
		
	
	end  


endmodule