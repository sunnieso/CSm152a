/* tempo=110 ==>
 * 	 quarter note : 545 ms ==> 	10'b10_0010_0001
 *	 one half note: 1091 ms ==> 11'b100_0100_0011					
 */
`timescale 1ns / 1ps

module Beat(
	input CLK,
	input RESET,
	output QUARTER_BEAT
	//output reg ONE_HALF_NOTE 
	);


	reg [9:0] cnt_QUARTER_BEAT;
	reg next_QUARTER_BEAT;
	assign QUARTER_BEAT = next_QUARTER_BEAT;
	//reg [10:0] cnt_ONE_HALF_NOTE;


	// QUARTER_NOTE
	always @ (posedge CLK or posedge RESET) begin
		if (RESET) begin
			cnt_QUARTER_BEAT <= 10'b0;
			next_QUARTER_BEAT <= 0;
		end
		else begin 
			//if (cnt_QUARTER_BEAT == 10'b10_0010_0001) begin  /* for synthesis */
			if (cnt_QUARTER_BEAT == 10'b00_0000_1000) begin /* for testbench */
				cnt_QUARTER_BEAT <= 10'b0;
				next_QUARTER_BEAT <= ~next_QUARTER_BEAT;
			end
			else begin
				cnt_QUARTER_BEAT <= cnt_QUARTER_BEAT + 1'b1;
				next_QUARTER_BEAT <= next_QUARTER_BEAT;
			end
		end
	end

/*
	// ONE_HALF_NOTE
	always @ (posedge CLK or posedge RESET) begin
		if (RESET) begin
			cnt_ONE_HALF_NOTE <= 11'b0;
			ONE_HALF_NOTE <= 0;
		end
		else begin 
			//if (cnt_ONE_HALF_NOTE == 11'b100_0100_0011) begin   for synthesis 
			if (cnt_ONE_HALF_NOTE == 11'b000_0001_0000) begin  for testbench 
				cnt_ONE_HALF_NOTE <= 11'b0;
				ONE_HALF_NOTE <= ~ONE_HALF_NOTE;
			end
			else begin
				cnt_ONE_HALF_NOTE <= cnt_ONE_HALF_NOTE + 1'b1;
				ONE_HALF_NOTE <= ONE_HALF_NOTE;
			end
		end
	end
*/
endmodule