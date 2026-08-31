module PatternDetector3(
    input CLOCK_50,
    input [0:0] SW,
    input [0:0] KEY,
    output [0:0] LEDR
);

    wire enable;

    RisingEdgeDetector red(
        .clk(CLOCK_50),
        .in(!KEY[0]),
        .out(enable)
    );

    Detect110011 det(
        .clk(CLOCK_50),
        .enable(enable),
        .in(SW[0]),
        .found(LEDR[0])
    );

endmodule


module Detect110011(
    input clk,
    input enable,
    input in,
    output found
);

    wire [5:0] state;

    SR6 sr(
        .clk(clk),
        .enable(enable),
        .in(in),
        .out(state)
    );

    assign found = (state == 6'b110011);

endmodule


module SR6(
    input clk,
    input enable,
    input in,
    output reg [5:0] out
);

    initial out = 6'b000000;

    always @(posedge clk)
        if (enable)
            out <= {out[4:0], in};

endmodule


module RisingEdgeDetector(
    input clk,
    input in,
    output out
);

    reg prev = 0;

    always @(posedge clk)
        prev <= in;

    assign out = (in && !prev);

endmodule
