`timescale 1ns / 1ps

module ledOutput(
	input [3:0] note,
	output reg [7:0] Led
	);

	// ASYNCHRONOUS assign led display based on the current note
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