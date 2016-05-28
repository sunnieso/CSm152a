`timescale 1ns / 1ps

module debounce (
	input CLK,
	input RESET,
	input INPUT,				
	output reg D_OUT
	);
	
// size of registers for debouncing
//parameter D = 22;	/* for synthesis */
parameter D = 11;	/* for testbench */


reg FF1, FF2;			    // input for flip flops
reg [D-1:0] d_queue;		// debounce queue: stores values for sequence input
reg [D-1:0] next_d_queue;	// delay for syncronous purpose. next debounce queue

// Wire Declaration and Assignments

wire d_queue_RESET;		// reset signal: reset the queue if the two flip flop signals are not the same
assign d_queue_RESET = (FF1 ^ FF2);		

wire d_queue_cnt;		// add to counter when d_queue msb is equal to 0
assign d_queue_cnt = ~(d_queue[D-1]);		

// SYNCHRONOUS assign FF1 FF2 d_queue 
always @ ( posedge CLK ) begin
	if(RESET ==  1'b1) begin
		FF1 <= 1'b0;
		FF2 <= 1'b0;
		d_queue <= { D {1'b0} };
	end
	else begin
		FF1 <= INPUT;
		FF2 <= FF1;
		d_queue <= next_d_queue;
	end
end

// SYNCHRONOUS assign final output D_OUT
always @ ( posedge CLK ) begin
	if(d_queue[D-1] == 1'b1)			D_OUT <= FF2;
	else								D_OUT <= D_OUT;
end

// SYNCHRONOUS assign next_d_queue	
always @ ( d_queue_RESET, d_queue_cnt, d_queue) begin	
	if( ~d_queue_RESET & ~d_queue_cnt) begin
		next_d_queue <= d_queue;
	end 
	else if (~d_queue_RESET & d_queue_cnt) begin
		next_d_queue <= d_queue + 1'b1;
	end 
	else begin
		next_d_queue <= { D {1'b0} };
	end
end
	
endmodule