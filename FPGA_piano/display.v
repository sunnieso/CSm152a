`timescale 1ns / 1ps

/*
Seven segment display:
 AAA
F   B
 GGG
E   C
 DDD    P
*/

module segDisplay(
	input [3:0] note,
	output reg [7:0] seg,
	output reg [3:0] an
	);

	// Assign 7 segment display based on the current note
	always @ (note) begin
		case(note)
						// PGFEDCBA
			4'h0: seg = 8'b11000110; // C
			4'h1: seg = 8'b10000011; // B lowercase
			4'h2: seg = 8'b10001000; // A
			4'h3: seg = 8'b10010000; // G lowercase 
			4'h4: seg = 8'b10001110; // F
			4'h5: seg = 8'b10000110; // E
			4'h6: seg = 8'b10100001; // D lowercase
			4'h7: seg = 8'b01000110; // C
			default: seg = 8'b11111111; // none
		endcase
		// display on only one digit
		an = 4'b1110;
	end

endmodule