module memory_tb;
  reg clk;
  reg [1:0]inp;
  reg cntrl;
  wire [1:0]mem;
  wire [1:0]read;
  memory m1(.clk(clk), .inp(inp), .cntrl(cntrl), .mem(mem), .read(read));
  initial
    begin
      clk = 1'b0;
      forever #5 clk = ~clk;
    end
  initial 
    begin
      $monitor("Time=%0t Input=%b Control=%b memory=%b Read=%b", $time, inp, cntrl, mem, read);
    inp = 2'b00;cntrl = 1'b0;#10;
    inp = 2'b11;cntrl = 1'b0;#10;
    inp = 2'b00;cntrl = 1'b1;#10;
    inp = 2'b01;cntrl = 1'b0;#10;
    inp = 2'b10;cntrl = 1'b1;#10;
    #20 $finish;
  end
endmodule