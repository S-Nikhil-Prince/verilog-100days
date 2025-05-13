// Code your testbench here
// or browse Examples
module right_shift_tb;
  reg rst, clk, si;
  wire [3:0] q;
  right_shift_u1 (.q(q), .rst(rst), .clk(clk), .si(si));
  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end
  initial
    begin
      $monitor ("rst=%b,si=%b,q=%b", rst,si,q);
      rst=1'b1; #10;
      rst=1'b0; si=1'b1; #10;
      si=1'b1; #10;
      si=1'b0; #10;
      si=0; #10;
      $finish;
    end
endmodule