`timescale 1ns / 1ps

module notes (
	input CLK,
	input RESET,
	input [7:0] sw,
	output reg [3:0] note
);

`include "parameters.v"

always @ (posedge CLK or posedge RESET) begin
	if (RESET)
		note <= none;
	else if (sw[7])
		note <= C4;
	else if (sw[6])
		note <= D;
	else if (sw[5])
		note <= E;
	else if (sw[4])
		note <= F;
	else if (sw[3])
		note <= G;
	else if (sw[2])
		note <= A;
	else if (sw[1])
		note <= B;
	else if (sw[0])
		note <= C5;
	else
		note <= none;
end

endmodule