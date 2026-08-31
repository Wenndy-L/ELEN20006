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

    localparam S0 = 3'd0,
               S1 = 3'd1,
               S2 = 3'd2,
               S3 = 3'd3,
               S4 = 3'd4,
               S5 = 3'd5,
               S6 = 3'd6;

	//states
    reg [2:0] state = S0;
    reg [2:0] next_state;
	 
	//Flip-Flop / State Update (current state ← next state)
    always @(posedge clk)
        if (enable)
            state <= next_state;
				
	//Next-State Logic (calculate current state + current input)
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
	 
	//Output Logic (Moore FSM since output only depends on state)
    assign found = (state == S6);

endmodule
