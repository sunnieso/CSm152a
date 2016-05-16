`timescale 1ns / 1ps
// `include "parameters.v"

/* From parameter.v
// Notes
parameter C5 = 4'b0000;
parameter B = 4'b0001;
parameter A = 4'b0010;
parameter G = 4'b0011;
parameter F = 4'b0100;
parameter E = 4'b0101;
parameter D = 4'b0110;
parameter C4 = 4'b0111;
parameter none = 4'b1000;
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

	// ASYNCHRONOUS assign 7 segment display based on the current note
	always @ (note) begin
		case(note)       //PGFEDCBA
			4'h0: seg = 8'b11000110; // C
			4'h1: seg = 8'b11000000; // D
			4'h2: seg = 8'b10000110; // E
			4'h3: seg = 8'b10001110; // F
			4'h4: seg = 8'b10000010; // G
			4'h5: seg = 8'b10001000; // A
			4'h6: seg = 8'b10000000; // B
			4'h7: seg = 8'b01000110; // C
			default: seg = 8'b11111111; // nono
		endcase
		an = 4'b1110;
	end

endmodule
