`timescale 1ns / 1ps

module PCMUX_tb(
);
reg [31:0] pc_plus4;
reg [31:0] PCTarget;
reg pcsrc;
wire [31:0] pc_next;

PCMUX uut (
    .pc_plus4(pc_plus4),
    .PCTarget(PCTarget),
    .pcsrc(pcsrc),
    .pc_next(pc_next)
);

initial begin
    pc_plus4 = 32'h00000004; PCTarget = 32'h00000010; pcsrc = 0; #10;
    pc_plus4 = 32'h00000004; PCTarget = 32'h00000010; pcsrc = 1; #10;
    pc_plus4 = 32'h00000008; PCTarget = 32'h00000009; pcsrc = 0; #10;
    pc_plus4 = 32'h00000008; PCTarget = 32'h00000009; pcsrc = 1; #10;

    $finish;
end
  
endmodule
