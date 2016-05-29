`timescale 1ns / 1ps
`include "freq.v"
`include "notes.v"
`include "odetojoy.v"
`include "display.v"
`include "debounce.v"
`include "doReMiAUTO.v"

module piano (
	input CLK,
	input RESET,
	input MODE,			// toggle button: switch between autoplay and lesson modes.
	input MODE2,
	input [7:0] sw,
	output reg FREQ,
	output [7:0] Led,
	output [7:0] seg,
	output [3:0] an
);

`include "parameters.v"

// Mode: 1 = autoplay, 0 = lesson mode
reg [1:0] mode;
always @ (posedge CLK or posedge RESET) begin
	if (RESET)		mode <= 2'b00;
	else if (MODE)		mode <= 2'b01;
	else if (MODE2)   mode <= 2'b10;
	else 		mode <= mode;
end

wire [3:0] note;
assign note = mode[0] ? auto_note : mode[1] ? auto2_note : play_note;
assign Led = mode[0] ? auto_Led : mode[1] ? auto2_Led : play_Led;

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

// Debounce switches
wire [7:0] d_sw;

debounce sw0(
	.CLK(CLK),
	.RESET(RESET),
	.INPUT(sw[0]),
	.D_OUT(d_sw[0])
);

debounce sw1(
	.CLK(CLK),
	.RESET(RESET),
	.INPUT(sw[1]),
	.D_OUT(d_sw[1])
);

debounce sw2(
	.CLK(CLK),
	.RESET(RESET),
	.INPUT(sw[2]),
	.D_OUT(d_sw[2])
);

debounce sw3(
	.CLK(CLK),
	.RESET(RESET),
	.INPUT(sw[3]),
	.D_OUT(d_sw[3])
);

debounce sw4(
	.CLK(CLK),
	.RESET(RESET),
	.INPUT(sw[4]),
	.D_OUT(d_sw[4])
);

debounce sw5(
	.CLK(CLK),
	.RESET(RESET),
	.INPUT(sw[5]),
	.D_OUT(d_sw[5])
);

debounce sw6(
	.CLK(CLK),
	.RESET(RESET),
	.INPUT(sw[6]),
	.D_OUT(d_sw[6])
);

debounce sw7(
	.CLK(CLK),
	.RESET(RESET),
	.INPUT(sw[7]),
	.D_OUT(d_sw[7])
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
	.note(auto_note),
	.Led(auto_Led)
);

// Extract note from autoplay
wire [3:0] auto2_note;
wire [7:0] auto2_Led;

doReMiAUTO autoSong (
	.RESET(RESET),
	.MODE2(MODE2),
	._QUARTER_BEAT(QUARTER_BEAT),
	.note(auto2_note),
	.Led(auto2_Led)
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
	.MODE(MODE),
	.note(note),
	.Led(play_Led)
);

// Show notes on display 
segDisplay display (
	.note(note),
	.seg(seg),
	.an(an)
); 

endmodule
