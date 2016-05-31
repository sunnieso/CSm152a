`timescale 1ns / 1ps

module piano_tb;

	// Inputs
	reg CLK;
	reg RESET;
	reg ODETOJOY;
	reg ODETOJOY_AUTO;
	reg DOREMI;
	reg DOREMI_AUTO;
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
		.ODETOJOY(ODETOJOY), 
		.ODETOJOY_AUTO(ODETOJOY_AUTO), 
		.DOREMI(DOREMI), 
		.DOREMI_AUTO(DOREMI_AUTO), 
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
		ODETOJOY = 0;
		ODETOJOY_AUTO = 0;
		DOREMI = 0;
		DOREMI_AUTO = 0;
		sw = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#1 ODETOJOY_AUTO = 1;
		#1 ODETOJOY_AUTO = 0;
		#1 ODETOJOY_AUTO = 1;
		#1 ODETOJOY_AUTO = 0;
		#1 ODETOJOY_AUTO = 1;

		#100 ODETOJOY_AUTO = 0;


		#1 DOREMI_AUTO = 1;
		#1 DOREMI_AUTO = 0;
		#1 DOREMI_AUTO = 1;
		#1 DOREMI_AUTO = 0;
		#1 DOREMI_AUTO = 1;

		#100 DOREMI_AUTO = 0;



		#1 ODETOJOY = 1;
		#1 ODETOJOY = 0;
		#1 ODETOJOY = 1;
		#1 ODETOJOY = 0;
		#1 ODETOJOY = 1;

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

		#10 ODETOJOY = 0;


		#1 DOREMI = 1;
		#1 DOREMI = 0;
		#1 DOREMI = 1;
		#1 DOREMI = 0;
		#1 DOREMI = 1;
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
		#100 DOREMI = 0;


	end

  	always #1 CLK = ~CLK;

 	// always #5 mode = ~mode;


  	initial
		#20000 $finish;
      
endmodule

