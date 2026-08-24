module DisplayDigit(input [9:0] SW, output reg [6:0] HEX0);

always @(*) begin
    if (SW[0] == 1'b1)
        HEX0 = 7'b100_0000;
    else if (SW[1] == 1'b1)
        HEX0 = 7'b111_1001;
    else if (SW[2] == 1'b1)
        HEX0 = 7'b010_0100;
    else if (SW[3] == 1'b1)
        HEX0 = 7'b011_0000;
    else if (SW[4] == 1'b1)
        HEX0 = 7'b001_1001;
    else if (SW[5] == 1'b1)
        HEX0 = 7'b001_0010;
    else if (SW[6] == 1'b1)
        HEX0 = 7'b000_0010;
    else if (SW[7] == 1'b1)
        HEX0 = 7'b111_1000;
    else if (SW[8] == 1'b1)
        HEX0 = 7'b000_0000;
    else if (SW[9] == 1'b1)
        HEX0 = 7'b001_0000;
    else
        HEX0 = 7'b111_1111;
end

endmodule
