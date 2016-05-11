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
	.CLK_A(CLK_A)
);

always @ (*) begin
	FREQ = CLK_A;
end

endmodule
