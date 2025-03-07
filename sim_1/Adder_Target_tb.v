module Adder_Target_tb;
    reg [31:0] PC;
    reg [31:0] ImmExt;
    wire [31:0] PCTarget;

  
    Adder_Target uut (
        .PC(PC),
        .ImmExt(ImmExt),
        .PCTarget(PCTarget)
    );

    initial 
    begin    
        PC = 32'd0; ImmExt = 32'd4;
        #100;
        $display("PC = %d, ImmExt = %d, PCTarget = %d", PC, ImmExt, PCTarget);

        PC = 32'd10; ImmExt = 32'd20;
        #100;
        $display("PC = %d, ImmExt = %d, PCTarget = %d", PC, ImmExt, PCTarget);

        PC = 32'd100; ImmExt = -32'd50;
        #100;
        $display("PC = %d, ImmExt = %d, PCTarget = %d", PC, ImmExt, PCTarget);

        
    end
endmodule
