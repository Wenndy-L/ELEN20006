module SingleDigitCounter(
    input CLOCK_50,
    output [6:0] HEX0
);

reg [24:0] fast_cnt = 0;
reg [3:0] cnt = 0;

always @(posedge CLOCK_50)
    if (fast_cnt < 25'd25_000_000)
        fast_cnt <= fast_cnt + 1'd1;
    else begin
        fast_cnt <= 0;
        cnt <= (cnt < 9) ? cnt + 1'd1 : 1'd0;
    end

DisplayDigit dd(.digit(cnt), .SSEG(HEX0));

endmodule
