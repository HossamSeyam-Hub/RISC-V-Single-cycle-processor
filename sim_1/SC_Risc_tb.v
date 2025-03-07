`timescale 1ns / 1ps

module SC_Risc_v_tb;
    reg Clk, Reset;

    SC_32_RISC_V Riscv (
        .Clk(Clk),
        .Reset(Reset)
    );

    initial 
    begin
        Clk = 1'b1;
    end

    always 
    begin
        #10 Clk = ~Clk;
    end

    initial 
    begin
        Reset = 1'b1;
        #15;
        Reset = 1'b0;
        #500;
        $finish;
    end

endmodule
