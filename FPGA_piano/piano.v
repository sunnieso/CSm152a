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

always @ (posedge CLK or posedge RESET) begin
	if (RESET)
		FREQ <= 0;
	else if (sw[0])
		FREQ <= CLK_C4;
	else if (sw[1])
		FREQ <= CLK_D;
	else if (sw[2])
		FREQ <= CLK_E;
	else if (sw[3])
		FREQ <= CLK_F;
	else if (sw[4])
		FREQ <= CLK_G;
	else if (sw[5])
		FREQ <= CLK_A;
	else if (sw[6])
		FREQ <= CLK_B;
	else if (sw[7])
		FREQ <= CLK_C5;
end

endmodule
