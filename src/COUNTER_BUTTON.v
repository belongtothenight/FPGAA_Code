// ====== INFO
/*
This version of button increases number in reg whenever it is detected as the right condition (pressed, switched)
It results in increasing a lot of value on every move, since the internal clk is a lot faster than human reaction.
*/

module COUNTER_BUTTON(
	input            rst,
	input      [1:0] SW,
	input      [1:0] KEY,
	output reg [6:0] count_KEY,
	output reg [6:0] count_SW
);

always @ (KEY or SW or rst)
begin
	if (rst)
	begin
		count_KEY <= 0;
		count_SW <= 0;
	end
	else if (!KEY[0])
	begin
		count_KEY <= count_KEY+1;
	end
	else if (!KEY[1])
	begin
		count_KEY <= count_KEY-1;
	end
	else if (SW[0])
	begin
		count_SW <= count_SW+1;
	end
	else if (SW[1])
	begin
		count_SW <= count_SW-1;
	end
end
			

endmodule
