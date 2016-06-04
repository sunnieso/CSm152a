`timescale 1ns / 1ps

module piano_tb;

	// Inputs
	reg CLK;
	reg RESET;
	reg ODE_TO_JOY_AUTO;
	reg DOREMI_AUTO;
	reg DOREMI_LEARN;
	reg [7:0] sw;

	// Outputs
	wire FREQ;
	wire [7:0] Led;
	wire [7:0] seg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	piano uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.ODE_TO_JOY_AUTO(ODE_TO_JOY_AUTO), 
		.DOREMI_AUTO(DOREMI_AUTO), 
		.DOREMI_LEARN(DOREMI_LEARN), 
		.sw(sw), 
		.FREQ(FREQ), 
		.Led(Led), 
		.seg(seg), 
		.an(an)
	);


   initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 0;
		ODE_TO_JOY_AUTO = 0;
		DOREMI_LEARN = 0;
		DOREMI_AUTO = 0;
		sw = 0;

		// Wait 100 ns for global reset to finish
		RESET = 1;
		#100;
		RESET = 0;
		// Add stimulus here
		#1 ODE_TO_JOY_AUTO = 1;
		#20 ODE_TO_JOY_AUTO = 0;



		#1000 DOREMI_AUTO = 1;
		#20 DOREMI_AUTO = 0;




		#1000 RESET = 1;
		#20 RESET = 0;

			#50 sw[5] = 1; //e
			#1  sw[5] = 0; //e
			#1  sw[5] = 1; //e
			#1  sw[5] = 0; //e
			#1  sw[5] = 1; //e
			#1  sw[5] = 0; //e
			#1  sw[5] = 1; //e
			#1  sw[5] = 0; //e
			#1  sw[5] = 1; //e
			
			#50 sw[5] = 0; 
			#50 sw[5] = 1; //e
			#50 sw[5] = 0; 
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;
			#50 sw[6] = 1; //d
			#50 sw[6] = 0;
			#50 sw[7] = 1; //c
			#50 sw[7] = 0; 
			#50 sw[7] = 1; //c
			#50 sw[7] = 0;
			#50 sw[6] = 1; //d
			#50 sw[6] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;
			#50 sw[4] = 1; //d
			#50 sw[4] = 0;
			#50 sw[4] = 1; //d
			#50 sw[4] = 0;


			#50 sw[5] = 1; //e
			#50 sw[5] = 0; 
			#50 sw[5] = 1; //e
			#50 sw[5] = 0; 
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;
			#50 sw[6] = 1; //d
			#50 sw[6] = 0;
			#50 sw[7] = 1; //c
			#50 sw[7] = 0; 
			#50 sw[7] = 1; //c
			#50 sw[7] = 0;
			#50 sw[6] = 1; //d
			#50 sw[6] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;
			#50 sw[6] = 1; //d
			#50 sw[6] = 0;
			#50 sw[7] = 1; //c
			#50 sw[7] = 0;
			#50 sw[7] = 1; //c
			#50 sw[7] = 0;



		#1 DOREMI_LEARN = 1;
		#20 DOREMI_LEARN = 0;
			#50 sw[7] = 1; //c
			#50 sw[7] = 0; 
			#50 sw[6] = 1; //d
			#50 sw[6] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0; 
			#50 sw[7] = 1; //c
			#50 sw[7] = 0; 
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;
			#50 sw[7] = 1; //c
			#50 sw[7] = 0; 
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;

			#50 sw[6] = 1; //d
			#50 sw[6] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0; 
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;
			#50 sw[6] = 1; //d
			#50 sw[6] = 0;
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;

			#50 sw[5] = 1; //e
			#50 sw[5] = 0; 
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0; 
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0; 
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;

			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[2] = 1; //a
			#50 sw[2] = 0;
			#50 sw[2] = 1; //a
			#50 sw[2] = 0;
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[2] = 1; //a
			#50 sw[2] = 0;

			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[7] = 1; //c
			#50 sw[7] = 0; 
			#50 sw[6] = 1; //d
			#50 sw[6] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[2] = 1; //a
			#50 sw[2] = 0;

			#50 sw[2] = 1; //a
			#50 sw[2] = 0;
			#50 sw[6] = 1; //d
			#50 sw[6] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0; 
			#50 sw[4] = 1; //f
			#50 sw[4] = 0;
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[2] = 1; //a
			#50 sw[2] = 0;
			#50 sw[1] = 1; //b
			#50 sw[1] = 0;


			#50 sw[1] = 1; //b
			#50 sw[1] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;
			#50 sw[4] = 1; //f
			#50 sw[4] = 0; 
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[2] = 1; //a
			#50 sw[2] = 0;
			#50 sw[1] = 1; //b
			#50 sw[1] = 0;
			#50 sw[0] = 1; //c
			#50 sw[0] = 0;


			#50 sw[0] = 1; //c
			#50 sw[0] = 0;
			#50 sw[1] = 1; //b
			#50 sw[1] = 0;
			#50 sw[2] = 1; //a
			#50 sw[2] = 0;
			#50 sw[4] = 1; //f
			#50 sw[4] = 0; 
			#50 sw[1] = 1; //b
			#50 sw[1] = 0;
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[0] = 1; //c
			#50 sw[0] = 0;
			
			#50 sw[3] = 1; //g
			#50 sw[3] = 0;
			#50 sw[5] = 1; //e
			#50 sw[5] = 0;
			#50 sw[6] = 1; //d
			#50 sw[6] = 0;


	end

  	always #1 CLK = ~CLK;


  	initial
		#20000 $finish;
   
endmodule

