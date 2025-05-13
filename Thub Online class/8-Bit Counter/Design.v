module counter(
    input rst, clk,
    output reg [7:0] count); // (0-255)

  always @(posedge clk or negedge rst)
    if (!rst)
      count <= 8'd0;
    else
      count <= count + 1;

endmodule