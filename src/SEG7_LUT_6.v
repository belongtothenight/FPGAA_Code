module SEG7_LUT_6 (	oSEG0,oSEG1,oSEG2,oSEG3,oSEG4,oSEG5,iDIG );

input	[31:0]	iDIG;
output	[7:0]	oSEG0,oSEG1,oSEG2,oSEG3,oSEG4,oSEG5;

SEG7_LUT	u0	(	oSEG0,iDIG[3:0]   );
SEG7_LUT	u1	(	oSEG1,iDIG[7:4]  	);
SEG7_LUT	u2	(	oSEG2,iDIG[11:8] 	);
SEG7_LUT	u3	(	oSEG3,iDIG[15:12]	);
SEG7_LUT	u4	(	oSEG4,iDIG[19:16]	);
SEG7_LUT	u5	(	oSEG5,iDIG[23:20]	);

endmodule 


module SEG7_LUT	(	oSEG, iDIG);
input	[3:0]	iDIG;
output reg	[7:0]	oSEG;

always @(iDIG)
begin
		case(iDIG)
		4'h0: oSEG = 8'b11000000;
		4'h1: oSEG = 8'b11111001;	// ---t----
		4'h2: oSEG = 8'b10100100; 	// |	  |
		4'h3: oSEG = 8'b10110000; 	// lt	 rt
		4'h4: oSEG = 8'b10011001; 	// |	  |
		4'h5: oSEG = 8'b10010010; 	// ---m----
		4'h6: oSEG = 8'b10000010; 	// |	  |
		4'h7: oSEG = 8'b11111000; 	// lb	 rb
		4'h8: oSEG = 8'b10000000; 	// |	  |
		4'h9: oSEG = 8'b10011000; 	// ---b----
		4'ha: oSEG = 8'b10001000;
		4'hb: oSEG = 8'b10000011;
		4'hc: oSEG = 8'b11000110;
		4'hd: oSEG = 8'b10100001;
		// 4'he: oSEG = 8'b10000110;
		// 4'hf: oSEG = 8'b10001110;
		4'he: oSEG = 8'b11111111;
		4'hf: oSEG = 8'b10111111;
		endcase
end

endmodule
