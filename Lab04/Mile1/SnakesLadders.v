module SnakesLadders(
    input CLOCK_50,
    input [1:0] KEY,
    output [6:0] HEX0,
    output reg [9:0] LEDR
);

    wire heads, move;

    CoinToss ct(
        .clk(CLOCK_50),
        .toss(!KEY[0]),
        .heads(heads),
        .just_landed(move)
    );

    assign HEX0 = heads ? ~7'b000_0110 : ~7'b101_1011;

    wire up1 = move && heads;
    wire up2 = move && !heads;

    wire [3:0] pos;

    SnakesLaddersLogic sll(
        .clk(CLOCK_50),
        .reset(!KEY[1]),
        .up1(up1),
        .up2(up2),
        .pos(pos)
    );

    always @(*) begin
        LEDR = 10'b0;
        LEDR[pos] = 1'b1;
    end

endmodule


module SnakesLaddersLogic(
    input clk,
    input reset,
    input up1, up2,
    output reg [3:0] pos
);

    initial pos = 0;

    reg [3:0] next_pos;

    always @(posedge clk)
        pos <= next_pos;

    always @(*) begin

        next_pos = pos;

        if (reset)
            next_pos = 0;

        else begin

            if (up1)
                next_pos = pos + 1'd1;

            if (up2)
                next_pos = pos + 2'd2;

            next_pos = next_pos % 4'd10;

            if (next_pos == 3)
                next_pos = 5;

            if (next_pos == 6)
                next_pos = 1;

        end
    end

endmodule