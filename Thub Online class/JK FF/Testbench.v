// Code your testbench here
// or browse Examples
module jkff_tb ;
  reg clk,rst,j,k ;
  wire q,qb ;
  jkff u1(.q(q),.qb(qb),.j(j),.k(k),.clk ( clk),.rst(rst ) ) ;
  initial
    begin
      clk=0 ;
      forever #5 clk=~clk ;
    end
  initial
    begin
      $monitor("rst=%0b,clk=%0b,s=%0b,r=%0b,q=%0b",rst,clk,j,k,q ) ;
      rst=0;j=0;k=1;#10;
      rst=1;j=1;k=0;#10;
      rst=1;j=0;k=0;#10;
      rst=1;j=0;k=1;#10;
      rst=1;j=1;k=0;#10;
      rst=1;j=1;k=1;#10;
      $finish;
    end
endmodule