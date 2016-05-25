`timescale 1ns / 1ps
`include "freq.v"
`include "notes.v"
`include "odetojoy.v"
`include "display.v"
`include "led.v"

module piano (
	input CLK,
	input RESET,
	input MODE,			// toggle button: switch between autoplay and lesson modes.
	input [7:0] sw,
	output reg FREQ,
	output [7:0] Led,
	output [7:0] seg,
	output [3:0] an
);

`include "parameters.v"

// Mode: 1 = autoplay, 0 = lesson mode
reg mode;
always @ (posedge CLK or posedge RESET) begin
	if (RESET)		mode <= 1'b0;
	else if (MODE)		mode <= 1'b1;
	else 		mode <= mode;
end

wire [3:0] note;

assign Led = mode ? auto_Led : play_Led;
assign note = mode ? auto_note : play_note;

// Frequency clocks
wire CLK_C4;
wire CLK_D;
wire CLK_E;
wire CLK_F;
wire CLK_G;
wire CLK_A;
wire CLK_B;
wire CLK_C5;
wire QUARTER_BEAT;
//wire EIGHTH_BEAT;

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
	.CLK_C5(CLK_C5),
	.QUARTER_BEAT(QUARTER_BEAT)
	//.EIGHTH_BEAT(EIGHTH_BEAT)
);

always @ (posedge CLK or posedge RESET) begin
	if (RESET)
		FREQ <= 0;
	else if (mode == 1'b1) begin	// auto play mode
		if (auto_note == C4)
			FREQ <= CLK_C4;
		else if (auto_note == D)
			FREQ <= CLK_D;
		else if (auto_note == E)
			FREQ <= CLK_E;
		else if (auto_note == F)
			FREQ <= CLK_F;
		else if (auto_note == G)
			FREQ <= CLK_G;
		else if (auto_note == A)
			FREQ <= CLK_A;
		else if (auto_note == B)
			FREQ <= CLK_B;
		else if (auto_note == C5)
			FREQ <= CLK_C5;
		else // none
			FREQ <= 0;
	end 
	else begin	// lesson mode
		if (sw[7])
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
end

// Extract note from autoplay
wire [3:0] auto_note;
wire [7:0] auto_Led;

odetojoyAUTO autoSong (
	.RESET(RESET),
	.MODE(MODE),
	._QUARTER_BEAT(QUARTER_BEAT),
	//._EIGHTH_BEAT(EIGHTH_BEAT),
	.auto_note(auto_note),	// this is an output
	.Led(auto_Led)
);

// Extract note from switches
wire [3:0] play_note;
wire [7:0] play_Led;

notes notes(
	.CLK(CLK),
	.RESET(RESET),
	.sw(sw),
	.note(play_note)
);

// Show ode to joy instructions on LEDs
odetojoy song (
	.CLK(CLK),
	.RESET(RESET),
	.note(note),
	.Led(play_Led)
);

// Show notes on display 
segDisplay display (
	.note(note),
	.seg(seg),
	.an(an)
);

// Show led output
ledDisplay ledDisplay (
	.note(note),
	.Led(Led)
);

endmodule
