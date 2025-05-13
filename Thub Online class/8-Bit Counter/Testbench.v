// Code your testbench here
// or browse Examples
module counter_tb;

  reg rst, clk;
  wire [7:0] count;

  counter u1 (.rst(rst), .count(count), .clk(clk));

  initial
    begin
      clk=0;
      forever #5 clk=~clk;
    end

  initial
    begin
      $monitor("rst=%b, count=%0d", rst, count);
      rst=0; #10;
      rst=1; #2560; // 2560/10 = 256 clock cycles
      $finish;
    end

endmodule