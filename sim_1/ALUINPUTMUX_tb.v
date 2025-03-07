`timescale 1ns / 1ps

module ALUINPUTMUX_tb(

    );
        reg [31:0] reg_data;
        reg [31:0] imm_ext;
        reg alusrc;
        wire [31:0] srcB;
    
        ALUINPUTMUX uut (
            .reg_data(reg_data),
            .ImmExx(imm_ext),
            .alu_src(alusrc),
            .SrcB(srcB)
        );
    
        initial begin
            reg_data = 32'h00000005; imm_ext = 32'h00000004; alusrc = 0; #10;
            reg_data = 32'h00000005; imm_ext = 32'h00000004; alusrc = 1; #10;
            reg_data = 32'h00000010; imm_ext = 32'h00000008; alusrc = 0; #10;
            reg_data = 32'h00000010; imm_ext = 32'h00000008; alusrc = 1; #10;
    
            $finish;
        end
    endmodule
