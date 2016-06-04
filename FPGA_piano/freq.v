`timescale 1ns / 1ps

module clockManager(    // Clock manager that outputs all clock signals.
	input CLK,
	input RESET,
	output reg CLK_C4,	// 261.63 ==> 382219
	output reg CLK_D,	// 293.66 ==> 340530
	output reg CLK_E,	// 329.63 ==> 303370
	output reg CLK_F,	// 349.23 ==> 286344
	output reg CLK_G,	// 392.00 ==> 255102
	output reg CLK_A,   // 440.00 ==> 227272
	output reg CLK_B,	// 493.88 ==> 202429
	output reg CLK_C5, 	// 523.25 ==> 191204
	output reg QUARTER_BEAT
	);

/* tempo=110 ==>
 * 	 eighth note:  250 ms ==> 
 * 	 quarter note : 500 ms ==> 	28'b1011_1110_1011_1100_0010_0000_0000
 *	 one half note: 1000 ms ==> 			
 */

reg [17:0] cnt_CLK_C4;
reg [17:0] cnt_CLK_D;
reg [17:0] cnt_CLK_E;
reg [17:0] cnt_CLK_F;
reg [16:0] cnt_CLK_G;
reg [16:0] cnt_CLK_A;
reg [16:0] cnt_CLK_B;
reg [16:0] cnt_CLK_C5;
reg [23:0] cnt_QUARTER;

// CLK_C4
always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		cnt_CLK_C4 <= 18'b0;
		CLK_C4 <= 0;
	end
	else begin 
		//if (cnt_CLK_C4 == 18'b10_1110_1010_1000_0101) begin  /* for synthesis */
		if (cnt_CLK_C4 == 18'b000_0000_0000_0000_001) begin /* for testbench */
			cnt_CLK_C4 <= 18'b0;
			CLK_C4 <= ~CLK_C4;
		end
		else begin
			cnt_CLK_C4 <= cnt_CLK_C4 + 1'b1;
			CLK_C4 <= CLK_C4;
		end
	end
end

// CLK_D
always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		cnt_CLK_D <= 18'b0;
		CLK_D <= 0;
	end
	else begin 
		//if (cnt_CLK_D == 18'b101_0011_0010_0011_001 ) begin   /* for synthesis */
		if (cnt_CLK_D == 18'b000_0000_0000_0000_010) begin /* for testbench */
			cnt_CLK_D <= 18'b0;
			CLK_D <= ~CLK_D;
		end
		else begin
			cnt_CLK_D <= cnt_CLK_D + 1'b1;
			CLK_D <= CLK_D;
		end
	end
end


// CLK_E
always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		cnt_CLK_E <= 18'b0;
		CLK_E <= 0;
	end
	else begin 
		//if (cnt_CLK_E == 18'b100_1010_0001_0000_101 ) begin  /* for synthesis */
		if (cnt_CLK_E == 18'b000_0000_0000_0000_100) begin /* for testbench */
			cnt_CLK_E <= 18'b0;
			CLK_E <= ~CLK_E;
		end
		else begin
			cnt_CLK_E <= cnt_CLK_E + 1'b1;
			CLK_E <= CLK_E;
		end
	end
end

// CLK_F
always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		cnt_CLK_F <= 18'b0;
		CLK_F <= 0;
	end
	else begin 
		//if (cnt_CLK_F == 18'b100_0101_1110_1000_100 ) begin   /* for synthesis */
		if (cnt_CLK_F == 18'b000_0000_0000_0001_000) begin /* for testbench */
			cnt_CLK_F <= 18'b0;
			CLK_F <= ~CLK_F;
		end
		else begin
			cnt_CLK_F <= cnt_CLK_F + 1'b1;
			CLK_F <= CLK_F;
		end
	end
end


// CLK_G
always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		cnt_CLK_G <= 17'b0;
		CLK_G <= 0;
	end
	else begin 
		//if (cnt_CLK_G == 17'b11_1110_0100_0111_111 ) begin  /* for synthesis */
		if (cnt_CLK_G == 17'b00_0000_0000_0010_000) begin /* for testbench */
			cnt_CLK_G <= 17'b0;
			CLK_G <= ~CLK_G;
		end
		else begin
			cnt_CLK_G <= cnt_CLK_G + 1'b1;
			CLK_G <= CLK_G;
		end
	end
end

// CLK_A
always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		cnt_CLK_A <= 17'b0;
		CLK_A <= 0;
	end
	else begin 
		//if (cnt_CLK_A == 17'b11_0111_0111_1100_100) begin  /* for synthesis */
		if (cnt_CLK_A == 17'b00_0000_0000_0100_000) begin /* for testbench */
			cnt_CLK_A <= 17'b0;
			CLK_A <= ~CLK_A;
		end
		else begin
			cnt_CLK_A <= cnt_CLK_A + 1'b1;
			CLK_A <= CLK_A;
		end
	end
end

// CLK_B
always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		cnt_CLK_B <= 17'b0;
		CLK_B <= 0;
	end
	else begin 
		//if (cnt_CLK_B == 17'b11_0001_0110_1011_110 ) begin  /* for synthesis */
		if (cnt_CLK_B == 17'b00_0000_0000_1000_000) begin /* for testbench */
			cnt_CLK_B <= 17'b0;
			CLK_B <= ~CLK_B;
		end
		else begin
			cnt_CLK_B <= cnt_CLK_B + 1'b1;
			CLK_B <= CLK_B;
		end
	end
end


// CLK_C5
always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		cnt_CLK_C5 <= 17'b0;
		CLK_C5 <= 0;
	end
	else begin 
		//if (cnt_CLK_C5 == 17'b10_1110_1010_1110_010) begin  /* for synthesis */
		if (cnt_CLK_C5 == 17'b00_0000_0001_0000_000) begin /* for testbench */
			cnt_CLK_C5 <= 17'b0;
			CLK_C5 <= ~CLK_C5;
		end
		else begin
			cnt_CLK_C5 <= cnt_CLK_C5 + 1'b1;
			CLK_C5 <= CLK_C5;
		end
	end
end

// QUARTER_NOTE
always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		cnt_QUARTER <= 24'b0;
		QUARTER_BEAT <= 0;
	end
	else begin 
		//if (cnt_QUARTER == 24'b1110_1011_1100_0010_0000_0000) begin  /* for synthesis */
		if (cnt_QUARTER == 24'b0000_0000_0000_0000_0000_1000) begin /* for testbench */
			cnt_QUARTER <= 10'b0;
			QUARTER_BEAT <= ~QUARTER_BEAT;
		end
		else begin
			cnt_QUARTER <= cnt_QUARTER + 1'b1;
			QUARTER_BEAT <= QUARTER_BEAT;
		end
	end
end

endmodule
