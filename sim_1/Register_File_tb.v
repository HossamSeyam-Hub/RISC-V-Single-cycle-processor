`timescale 1ns / 1ps

module Register_File_tb;

    reg clk;
    reg WE3;
    reg [4:0] A1, A2, A3;
    reg [31:0] WD3;
    wire [31:0] RD1, RD2;

    // Instantiate the UUT
    Register_File uut (
        .clk(clk),
        .WE3(WE3),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .WD3(WD3),
        .RD1(RD1),
        .RD2(RD2)
    );

    initial 
    begin
        clk = 0;  
    end
    
    always
    begin
        clk = ~clk; #5;  
    end
    
    // Test sequence
    initial 
    begin
       
       WE3 = 1; A1 = 5'b00000;   A2 = 5'b00011;  A3 = 5'b00000;   WD3 = 32'd10;  #10; 
       WE3 = 1; A1 = 5'b00000;   A2 = 5'b00001;  A3 = 5'b00001;   WD3 = 32'd20;  #10; 
       WE3 = 1; A1 = 5'b00001;   A2 = 5'b00010;  A3 = 5'b00010;   WD3 = 32'd30;  #10; 
       WE3 = 0; A1 = 5'b00010;   A2 = 5'b00000;  A3 = 5'b00011;   WD3 = 32'd40;  #10;
   
              
        #40 $stop;
    end

endmodule
