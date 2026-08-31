module CoinState(
    input clk,
    input toss,
    output just_landed
);

    localparam G  = 2'b00,
               A  = 2'b01,
               JL = 2'b10;

    reg [1:0] state = G;
    reg [1:0] next_state;

    // Flip-flop
    always @(posedge clk)
        state <= next_state;

    // Next-state logic
    always @(*) begin
        case (state)

            A:
                next_state = toss ? A : JL;

            G:
                next_state = toss ? A : G;

            JL:
                next_state = toss ? A : G;

            default:
                next_state = G;

        endcase
    end

    // Moore output
    assign just_landed = (state == JL);

endmodule