`timescale 1ns / 1ps

module ClockManager(    // Clock manager that outputs all clock signals.
	input CLK,
	input RESET,
	output reg CLK_A     // 440Hz clock for A
	);

reg [17:0] cnt_CLK_A;

// CLK_A
always @ (posedge CLK or posedge RESET) begin
	if (RESET) begin
		cnt_CLK_A <= 18'b0;
		CLK_A <= 0;
	end
	else begin 
		if (cnt_CLK_A == 18'b110111011111001001) begin
			cnt_CLK_A <= 18'b0;
			CLK_A <= ~CLK_A;
		end
		else begin
			cnt_CLK_A <= cnt_CLK_A + 1'b1;
			CLK_A <= CLK_A;
		end
	end
end

endmodule