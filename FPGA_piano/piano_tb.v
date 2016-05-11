`timescale 1ns / 1ps
`include "piano.v"

module piano_tb;

	// Inputs
	reg CLK;
	reg RESET;

	// Outputs
	wire FREQ;

	// Instantiate the Unit Under Test (UUT)
	piano uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.FREQ(FREQ)
	);

	initial begin
		// Initialize Inputs
		CLK = 1;
		RESET = 1;

		// Wait 100 ns for global reset to finish
		#100;
      RESET = 0;
	end

  always #1 CLK = ~CLK;
      
endmodule

