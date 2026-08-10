module MyMux21(input A, input B, input S0, output reg Z);
	always @(*) begin
		case (S0)
			0: Z = A;
			1: Z = B;
			default: Z = A;
		endcase
	end
endmodule
