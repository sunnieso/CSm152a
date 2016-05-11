`timescale 1ns / 1ps
`include "freq.v"

module piano (
	input CLK,
	input RESET,
	output reg FREQ
);

// Frequency clocks
wire CLK_A;

ClockManager Frequencies(
	.RESET(RESET),
	.CLK(CLK),
	.CLK_C(CLK_C4),
	.CLK_D(CLK_D),
	.CLK_E(CLK_E),
	.CLK_F(CLK_F),
	.CLK_G(CLK_G),
	.CLK_A(CLK_A),
	.CLK_B(CLK_B),
	.CLK_C(CLK_C5)
);

always @ (*) begin
	FREQ = CLK_A;
end

endmodule
