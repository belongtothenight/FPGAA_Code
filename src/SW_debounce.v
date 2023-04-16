module SW_DEBOUNCE(
	input 		   clk,	// about 0.1s, 10Hz
	input		[9:0] iSW,
	output	reg	[9:0]	oSW_d
);

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg	[9:0] sw_delay;  // for edge detecting

//=======================================================
//  Structural coding
//=======================================================
	always @(posedge clk)
	begin
		oSW_d[9:0] <= sw_delay[9:0] & iSW[9:0];
		sw_delay[9:0] <= iSW[9:0];
	end 

endmodule
