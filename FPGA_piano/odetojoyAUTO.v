`timescale 1ns / 1ps

module odetojoyAUTO (
	input RESET,
	input MODE,
	input _QUARTER_BEAT,
	//input _EIGHTH_BEAT,
	output reg [3:0] note,
	output reg [7:0] Led
);

`include "parameters.v"

// States
reg [5:0] state;

// Next state
always @ (posedge _QUARTER_BEAT or posedge MODE) begin
	if (MODE || RESET)
		state <= 6'b0;
	else begin
		if (state == 6'b111111)
			state <= 6'b0;
		else
			state <= state + 1'b1;
	end
end

// Note
always @(state) begin
	case (state)
		6'b000000: note = none;
		6'b000001: note = E;
		6'b000010: note = none;
		6'b000011: note = E;
		6'b000100: note = none;
		6'b000101: note = F;
		6'b000110: note = none;
		6'b000111: note = G;
		6'b001000: note = none;
		6'b001001: note = G;
		6'b001010: note = none;
		6'b001011: note = F;
		6'b001100: note = none;
		6'b001101: note = E;
		6'b001110: note = none;
		6'b001111: note = D;
		6'b010000: note = none;
		6'b010001: note = C4;
		6'b010010: note = none;
		6'b010011: note = C4;
		6'b010100: note = none;
		6'b010101: note = D;
		6'b010110: note = none;
		6'b010111: note = E;
		6'b011000: note = none;
		6'b011001: note = E;
		6'b011010: note = E;
		6'b011011: note = E;
		6'b011100: note = none;
		6'b011101: note = D;
		6'b011110: note = D;
		6'b011111: note = D;
		6'b100000: note = none;
		6'b100001: note = E;
		6'b100010: note = none;
		6'b100011: note = E;
		6'b100100: note = none;
		6'b100101: note = F;
		6'b100110: note = none;
		6'b100111: note = G;
		6'b101000: note = none;
		6'b101001: note = G;
		6'b101010: note = none;
		6'b101011: note = F;
		6'b101100: note = none;
		6'b101101: note = E;
		6'b101110: note = none;
		6'b101111: note = D;
		6'b110000: note = none;
		6'b110001: note = C4;
		6'b110010: note = none;
		6'b110011: note = C4;
		6'b110100: note = none;
		6'b110101: note = D;
		6'b110110: note = none;
		6'b110111: note = E;
		6'b111000: note = none;
		6'b111001: note = D;
		6'b111010: note = D;
		6'b111011: note = D;
		6'b111100: note = none;
		6'b111101: note = C4;
		6'b111110: note = C4;
		6'b111111: note = C4;
		default: note = none;
	endcase
end

always @ (note) begin
		case(note)
			4'h0: Led = _C5;
			4'h1: Led = _B;
			4'h2: Led = _A;
			4'h3: Led = _G;
			4'h4: Led = _F;
			4'h5: Led = _E;
			4'h6: Led = _D;
			4'h7: Led = _C4;
			4'h8: Led = 8'b0; // none
			default: Led = 8'b11111111; 
		endcase
	end

endmodule