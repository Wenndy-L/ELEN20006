module Toggle(
    input clk,
    input in,
    output out
);

    reg on = 0;
    wire next_on;

    // Flip-flop
    always @(posedge clk)
        on <= next_on;

    // Next-state logic
    assign next_on = in ? ~on : on;

    // Output logic
    assign out = on;

endmodule