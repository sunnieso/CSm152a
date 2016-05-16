`timescale 1ns / 1ps
`include "freq.v"

module piano (
	input CLK,
	input RESET,
	input [7:0] sw,
	output reg [3:0] note,
	output reg FREQ
);

`include "parameters.v"

// Frequency clocks
wire CLK_C4;
wire CLK_D;
wire CLK_E;
wire CLK_F;
wire CLK_G;
wire CLK_A;
wire CLK_B;
wire CLK_C5;

ClockManager Frequencies(
	.RESET(RESET),
	.CLK(CLK),
	.CLK_C4(CLK_C4),
	.CLK_D(CLK_D),
	.CLK_E(CLK_E),
	.CLK_F(CLK_F),
	.CLK_G(CLK_G),
	.CLK_A(CLK_A),
	.CLK_B(CLK_B),
	.CLK_C5(CLK_C5)
);

always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		note <= none;
		FREQ <= 0;
	end
	else if (sw[7]) begin
		note <= C4;
		FREQ <= CLK_C4;
	end
	else if (sw[6]) begin
		note <= D;
		FREQ <= CLK_D;
	end
	else if (sw[5]) begin
		note <= E;
		FREQ <= CLK_E;
	end 
	else if (sw[4]) begin
		note <= F;
		FREQ <= CLK_F;
	end
	else if (sw[3]) begin
		note <= G;
		FREQ <= CLK_G;
	end
	else if (sw[2]) begin
		note <= A;
		FREQ <= CLK_A;
	end
	else if (sw[1]) begin
		note <= B;
		FREQ <= CLK_B;
	end
	else if (sw[0]) begin
		note <= C5;
		FREQ <= CLK_C5;
	end
	else begin
		note <= none;
		FREQ <= 0;
	end
end

endmodule
