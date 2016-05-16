`timescale 1ns / 1ps
`include "piano.v"

module odetojoy (
	input CLK,
	input RESET,
	input [3:0] note,
	output reg [7:0] Led
);

`include "parameters.v"

// States
reg [5:0] state;

always @ (posedge CLK or posedge RESET) begin
	if (RESET)
		state <= 6'b0;
	else begin
		case (state)
			6'b000000: state <= (note == E) ? state + 1'b1 : state;
			6'b000001: state <= (note == none) ? state + 1'b1 : state;
			6'b000010: state <= (note == E) ? state + 1'b1 : state;
			6'b000011: state <= (note == none) ? state + 1'b1 : state;
			6'b000100: state <= (note == F) ? state + 1'b1 : state;
			6'b000101: state <= (note == none) ? state + 1'b1 : state;
			6'b000110: state <= (note == G) ? state + 1'b1 : state;
			6'b000111: state <= (note == none) ? state + 1'b1 : state;
			6'b001000: state <= (note == G) ? state + 1'b1 : state;
			6'b001001: state <= (note == none) ? state + 1'b1 : state;
			6'b001010: state <= (note == F) ? state + 1'b1 : state;
			6'b001011: state <= (note == none) ? state + 1'b1 : state;
			6'b001100: state <= (note == E) ? state + 1'b1 : state;
			6'b001101: state <= (note == none) ? state + 1'b1 : state;
			6'b001110: state <= (note == D) ? state + 1'b1 : state;
			6'b001111: state <= (note == none) ? state + 1'b1 : state;
			6'b010000: state <= (note == C4) ? state + 1'b1 : state;
			6'b010001: state <= (note == none) ? state + 1'b1 : state;
			6'b010010: state <= (note == C4) ? state + 1'b1 : state;
			6'b010011: state <= (note == none) ? state + 1'b1 : state;
			6'b010100: state <= (note == D) ? state + 1'b1 : state;
			6'b010101: state <= (note == none) ? state + 1'b1 : state;
			6'b010110: state <= (note == E) ? state + 1'b1 : state;
			6'b010111: state <= (note == none) ? state + 1'b1 : state;
			6'b011000: state <= (note == E) ? state + 1'b1 : state;
			6'b011001: state <= (note == none) ? state + 1'b1 : state;
			6'b011010: state <= (note == D) ? state + 1'b1 : state;
			6'b011011: state <= (note == none) ? state + 1'b1 : state;
			6'b011100: state <= (note == D) ? state + 1'b1 : state;
			6'b011101: state <= (note == none) ? state + 1'b1 : state;
			6'b011110: state <= 6'b0;
		endcase
	end
end

always @ (posedge CLK or posedge RESET) begin
	if (RESET)
		Led <= _E;
	else begin
		case (state)
			6'b000000: Led <= _E;
			6'b000001: Led <= _E;
			6'b000010: Led <= _E;
			6'b000011: Led <= _E;
			6'b000100: Led <= _F;
			6'b000101: Led <= _F;
			6'b000110: Led <= _G;
			6'b000111: Led <= _G;
			6'b001000: Led <= _G;
			6'b001001: Led <= _G;
			6'b001010: Led <= _F;
			6'b001011: Led <= _F;
			6'b001100: Led <= _E;
			6'b001101: Led <= _E;
			6'b001110: Led <= _D;
			6'b001111: Led <= _D;
			6'b010000: Led <= _C4;
			6'b010001: Led <= _C4;
			6'b010010: Led <= _C4;
			6'b010011: Led <= _C4;
			6'b010100: Led <= _D;
			6'b010101: Led <= _D;
			6'b010110: Led <= _E;
			6'b010111: Led <= _E;
			6'b011000: Led <= _E;
			6'b011001: Led <= _E;
			6'b011010: Led <= _D;
			6'b011011: Led <= _D;
			6'b011100: Led <= _D;
			6'b011101: Led <= _D;
			6'b011110: Led <= _E;
		endcase
	end
end

endmodule