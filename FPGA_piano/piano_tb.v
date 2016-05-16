`timescale 1ns / 1ps
`include "piano.v"
// 7  6 5 4 3 2 1 0
// C4 D E F G A B C4

module piano_tb;

	// Inputs
	reg CLK;
	reg RESET;
	reg [7:0] sw;

	// Outputs
	wire FREQ;
	wire [7:0] Led;

	// Instantiate the Unit Under Test (UUT)
	piano uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.sw(sw),
		.FREQ(FREQ),
		.Led(Led)
	);

	initial begin
		// Initialize Inputs
		CLK = 1;
		RESET = 1;
		sw = 8'b0;

		// Wait 100 ns for global reset to finish
		#100 RESET = 0;

		#50 sw[5] = 1;
		#50 sw[5] = 0;
		#50 sw[5] = 1;
		#50 sw[5] = 0;
		#50 sw[4] = 1;
		#50 sw[4] = 0;
		#50 sw[3] = 1;
		#50 sw[3] = 0;
		#50 sw[3] = 1;
		#50 sw[3] = 0;
		#50 sw[4] = 1;
		#50 sw[4] = 0;
		#50 sw[5] = 1;
		#50 sw[5] = 0;
		#50 sw[6] = 1;
		#50 sw[6] = 0;
		#50 sw[7] = 1;
		#50 sw[7] = 0;
		#50 sw[7] = 1;
		#50 sw[7] = 0;
		#50 sw[6] = 1;
		#50 sw[6] = 0;
		#50 sw[5] = 1;
		#50 sw[5] = 0;
		#50 sw[5] = 1;
		#50 sw[5] = 0;
		#50 sw[4] = 1;
		#50 sw[4] = 0;
		#50 sw[4] = 1;
		#50 sw[4] = 0;
	end

  always #1 CLK = ~CLK;

  initial
		#2000 $finish;
      
endmodule

