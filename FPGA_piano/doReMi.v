`timescale 1ns / 1ps

module doReMi (
	input CLK,
	input RESET,
	input START,
	input [3:0] note,
	output reg [7:0] Led
);

`include "parameters.v"

// States
reg [6:0] state;

// Next state, changes with note change from switch input
always @ (posedge CLK or posedge RESET) begin
	if (RESET || START)
		state <= 7'b0;
	else begin
		case (state)
			7'b0000000: state <= (note == C4) ? state + 1'b1 : state;
			7'b0000001: state <= (note == none) ? state + 1'b1 : state;
			7'b0000010: state <= (note == D) ? state + 1'b1 : state;
			7'b0000011: state <= (note == none) ? state + 1'b1 : state;
			7'b0000100: state <= (note == E) ? state + 1'b1 : state;
			7'b0000101: state <= (note == none) ? state + 1'b1 : state;
			7'b0000110: state <= (note == C4) ? state + 1'b1 : state;
			7'b0000111: state <= (note == none) ? state + 1'b1 : state;
			7'b0001000: state <= (note == E) ? state + 1'b1 : state;
			7'b0001001: state <= (note == none) ? state + 1'b1 : state;
			7'b0001010: state <= (note == C4) ? state + 1'b1 : state;
			7'b0001011: state <= (note == none) ? state + 1'b1 : state;
			7'b0001100: state <= (note == E) ? state + 1'b1 : state;
			7'b0001101: state <= (note == none) ? state + 1'b1 : state;
			7'b0001110: state <= (note == D) ? state + 1'b1 : state;
			7'b0001111: state <= (note == none) ? state + 1'b1 : state;
			7'b0010000: state <= (note == E) ? state + 1'b1 : state;
			7'b0010001: state <= (note == none) ? state + 1'b1 : state;
			7'b0010010: state <= (note == F) ? state + 1'b1 : state;
			7'b0010011: state <= (note == none) ? state + 1'b1 : state;
			7'b0010100: state <= (note == F) ? state + 1'b1 : state;
			7'b0010101: state <= (note == none) ? state + 1'b1 : state;
			7'b0010110: state <= (note == E) ? state + 1'b1 : state;
			7'b0010111: state <= (note == none) ? state + 1'b1 : state;
			7'b0011000: state <= (note == D) ? state + 1'b1 : state;
			7'b0011001: state <= (note == none) ? state + 1'b1 : state;
			7'b0011010: state <= (note == F) ? state + 1'b1 : state;
			7'b0011011: state <= (note == none) ? state + 1'b1 : state;
			7'b0011100: state <= (note == E) ? state + 1'b1 : state;
			7'b0011101: state <= (note == none) ? state + 1'b1 : state;
			7'b0011110: state <= (note == F) ? state + 1'b1 : state;
			7'b0011111: state <= (note == none) ? state + 1'b1 : state;
			7'b0100000: state <= (note == G) ? state + 1'b1 : state;
			7'b0100001: state <= (note == none) ? state + 1'b1 : state;
			7'b0100010: state <= (note == E) ? state + 1'b1 : state;
			7'b0100011: state <= (note == none) ? state + 1'b1 : state;
			7'b0100100: state <= (note == G) ? state + 1'b1 : state;
			7'b0100101: state <= (note == none) ? state + 1'b1 : state;
			7'b0100110: state <= (note == E) ? state + 1'b1 : state;
			7'b0100111: state <= (note == none) ? state + 1'b1 : state;
			7'b0101000: state <= (note == G) ? state + 1'b1 : state;
			7'b0101001: state <= (note == none) ? state + 1'b1 : state;
			7'b0101010: state <= (note == F) ? state + 1'b1 : state;
			7'b0101011: state <= (note == none) ? state + 1'b1 : state;
			7'b0101100: state <= (note == G) ? state + 1'b1 : state;
			7'b0101101: state <= (note == none) ? state + 1'b1 : state;
			7'b0101110: state <= (note == A) ? state + 1'b1 : state;
			7'b0101111: state <= (note == none) ? state + 1'b1 : state;
			7'b0110000: state <= (note == A) ? state + 1'b1 : state;
			7'b0110001: state <= (note == none) ? state + 1'b1 : state;
			7'b0110010: state <= (note == G) ? state + 1'b1 : state;
			7'b0110011: state <= (note == none) ? state + 1'b1 : state;
			7'b0110100: state <= (note == F) ? state + 1'b1 : state;
			7'b0110101: state <= (note == none) ? state + 1'b1 : state;
			7'b0110110: state <= (note == A) ? state + 1'b1 : state;
			7'b0110111: state <= (note == none) ? state + 1'b1 : state;
			7'b0111000: state <= (note == G) ? state + 1'b1 : state;
			7'b0111001: state <= (note == none) ? state + 1'b1 : state;
			7'b0111010: state <= (note == C4) ? state + 1'b1 : state;
			7'b0111011: state <= (note == none) ? state + 1'b1 : state;
			7'b0111100: state <= (note == D) ? state + 1'b1 : state;
			7'b0111101: state <= (note == none) ? state + 1'b1 : state;
			7'b0111110: state <= (note == E) ? state + 1'b1 : state;
			7'b0111111: state <= (note == none) ? state + 1'b1 : state;
			7'b1000000: state <= (note == F) ? state + 1'b1 : state;
			7'b1000001: state <= (note == none) ? state + 1'b1 : state;
			7'b1000010: state <= (note == G) ? state + 1'b1 : state;
			7'b1000011: state <= (note == none) ? state + 1'b1 : state;
			7'b1000100: state <= (note == A) ? state + 1'b1 : state;
			7'b1000101: state <= (note == none) ? state + 1'b1 : state;
			7'b1000110: state <= (note == A) ? state + 1'b1 : state;
			7'b1000111: state <= (note == none) ? state + 1'b1 : state;
			7'b1001000: state <= (note == D) ? state + 1'b1 : state;
			7'b1001001: state <= (note == none) ? state + 1'b1 : state;
			7'b1001010: state <= (note == E) ? state + 1'b1 : state;
			7'b1001011: state <= (note == none) ? state + 1'b1 : state;
			7'b1001100: state <= (note == F) ? state + 1'b1 : state;
			7'b1001101: state <= (note == none) ? state + 1'b1 : state;
			7'b1001110: state <= (note == G) ? state + 1'b1 : state;
			7'b1001111: state <= (note == none) ? state + 1'b1 : state;
			7'b1010000: state <= (note == A) ? state + 1'b1 : state;
			7'b1010001: state <= (note == none) ? state + 1'b1 : state;
			7'b1010010: state <= (note == B) ? state + 1'b1 : state;
			7'b1010011: state <= (note == none) ? state + 1'b1 : state;
			7'b1010100: state <= (note == B) ? state + 1'b1 : state;
			7'b1010101: state <= (note == none) ? state + 1'b1 : state;
			7'b1010110: state <= (note == E) ? state + 1'b1 : state;
			7'b1010111: state <= (note == none) ? state + 1'b1 : state;
			7'b1011000: state <= (note == F) ? state + 1'b1 : state;
			7'b1011001: state <= (note == none) ? state + 1'b1 : state;
			7'b1011010: state <= (note == G) ? state + 1'b1 : state;
			7'b1011011: state <= (note == none) ? state + 1'b1 : state;
			7'b1011100: state <= (note == A) ? state + 1'b1 : state;
			7'b1011101: state <= (note == none) ? state + 1'b1 : state;
			7'b1011110: state <= (note == B) ? state + 1'b1 : state;
			7'b1011111: state <= (note == none) ? state + 1'b1 : state;
			7'b1100000: state <= (note == C5) ? state + 1'b1 : state;
			7'b1100001: state <= (note == none) ? state + 1'b1 : state;
			7'b1100010: state <= (note == C5) ? state + 1'b1 : state;
			7'b1100011: state <= (note == none) ? state + 1'b1 : state;
			7'b1100100: state <= (note == B) ? state + 1'b1 : state;
			7'b1100101: state <= (note == none) ? state + 1'b1 : state;
			7'b1100110: state <= (note == A) ? state + 1'b1 : state;
			7'b1100111: state <= (note == none) ? state + 1'b1 : state;
			7'b1101000: state <= (note == F) ? state + 1'b1 : state;
			7'b1101001: state <= (note == none) ? state + 1'b1 : state;
			7'b1101010: state <= (note == B) ? state + 1'b1 : state;
			7'b1101011: state <= (note == none) ? state + 1'b1 : state;
			7'b1101100: state <= (note == G) ? state + 1'b1 : state;
			7'b1101101: state <= (note == none) ? state + 1'b1 : state;
			7'b1101110: state <= (note == C5) ? state + 1'b1 : state;
			7'b1101111: state <= (note == none) ? state + 1'b1 : state;
			7'b1110000: state <= (note == G) ? state + 1'b1 : state;
			7'b1110001: state <= (note == none) ? state + 1'b1 : state;
			7'b1110010: state <= (note == E) ? state + 1'b1 : state;
			7'b1110011: state <= (note == none) ? state + 1'b1 : state;
			7'b1110100: state <= (note == D) ? state + 1'b1 : state;
			7'b1110101: state <= (note == none) ? state + 1'b1 : state;
			default: state <= 7'b0;
		endcase
	end
end

// Led output
always @ (posedge CLK or posedge RESET) begin
	if (RESET)
		Led <= 8'b0;
	else begin
		case (state)
			7'b0000000: Led <= _C4;
			7'b0000001: Led <= _C4;
			7'b0000010: Led <= _D;
			7'b0000011: Led <= _D;
			7'b0000100: Led <= _E;
			7'b0000101: Led <= _E;
			7'b0000110: Led <= _C4;
			7'b0000111: Led <= _C4;
			7'b0001000: Led <= _E;
			7'b0001001: Led <= _E;
			7'b0001010: Led <= _C4;
			7'b0001011: Led <= _C4;
			7'b0001100: Led <= _E;
			7'b0001101: Led <= _E;
			7'b0001110: Led <= _D;
			7'b0001111: Led <= _D;
			7'b0010000: Led <= _E;
			7'b0010001: Led <= _E;
			7'b0010010: Led <= _F;
			7'b0010011: Led <= _F;
			7'b0010100: Led <= _F;
			7'b0010101: Led <= _F;
			7'b0010110: Led <= _E;
			7'b0010111: Led <= _E;
			7'b0011000: Led <= _D;
			7'b0011001: Led <= _D;
			7'b0011010: Led <= _F;
			7'b0011011: Led <= _F;
			7'b0011100: Led <= _E;
			7'b0011101: Led <= _E;
			7'b0011110: Led <= _F;
			7'b0011111: Led <= _F;
			7'b0100000: Led <= _G;
			7'b0100001: Led <= _G;
			7'b0100010: Led <= _E;
			7'b0100011: Led <= _E;
			7'b0100100: Led <= _G;
			7'b0100101: Led <= _G;
			7'b0100110: Led <= _E;
			7'b0100111: Led <= _E;
			7'b0101000: Led <= _G;
			7'b0101001: Led <= _G;
			7'b0101010: Led <= _F;
			7'b0101011: Led <= _F;
			7'b0101100: Led <= _G;
			7'b0101101: Led <= _G;
			7'b0101110: Led <= _A;
			7'b0101111: Led <= _A;
			7'b0110000: Led <= _A;
			7'b0110001: Led <= _A;
			7'b0110010: Led <= _G;
			7'b0110011: Led <= _G;
			7'b0110100: Led <= _F;
			7'b0110101: Led <= _F;
			7'b0110110: Led <= _A;
			7'b0110111: Led <= _A;
			7'b0111000: Led <= _G;
			7'b0111001: Led <= _G;
			7'b0111010: Led <= _C4;
			7'b0111011: Led <= _C4;
			7'b0111100: Led <= _D;
			7'b0111101: Led <= _D;
			7'b0111110: Led <= _E;
			7'b0111111: Led <= _E;
			7'b1000000: Led <= _F;
			7'b1000001: Led <= _F;
			7'b1000010: Led <= _G;
			7'b1000011: Led <= _G;
			7'b1000100: Led <= _A;
			7'b1000101: Led <= _A;
			7'b1000110: Led <= _A;
			7'b1000111: Led <= _A;
			7'b1001000: Led <= _D;
			7'b1001001: Led <= _D;
			7'b1001010: Led <= _E;
			7'b1001011: Led <= _E;
			7'b1001100: Led <= _F;
			7'b1001101: Led <= _F;
			7'b1001110: Led <= _G;
			7'b1001111: Led <= _G;
			7'b1010000: Led <= _A;
			7'b1010001: Led <= _A;
			7'b1010010: Led <= _B;
			7'b1010011: Led <= _B;
			7'b1010100: Led <= _B;
			7'b1010101: Led <= _B;
			7'b1010110: Led <= _E;
			7'b1010111: Led <= _E;
			7'b1011000: Led <= _F;
			7'b1011001: Led <= _F;
			7'b1011010: Led <= _G;
			7'b1011011: Led <= _G;
			7'b1011100: Led <= _A;
			7'b1011101: Led <= _A;
			7'b1011110: Led <= _B;
			7'b1011111: Led <= _B;
			7'b1100000: Led <= _C5;
			7'b1100001: Led <= _C5;
			7'b1100010: Led <= _C5;
			7'b1100011: Led <= _C5;
			7'b1100100: Led <= _B;
			7'b1100101: Led <= _B;
			7'b1100110: Led <= _A;
			7'b1100111: Led <= _A;
			7'b1101000: Led <= _F;
			7'b1101001: Led <= _F;
			7'b1101010: Led <= _B;
			7'b1101011: Led <= _B;
			7'b1101100: Led <= _G;
			7'b1101101: Led <= _G;
			7'b1101110: Led <= _C5;
			7'b1101111: Led <= _C5;
			7'b1110000: Led <= _G;
			7'b1110001: Led <= _G;
			7'b1110010: Led <= _E;
			7'b1110011: Led <= _E;
			7'b1110100: Led <= _D;
			7'b1110101: Led <= _D;
			default: Led <= 8'b0;
		endcase
	end
end

endmodule