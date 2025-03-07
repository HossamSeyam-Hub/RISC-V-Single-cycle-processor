`timescale 1ns / 1ps

module PCMUX(
    input wire [31 : 0] pc_plus4,
    input wire [31 : 0] PCTarget,
    input wire pcsrc ,
    output wire [31 : 0] pc_next
);
assign pc_next = (pcsrc) ? PCTarget : pc_plus4;
endmodule
