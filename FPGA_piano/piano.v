`timescale 1ns / 1ps
`include "freq.v"
`include "notes.v"
`include "odetojoy.v"
`include "display.v"
`include "debounce.v"
`include "doReMiAUTO.v"

module piano (
	input CLK,
	input RESET,		// reset to learn "ode to joy" . ODE_TO_JOY_LEARN
	input ODE_TO_JOY_AUTO,			// play "ode to joy"
	input DOREMI_AUTO, 	// play "doremi"
	input DOREMI_LEARN, // learn "doremi"
	input [7:0] sw,
	output reg FREQ,
	output [7:0] Led,
	output [7:0] seg,
	output [3:0] an
);

`include "parameters.v"


reg [1:0] mode;
always @ (posedge CLK or posedge RESET) begin
	if (RESET)					mode <= 2'b00;
	else if (ODE_TO_JOY_AUTO)	mode <= 2'b01;
	else if (DOREMI_AUTO)   	mode <= 2'b10;
	else if (DOREMI_LEARN)   	mode <= 2'b11;
	else 						mode <= mode;
end

// Determine output  Led.
wire [3:0] note;
assign note = (~mode[1]&mode[0]) ? ode_to_joy_auto_note : (mode[1]&(~mode[0])) ? do_re_mi_auto_note : play_note;
assign Led = (~mode[1]&mode[0]) ? ode_to_joy_led : (mode[1]&(~mode[0])) ? do_re_mi_led : (mode[1]&mode[0]) ? play_doremi_led : play_odetojoy_led;

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

// output frequency
always @ (posedge CLK or posedge RESET) begin
	if (RESET)
		FREQ <= 0;
	else if (mode == 2'b01) begin	// auto play "ode to joy"
		if (ode_to_joy_auto_note == C4)
			FREQ <= CLK_C4;
		else if (ode_to_joy_auto_note == D)
			FREQ <= CLK_D;
		else if (ode_to_joy_auto_note == E)
			FREQ <= CLK_E;
		else if (ode_to_joy_auto_note == F)
			FREQ <= CLK_F;
		else if (ode_to_joy_auto_note == G)
			FREQ <= CLK_G;
		else if (ode_to_joy_auto_note == A)
			FREQ <= CLK_A;
		else if (ode_to_joy_auto_note == B)
			FREQ <= CLK_B;
		else if (ode_to_joy_auto_note == C5)
			FREQ <= CLK_C5;
		else // none
			FREQ <= 0;
	end 
	else if (mode == 2'b10) begin	// auto play sound of music / "DoReMi"
		if (do_re_mi_auto_note == C4)
			FREQ <= CLK_C4;
		else if (do_re_mi_auto_note == D)
			FREQ <= CLK_D;
		else if (do_re_mi_auto_note == E)
			FREQ <= CLK_E;
		else if (do_re_mi_auto_note == F)
			FREQ <= CLK_F;
		else if (do_re_mi_auto_note == G)
			FREQ <= CLK_G;
		else if (do_re_mi_auto_note == A)
			FREQ <= CLK_A;
		else if (do_re_mi_auto_note == B)
			FREQ <= CLK_B;
		else if (do_re_mi_auto_note == C5)
			FREQ <= CLK_C5;
		else // none
			FREQ <= 0;
	end
	else begin	// lesson mode
		if (d_sw[7])
			FREQ <= CLK_C4;
		else if (d_sw[6])
			FREQ <= CLK_D;
		else if (d_sw[5])
			FREQ <= CLK_E;
		else if (d_sw[4])
			FREQ <= CLK_F;
		else if (d_sw[3])
			FREQ <= CLK_G;
		else if (d_sw[2])
			FREQ <= CLK_A;
		else if (d_sw[1])
			FREQ <= CLK_B;
		else if (d_sw[0])
			FREQ <= CLK_C5;
		else
			FREQ <= 0;
	end
end

// Extract note from auto ode to joy
wire [3:0] ode_to_joy_auto_note;
wire [7:0] ode_to_joy_led;

odetojoyAUTO Odetojoy_auto_song (
	.RESET(RESET),
	.START(ODE_TO_JOY_AUTO),		// start from initial state
	._QUARTER_BEAT(QUARTER_BEAT),	
	.note(ode_to_joy_auto_note),
	.Led(ode_to_joy_led)
);

// Extract note from auto sound of music
wire [3:0] do_re_mi_auto_note;
wire [7:0] do_re_mi_led;

doReMiAUTO SoundofMusic_auto_song (
	.RESET(RESET),
	.START(DOREMI_AUTO),
	._QUARTER_BEAT(QUARTER_BEAT),
	.note(do_re_mi_auto_note),
	.Led(do_re_mi_led)
);

// Extract note from switches
wire [3:0] play_note;
wire [7:0] play_odetojoy_led;

notes notes(
	.CLK(CLK),
	.RESET(RESET),
	.sw(d_sw),
	.note(play_note)
);

// Show ode to joy instructions on LEDs
odetojoy Odetojoy (
	.CLK(CLK),
	.RESET(RESET),
	.START(ODE_TO_JOY_AUTO),
	.note(note),
	.Led(play_odetojoy_led)
);

wire [7:0] play_doremi_led;

doReMi SoundofMusic (
	.CLK(CLK),
	.RESET(RESET),
	.START(DOREMI_LEARN),
	.note(note),
	.Led(play_doremi_led)
);

// Show notes on display 
segDisplay display (
	.note(note),
	.seg(seg),
	.an(an)
); 

endmodule
