module clock_all (
	  clk, 
	  clock_1MHz,
	  clock_100kHz, 
	  clock_10kHz,
	  clock_1kHz,
	  clock_100Hz,
	  clock_10Hz,
	  clock_1Hz,
	  clock_01Hz,
	  clock_1s, 
	  clock_100ms,
	  clock_10ms, 
	  clock_1ms, 
	  clock_100us, 
	  clock_10us, 
	  clock_1us,
	  pulse_1s,
	  pulse_1ms,
	  pulse_1us
);

	parameter clock_frequency  = 50;  //MHz

	input	 	clk;
	output reg	clock_1MHz;
	output	clock_100kHz;
	output	clock_10kHz;
	output	clock_1kHz;
	output	clock_100Hz;
	output	clock_10Hz;
	output	clock_1Hz;
	output	clock_01Hz;
	output	clock_1s, clock_100ms, clock_10ms, clock_1ms, clock_100us, clock_10us, clock_1us;
	output	pulse_1s, pulse_1ms, pulse_1us;

	reg [5:0] count;
	
	assign clock_1s = clock_1Hz;
	assign clock_100ms = clock_10Hz;
	assign clock_10ms = clock_100Hz;
	assign clock_1ms = clock_1kHz;
	assign clock_100us = clock_10kHz;
	assign clock_10us = clock_100kHz;
	assign clock_1us = clock_1MHz;
	
	always @ (posedge clk)
	begin
		if (count==(clock_frequency/2-1))
		begin
			count <= 0;
			clock_1MHz <= ~clock_1MHz;
		end
		else
			count <= count + 1;
	end
	
	
	divider_10 clk1( .clk(clock_1MHz),  .clk_div10(clock_100kHz));
	divider_10 clk2( .clk(clock_100kHz),  .clk_div10(clock_10kHz));
	divider_10 clk3( .clk(clock_10kHz),  .clk_div10(clock_1kHz));
	divider_10 clk4( .clk(clock_1kHz),  .clk_div10(clock_100Hz));
	divider_10 clk5( .clk(clock_100Hz),  .clk_div10(clock_10Hz));
	divider_10 clk6( .clk(clock_10Hz),  .clk_div10(clock_1Hz));	
	divider_10 clk7( .clk(clock_1Hz),  .clk_div10(clock_01Hz));
	
endmodule

module divider_10
(
	input clk, 
	output reg clk_div10,
	output reg [3:0] count_10
);


	always @ (posedge clk)
	begin
		if (count_10==4)
			begin
				count_10 <= 0;
				clk_div10<=~clk_div10;
			end
		else
				count_10 <= count_10 + 1;
	end	
endmodule


