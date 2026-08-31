module CoinToss(
    input clk,
    input toss,
    output heads,
    output just_landed
);

    Toggle tgl(
        .clk(clk),
        .in(toss),
        .out(heads)
    );

    CoinState cs(
        .clk(clk),
        .toss(toss),
        .just_landed(just_landed)
    );

endmodule