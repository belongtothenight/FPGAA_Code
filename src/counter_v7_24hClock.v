
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module counter_v7_24hClock(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// SW //////////
	input 		     [9:0]		SW

);

//=======================================================
//  REG/WIRE declarations
//=======================================================

wire [5:0] count_second, count_minute;
wire [4:0] count_hour;
wire [3:0] hour_ten, hour_one, minute_ten, minute_one, second_ten, second_one;

reg [3:0] digit0, digit1, digit2, digit3, digit4, digit5;

//=======================================================
//  Structural coding
//=======================================================

assign hour_ten = count_hour/10;
assign hour_one = count_hour%10;
assign minute_ten = count_minute/10;
assign minute_one = count_minute%10;
assign second_ten = count_second/10;
assign second_one = count_second%10;

always @ (posedge MAX10_CLK1_50 or negedge SW[9])
begin
    if (!SW[9])
    begin
        digit0 <= 4'hf;
        digit1 <= 4'hf;
        digit2 <= 4'hf;
        digit3 <= 4'hf;
        digit4 <= 4'hf;
        digit5 <= 4'hf;
    end
    else
    begin
        digit0 <= second_one;
        digit1 <= second_ten;
        digit2 <= minute_one;
        digit3 <= minute_ten;
        digit4 <= hour_one;
        digit5 <= hour_ten;
    end
end

counter_v7 u_24hClock(
    .clk(MAX10_CLK1_50),
    .rst(SW[9]),
    .count_60_1(count_second),
    .count_60_2(count_minute),
    .count_24(count_hour)
);

SEG7_LUT_6 u_seg(
	.oSEG0(HEX0),
	.oSEG1(HEX1),
	.oSEG2(HEX2),
	.oSEG3(HEX3),
	.oSEG4(HEX4),
	.oSEG5(HEX5),
	.iDIG ({ digit5, digit4, digit3, digit2, digit1, digit0})
);

endmodule
