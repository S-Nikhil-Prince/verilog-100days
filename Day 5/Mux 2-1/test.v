//test bench
module tb_mux;
  reg [1:0]a;
  reg s;
  wire y;
  mux u1(.y(y),.s(s),.a(a));
  initial begin
    $monitor("s=%0b,y=%0b",s,y);
    a=2'b10;
    s=0;#10;
    s=1;
  end
endmodule