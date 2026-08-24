module Flash(input CLOCK_50, output [9:0] LEDR);
	reg [29:0] count = 30'd0; // Allowed on modern FPGAs
	
	assign LEDR = count[29:20];

	always @(posedge CLOCK_50)
		count <= count + 1'd1;
endmodule
