//4:1 MUX TB
module tb;
  reg[3:0]a;
  reg[1:0]s;
  wire f;
  mux u1(.f(f),.a(a),.s(s));
  initial
    begin
    a= 4'b1011;
           s=2'b00;
      #10; s=2'b01;
      #10; s=2'b10;
      #10; s=2'b11;
    end
  initial
    begin
      $monitor("s=%0b,f=%0b",s,f);
    end 
endmodule
