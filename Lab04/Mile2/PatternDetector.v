module PatternDetector(
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

    Detect110011 detector(
        .clk(CLOCK_50),
        .enable(enable),
        .in(SW[0]),
        .found(LEDR[0])
    );

endmodule


module RisingEdgeDetector(
    input clk,
    input in,
    output out
);

    reg prev = 0;
    wire next_prev;

    always @(posedge clk)
        prev <= next_prev;

    assign next_prev = in;
    assign out = (!prev && in);

endmodule


module Detect110011(
    input clk,
    input enable,
    input in,
    output found
);

    localparam S0 = 3'b000,
               S1 = 3'b001,
               S2 = 3'b010,
               S3 = 3'b011,
               S4 = 3'b100,
               S5 = 3'b101,
               S6 = 3'b110;

    reg [2:0] state = S0;
    reg [2:0] next_state;

    always @(posedge clk)
        if (enable)
            state <= next_state;

    always @(*) begin
        case (state)

            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S2 : S0;
            S2: next_state = in ? S2 : S3;
            S3: next_state = in ? S1 : S4;
            S4: next_state = in ? S5 : S0;
            S5: next_state = in ? S6 : S0;
            S6: next_state = in ? S2 : S3;

            default: next_state = S0;

        endcase
    end

    assign found = (state == S6);

endmodule
