// Code your testbench here
// or browse Examples
module srff_tb ;
  reg clk,rst,s,r ;
  wire q,qb ;
  srff u1(.q(q),.qb(qb),.s(s),.r(r),.clk ( clk),.rst(rst ) ) ;
  initial
    begin
      clk=0 ;
      forever #5 clk=~clk ;
    end
  initial
    begin
      $monitor("rst=%0b,clk=%0b,s=%0b,r=%0b,q=%0b",rst,clk,s,r,q ) ;
      rst=0;s=0;r=1;#10;
      rst=1;s=1;r=0;#10;
      rst=1;s=0;r=0;#10;
      rst=1;s=0;r=1;#10;
      rst=1;s=1;r=0;#10;
      rst=1;s=1;r=1;#10;
      $finish;
    end
endmodule