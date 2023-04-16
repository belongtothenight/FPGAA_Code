module eclock(
	clk,
	rst,
	shot,
	shotClk,
	shotRst,
	hour_add,
	hour_sub,
	hour_tens, 
	hour_digits,
	min_add,
	min_sub,
	min_tens, 
	min_digits,
	sec_add,
	sec_sub,
	sec_tens,
	sec_digits
);

input	clk, rst, shot, shotClk, shotRst;
input hour_add, hour_sub, min_add, min_sub, sec_add, sec_sub;
output	[3:0] hour_tens, hour_digits;
output	[3:0] min_tens, min_digits;
output	[3:0] sec_tens, sec_digits;

reg	[5:0]	count_min, count_hour, count_sec;
reg [2:0]   count_shot;
reg         count_shotLED1, count_shotLED2, count_shotLED3, count_shotLED4, count_shotLED5, count_shotLED6;

// binary to decimal
assign hour_tens   = (count_shotLED6) ? 4'he : count_hour / 10;
assign hour_digits = (count_shotLED5) ? 4'he : count_hour % 10;
assign min_tens    = (count_shotLED4) ? 4'he : count_min / 10;
assign min_digits  = (count_shotLED3) ? 4'he : count_min % 10;
assign sec_tens    = (count_shotLED2) ? 4'he : count_sec / 10;
assign sec_digits  = (count_shotLED1) ? 4'he : count_sec % 10;

	always @ (posedge shot or negedge shotRst)
	begin
		if (!shotRst)
		begin
			count_shot <= 0;
		end
		else
		begin
			count_shot <= count_shot + 1;
		end
	end

	always @ (posedge shotClk or negedge shotRst)
	begin
		if (!shotRst)
		begin
			count_shotLED1 <= 0;
			count_shotLED2 <= 0;
			count_shotLED3 <= 0;
			count_shotLED4 <= 0;
			count_shotLED5 <= 0;
			count_shotLED6 <= 0;
		end
		else if (count_shot == 1)
		begin
			count_shotLED1 <= 1;
		end
		else if (count_shot == 2)
		begin
			count_shotLED2 <= 1;
		end
		else if (count_shot == 3)
		begin
			count_shotLED3 <= 1;
		end
		else if (count_shot == 4)
		begin
			count_shotLED4 <= 1;
		end
		else if (count_shot == 5)
		begin
			count_shotLED5 <= 1;
		end
		else if (count_shot == 6)
		begin
			count_shotLED6 <= 1;
		end
	end

	always @ (posedge clk or negedge rst)
	begin
		// reset
		if (!rst)
		begin
			count_hour  <= 0;
			count_min <= 0;
			count_sec <= 0;
		end
		// hour operation
		else if (hour_add)
		begin
			count_hour <= count_hour + 1;
		end
		else if (hour_sub )
		begin
			count_hour <= count_hour - 1;
		end
		// hour maximum
		else if (count_hour >= 23 && count_min >= 59 && count_sec >= 59 )
		begin
			count_min <= 0;
			count_hour <= 0;
			count_sec <= 0;
		end
		// minute operation
		else if (min_add)
		begin
			count_min <= count_min + 1;
		end
		else if (min_sub)
		begin
			count_min <= count_min - 1;
		end
		// minute maximum
		else if (count_min >= 59)
		begin
			count_min <= 0;
			count_hour <= count_hour + 1;
		end
		// second operation
		else if (sec_add)
		begin
			count_sec <= count_sec + 2;
		end
		else if (sec_sub)
		begin
			count_sec <= count_sec - 2;
		end
		// second maximum
		else if (count_sec >= 59)
		begin
			count_sec <= 0;
			count_min <= count_min + 1;
		end
		// normal operation
		else
			count_sec <= count_sec + 1;
	end 

endmodule 