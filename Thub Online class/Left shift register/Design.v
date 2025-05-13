// Code your design here
module right_shift (rst, clk, si, q);
  input rst, clk, si;
  output reg [3:0] q;
  always @(posedge clk)
    if (rst)
      q <= 4'b0000;
    else
      q <= {si, q[3:1]};
endmodule