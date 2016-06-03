`timescale 1ns / 1ps

module piano (
	input CLK,
	input RESET,
	input ODETOJOY,			// toggle button: switch between autoplay and lesson modes.
	input ODETOJOY_AUTO,
	input DOREMI,
	input DOREMI_AUTO,
	input [7:0] sw,
	output reg FREQ,
	output [7:0] Led,
	output [7:0] seg,
	output [3:0] an
);

`include "parameters.v"

wire [3:0] note;
wire [3:0] auto_ode_note;
wire [3:0] auto_doremi_note;
wire [3:0] play_note;

// Led
wire [7:0] ode_Led;
wire [7:0] doremi_Led;
wire [7:0] auto_ode_Led;
wire [7:0] auto_doremi_Led;

// Debounce switches
wire [7:0] d_sw;

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

/* Mode: 
0 = free play
1 = learn ode to joy
2 = ode to joy demo
3 = learn do re mi
4 = do re mi demo
*/

reg [2:0] mode;
always @ (posedge CLK or posedge RESET) begin
	if (RESET)		mode <= 3'b000;
	else if (ODETOJOY)		mode <= 3'b001;
	else if (ODETOJOY_AUTO)   mode <= 3'b010;
	else if (DOREMI)		mode <= 3'b011;
	else if (DOREMI_AUTO) mode <= 3'b100;
	else 		mode <= mode;
end

assign note = mode[2] ? auto_doremi_note : (mode[1]&(~mode[0])) ? auto_ode_note : play_note;
assign Led = mode[2] ? auto_doremi_Led : (mode[1]&mode[0]) ? doremi_Led : mode[1] ? auto_ode_Led : mode[0] ? ode_Led : 8'b0;

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

// Assign frequencies based on note
always @ (posedge CLK or posedge RESET) begin
	if (RESET)
		FREQ <= 1'b0;
	else begin	// play the correct note frequency
		case (note)
			4'b0111: FREQ <= CLK_C4;
			4'b0110: FREQ <= CLK_D;
			4'b0101: FREQ <= CLK_E;
			4'b0100: FREQ <= CLK_F;
			4'b0011: FREQ <= CLK_G;
			4'b0010: FREQ <= CLK_A;
			4'b0001: FREQ <= CLK_B;
			4'b0000: FREQ <= CLK_C5;
			default: FREQ <= 1'b0;
		endcase
	end 
end

// Extract note from autoplay
odetojoyAUTO autoBeethoven (
	.RESET(RESET),
	.ODETOJOY_AUTO(ODETOJOY_AUTO),
	.QUARTER_BEAT(QUARTER_BEAT),
	.note(auto_ode_note),
	.Led(auto_ode_Led)
);

// Extract note from doReMi
doReMiAUTO autoSoundOfMusic (
	.RESET(RESET),
	.DOREMI_AUTO(DOREMI_AUTO),
	.QUARTER_BEAT(QUARTER_BEAT),
	.note(auto_doremi_note),
	.Led(auto_doremi_Led)
);

// Extract note from switches
notes notes(
	.CLK(CLK),
	.RESET(RESET),
	.sw(d_sw),
	.note(play_note)
);

// Learn ode to joy mode 
odetojoy Beethoven (
	.CLK(CLK),
	.RESET(RESET),
	.ODETOJOY(ODETOJOY),
	.note(play_note),
	.Led(ode_Led)
);

// Learn do re mi mode
doReMi SoundofMusic (
	.CLK(CLK),
	.RESET(RESET),
	.DOREMI(DOREMI),
	.note(play_note),
	.Led(doremi_Led)
);

// Show notes on display 
segDisplay display (
	.note(note),
	.seg(seg),
	.an(an)
); 

endmodule
