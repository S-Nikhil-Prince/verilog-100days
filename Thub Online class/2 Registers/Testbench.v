module registers_tb;
  reg clk,rst,st;
  reg [7:0] d1,d2;
  wire [7:0] q1,q2;
  registers r1(.d1(d1),.d2(d2),.clk(clk),.rst(rst),.st(st),.q1(q1),.q2(q2));
  initial
    begin
      $monitor("rst=%0b,st=%0b,clk=%0b,d1=%b,d2=%b,q1=%b,q2=%b",rst,st,clk,d1,d2,q1,q2);
      rst=0;st=0;clk=0;d1=8'b10110101;d2=8'b10001101;#10;
      rst=0;st=0;clk=1;d1=8'b10110101;d2=8'b10001101;#10;
      rst=0;st=1;clk=0;d1=8'b10100001;d2=8'b11110000;#10;
      rst=0;st=1;clk=1;d1=8'b10100001;d2=8'b11110000;#10;
      rst=1;st=0;clk=0;d1=8'b10110101;d2=8'b10110101;#10;
      rst=1;st=0;clk=1;d1=8'b10110101;d2=8'b10110101;#10;
      rst=1;st=1;clk=1;d1=8'b10110101;d2=8'b10110101;#10;
      rst=1;st=1;clk=1;d1=8'b10110101;d2=8'b10110101;#10;
   end
endmodule