
// Code your testbench here
//2 bit comparato Test Bench
module tb;
reg [1:0] a;
reg [1:0] b;
wire g,e,1;
  comparator u1(.g(g), .e(e), .1(1), .a(a),.b(b));
initial
begin
     a=2'b00;b=2'b00;
#20; a=2'b01; b=2'b00;
#20; a=2'b00;b=2'b10;
end
initial
begin
$monitor("a=b,b=%b,g=%0b, e=%0b, 1=%0b", a,b,g,e,1);
end
endmodule
