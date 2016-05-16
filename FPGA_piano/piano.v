`timescale 1ns / 1ps
`include "freq.v"
`include "notes.v"
`include "odetojoy.v"

module piano (
	input CLK,
	input RESET,
	input [7:0] sw,
	output reg FREQ,
	output reg [7:0] Led
);

`include "parameters.v"

// Frequency clocks
wire CLK_C4;
wire CLK_D;
wire CLK_E;
wire CLK_F;
wire CLK_G;
wire CLK_A;
wire CLK_B;
wire CLK_C5;

clockManager freqs(
	.CLK(CLK),
	.RESET(RESET),
	.CLK_C4(CLK_C4),
	.CLK_D(CLK_D),
	.CLK_E(CLK_E),
	.CLK_F(CLK_F),
	.CLK_G(CLK_G),
	.CLK_A(CLK_A),
	.CLK_B(CLK_B),
	.CLK_C5(CLK_C5)
);

always @ (posedge CLK or posedge RESET) begin
	if (RESET)
		FREQ <= 0;
	else if (sw[7])
		FREQ <= CLK_C4;
	else if (sw[6])
		FREQ <= CLK_D;
	else if (sw[5])
		FREQ <= CLK_E;
	else if (sw[4])
		FREQ <= CLK_F;
	else if (sw[3])
		FREQ <= CLK_G;
	else if (sw[2])
		FREQ <= CLK_A;
	else if (sw[1])
		FREQ <= CLK_B;
	else if (sw[0])
		FREQ <= CLK_C5;
	else
		FREQ <= 0;
end

// Extract note from switches
wire [3:0] note;

notes notes(
	.CLK(CLK),
	.RESET(RESET),
	.sw(sw),
	.note(note)
);

// Show ode to joy instructions on LEDs
odetojoy song (
	.CLK(CLK),
	.RESET(RESET),
	.note(note),
	.Led(Led)
);

endmodule
