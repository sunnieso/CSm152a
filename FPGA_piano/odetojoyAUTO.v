`timescale 1ns / 1ps

module odetojoyAUTO (
	input CLK,
	input RESET,
	output [3:0] auto_note
	//output reg [7:0] Led
);

`include "parameters.v"

// Quarter beat generator
wire _QUARTER_BEAT;
Beat beat(.CLK(CLK), 
		.RESET(RESET),
		.QUARTER_BEAT(_QUARTER_BEAT)
		);

// States
reg [5:0] state;
reg [3:0] note;
assign auto_note = note;
// States counter:
always @ (posedge _QUARTER_BEAT or posedge RESET) begin
	if (RESET)
		state <= 6'b0;
	else 
		state <= state + 1'b1;

	case (state)
		6'b000000: note <= E;
		6'b000001: note <= none;
		6'b000010: note <= E;
		6'b000011: note <= none;
		6'b000100: note <= F;
		6'b000101: note <= none;
		6'b000110: note <= G;
		6'b000111: note <= none;
		6'b001000: note <= G;
		6'b001001: note <= none;
		6'b001010: note <= F;
		6'b001011: note <= none;
		6'b001100: note <= E;
		6'b001101: note <= none;
		6'b001110: note <= D;
		6'b001111: note <= none;
		6'b010000: note <= C4;
		6'b010001: note <= none;
		6'b010010: note <= C4;
		6'b010011: note <= none;
		6'b010100: note <= D;
		6'b010101: note <= none;
		6'b010110: note <= E;
		6'b010111: note <= none;
		6'b011000: note <= E;
		6'b011001: note <= E;
		6'b011010: note <= none;
		6'b011011: note <= D;
		6'b011100: note <= D;
		6'b011101: note <= D;
		6'b011110: note <= D;

		// new parts
		6'b011111: note <= none;
		6'b100000: note <= E;
		6'b100001: note <= none;
		6'b100010: note <= E;
		6'b100011: note <= ;
		6'b100100: note <= F;
		6'b100101: note <= none;
		6'b100110: note <= G;
		6'b100111: note <= none;
		6'b101000: note <= G;
		6'b101001: note <= none;
		6'b101010: note <= F;
		6'b101011: note <= none;
		6'b101100: note <= E;
		6'b101101: note <= none;
		6'b101110: note <= D;
		6'b101111: note <= none;
		6'b110000: note <= C4;
		6'b110001: note <= none;
		6'b110010: note <= C4;
		6'b110011: note <= none;
		6'b110100: note <= D;
		6'b110101: note <= none;
		6'b110110: note <= E;
		6'b110111: note <= none;
		6'b111000: note <= D;
		6'b111001: note <= D;
		6'b111010: note <= none;
		6'b111011: note <= C4;
		6'b111100: note <= C4;
		6'b111101: note <= C4;
		6'b111110: note <= C4;
		6'b111111: note <= none;
		default: note <= none;
		
	endcase
end

/*
always @ (state) begin
	case (state)
		6'b000000: Led = _E;
		6'b000001: Led = _E;
		6'b000010: Led = _E;
		6'b000011: Led = _E;
		6'b000100: Led = _F;
		6'b000101: Led = _F;
		6'b000110: Led = _G;
		6'b000111: Led = _G;
		6'b001000: Led = _G;
		6'b001001: Led = _G;
		6'b001010: Led = _F;
		6'b001011: Led = _F;
		6'b001100: Led = _E;
		6'b001101: Led = _E;
		6'b001110: Led = _D;
		6'b001111: Led = _D;
		6'b010000: Led = _C4;
		6'b010001: Led = _C4;
		6'b010010: Led = _C4;
		6'b010011: Led = _C4;
		6'b010100: Led = _D;
		6'b010101: Led = _D;
		6'b010110: Led = _E;
		6'b010111: Led = _E;
		6'b011000: Led = _E;
		6'b011001: Led = _E;
		6'b011010: Led = _D;
		6'b011011: Led = _D;
		6'b011100: Led = _D;
		6'b011101: Led = _D;
		6'b011110: Led = _E;
		default: Led = 8'b0;
	endcase
end
*/

endmodule