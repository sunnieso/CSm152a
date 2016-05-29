`timescale 1ns / 1ps

module doReMiAUTO (
	input RESET,
	input MODE2,
	input _QUARTER_BEAT,
	output reg [3:0] note,
	output reg [7:0] Led
);

`include "parameters.v"

// States
reg [6:0] state;

// Next state
always @ (posedge _QUARTER_BEAT or posedge MODE2) begin
	if (MODE2 || RESET)
		state <= 7'b0;
	else begin
		if (state == 7'b1101101)
			state <= 7'b0;
		else
			state <= state + 1'b1;
	end
end

// Note
always @(state) begin
	case (state)
		7'b0000000: note = none;
		7'b0000001: note = C4;
		7'b0000010: note = C4;
		7'b0000011: note = C4;
		7'b0000100: note = D;
		7'b0000101: note = E;
		7'b0000110: note = E;
		7'b0000111: note = E;
		7'b0001000: note = C4;
		7'b0001001: note = E;
		7'b0001010: note = E;
		7'b0001011: note = C4;
		7'b0001100: note = C4;
		7'b0001101: note = E;
		7'b0001110: note = E;
		7'b0001111: note = E;
		7'b0010000: note = E;
		7'b0010001: note = D;
		7'b0010010: note = D;
		7'b0010011: note = D;
		7'b0010100: note = E;
		7'b0010101: note = F;
		7'b0010110: note = F;
		7'b0010111: note = E;
		7'b0011000: note = D;
		7'b0011001: note = F;
		7'b0011010: note = F;
		7'b0011011: note = F;
		7'b0011100: note = F;
		7'b0011101: note = E;
		7'b0011110: note = E;
		7'b0011111: note = E;
		7'b0100000: note = F;
		7'b0100001: note = G;
		7'b0100010: note = G;
		7'b0100011: note = G;
		7'b0100100: note = E;
		7'b0100101: note = G;
		7'b0100110: note = G;
		7'b0100111: note = E;
		7'b0101000: note = E;
		7'b0101001: note = G;
		7'b0101010: note = G;
		7'b0101011: note = G;
		7'b0101100: note = G;
		7'b0101101: note = F;
		7'b0101110: note = F;
		7'b0101111: note = F;
		7'b0110000: note = G;
		7'b0110001: note = A;
		7'b0110010: note = A;
		7'b0110011: note = G;
		7'b0110100: note = F;
		7'b0110101: note = A;
		7'b0110110: note = A;
		7'b0110111: note = A;
		7'b0111000: note = A;
		7'b0111001: note = G;
		7'b0111010: note = G;
		7'b0111011: note = G;
		7'b0111100: note = C4;
		7'b0111101: note = D;
		7'b0111110: note = E;
		7'b0111111: note = F;
		7'b1000000: note = G;
		7'b1000001: note = A;
		7'b1000010: note = A;
		7'b1000011: note = A;
		7'b1000100: note = A;
		7'b1000101: note = A;
		7'b1000110: note = A;
		7'b1000111: note = A;
		7'b1001000: note = D;
		7'b1001001: note = E;
		7'b1001010: note = F;
		7'b1001011: note = G;
		7'b1001100: note = A;
		7'b1001101: note = B;
		7'b1001110: note = B;
		7'b1001111: note = B;
		7'b1010000: note = B;
		7'b1010001: note = B;
		7'b1010010: note = B;
		7'b1010011: note = B;
		7'b1010100: note = E;
		7'b1010101: note = F;
		7'b1010110: note = G;
		7'b1010111: note = A;
		7'b1011000: note = B;
		7'b1011001: note = C5;
		7'b1011010: note = C5;
		7'b1011011: note = C5;
		7'b1011100: note = C5;
		7'b1011101: note = B;
		7'b1011110: note = A;
		7'b1011111: note = A;
		7'b1100000: note = F;
		7'b1100001: note = F;
		7'b1100010: note = B;
		7'b1100011: note = B;
		7'b1100100: note = G;
		7'b1100101: note = G;
		7'b1100110: note = C5;
		7'b1100111: note = C5;
		7'b1101000: note = G;
		7'b1101001: note = G;
		7'b1101010: note = E;
		7'b1101011: note = E;
		7'b1101100: note = D;
		7'b1101101: note = D;
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