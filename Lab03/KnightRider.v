module KnightRider(input CLOCK_50, output [9:0] LEDR);
  reg [25:0] count = 26'd0; // Allowed on modern FPGAs

  wire [9:0] ms; // Increments every millisecond, wraps every second
  assign ms = count / 50_000;

  assign LEDR[0] = (ms < 100);
  assign LEDR[1] = (100 <= ms) && (ms < 200);
  assign LEDR[2] = (200 <= ms) && (ms < 300);
  assign LEDR[3] = (300 <= ms) && (ms < 400);
  assign LEDR[4] = (400 <= ms) && (ms < 500);
  assign LEDR[5] = (500 <= ms) && (ms < 600);
  assign LEDR[6] = (600 <= ms) && (ms < 700);
  assign LEDR[7] = (700 <= ms) && (ms < 800);
  assign LEDR[8] = (800 <= ms) && (ms < 900);
  assign LEDR[9] = (900 <= ms);

  always @(posedge CLOCK_50)
    if (count < 26'd50_000_000)
      count <= count + 1'd1;
    else
      count <= 1'd0;
endmodule
