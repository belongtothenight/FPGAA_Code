module SEG7_LUT_6 (	oSEG0,oSEG1,oSEG2,oSEG3,oSEG4,oSEG5,iDIG, iDot );

input	[31:0]	iDIG;
input	[5:0]		iDot;
output	[7:0]	oSEG0,oSEG1,oSEG2,oSEG3,oSEG4,oSEG5;

SEG7_LUT	u0	(	oSEG0,iDIG[3:0]	,iDot[0]);
SEG7_LUT	u1	(	oSEG1,iDIG[7:4]  	,iDot[1]);
SEG7_LUT	u2	(	oSEG2,iDIG[11:8] 	,iDot[2]);
SEG7_LUT	u3	(	oSEG3,iDIG[15:12]	,iDot[3]);
SEG7_LUT	u4	(	oSEG4,iDIG[19:16]	,iDot[4]);
SEG7_LUT	u5	(	oSEG5,iDIG[23:20]	,iDot[5]);

endmodule 

// digits 0~F
module SEG7_LUT	(	oSEG, iDIG, iDot);
input	[3:0]	iDIG;
input	iDot;
output reg	[7:0]	oSEG;

always @(iDIG or iDot)
begin
		case(iDIG)
		4'h0: oSEG = {~iDot, 7'b1000000};
		4'h1: oSEG = {~iDot, 7'b1111001};	// ---t----
		4'h2: oSEG = {~iDot, 7'b0100100}; 	// |	  |
		4'h3: oSEG = {~iDot, 7'b0110000}; 	// lt	 rt
		4'h4: oSEG = {~iDot, 7'b0011001}; 	// |	  |
		4'h5: oSEG = {~iDot, 7'b0010010}; 	// ---m----
		4'h6: oSEG = {~iDot, 7'b0000010}; 	// |	  |
		4'h7: oSEG = {~iDot, 7'b1111000}; 	// lb	 rb
		4'h8: oSEG = {~iDot, 7'b0000000}; 	// |	  |
		4'h9: oSEG = {~iDot, 7'b0011000}; 	// ---b----
		4'ha: oSEG = {~iDot, 7'b0001000};
		4'hb: oSEG = {~iDot, 7'b0000011};
		4'hc: oSEG = {~iDot, 7'b1000110};
		4'hd: oSEG = {~iDot, 7'b0100001};
		4'he: oSEG = {~iDot, 7'b1111111};	// all dark
		4'hf: oSEG = {~iDot, 7'b0111111};	// minus sign
		endcase
end
endmodule

