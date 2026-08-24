module DisplayDigitCasez(
    input [9:0] SW,
    output reg [6:0] HEX0
);

always @(*) begin
    casez (SW)
        10'b?????????1: HEX0 = 7'b100_0000; // SW0 -> 0
        10'b????????10: HEX0 = 7'b111_1001; // SW1 -> 1
        10'b???????100: HEX0 = 7'b010_0100; // SW2 -> 2
        10'b??????1000: HEX0 = 7'b011_0000; // SW3 -> 3
        10'b?????10000: HEX0 = 7'b001_1001; // SW4 -> 4
        10'b????100000: HEX0 = 7'b001_0010; // SW5 -> 5
        10'b???1000000: HEX0 = 7'b000_0010; // SW6 -> 6
        10'b??10000000: HEX0 = 7'b111_1000; // SW7 -> 7
        10'b?100000000: HEX0 = 7'b000_0000; // SW8 -> 8
        10'b1000000000: HEX0 = 7'b001_0000; // SW9 -> 9
        default:         HEX0 = 7'b111_1111; // all off
    endcase
end

endmodule
