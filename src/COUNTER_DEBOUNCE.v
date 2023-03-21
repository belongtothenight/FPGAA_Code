// ===== INFO
/*
This version of counter increase the value only 1 every time a button is pressed, or switched...
It is achieved with storing each of key and switch movements in reg, which can be compared with the current value. (since value in reg is always be exactly 1 clock cycle slower than current value).
Now, if it discover the value is different between reg and current value, then it is going to do the corresponding reaction based on the code.
*/

module COUNTER_DEBOUNCE(
	input            clk,
	input            rst,
	input      [1:0] SW,
	input      [1:0] KEY,
	output reg [6:0] count_KEY,
	output reg [6:0] count_SW
);

reg key1_delay, key0_delay;
reg sw1_delay, sw0_delay;

always @ (posedge clk)
begin
	if (rst)
	begin
		count_KEY <= 0;
		count_SW  <= 0;
	end
	// This section compare current value with previously stored value in reg
	else if (key0_delay && !KEY[0]) //press enable
	begin
		count_KEY <= count_KEY+1;
	end
	else if (!key1_delay && KEY[1]) //release enable
	begin
		count_KEY <= count_KEY-1;
	end
	else if (!sw0_delay && SW[0])   //switch-up enable
	begin
		count_SW <= count_SW+1;
	end
	else if (sw1_delay && !SW[1])   //switch-down enable
	begin
		count_SW <= count_SW-1;
	end
	
	// This section stores current value in reg
	key1_delay <= KEY[1];
	key0_delay <= KEY[0];
	sw1_delay  <= SW[1];
	sw0_delay  <= SW[0];
end

endmodule
