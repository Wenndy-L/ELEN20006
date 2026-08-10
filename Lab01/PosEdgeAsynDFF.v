module PosEdgeAsynDFF (input D, input clk, input reset, output reg Q);
  always @(posedge clk or posedge reset) begin
    if (reset)
      Q <= 1'b0;
    else
      Q <= D;
  end
endmodule

module PosEdgeDFF (input D, input clk, output reg Q);
    always @(posedge clk) begin
      Q <= D;
  end
endmodule
