// Code your testbench here
// or browse Examples
module usr_tb;
  reg clr,clk,right_in,left_in;
  reg cntrl;
  wire [3:0]q;
  usr u1(.q(q),.right_in(right_in),.left_in(left_in),.clk(clk),.clr(clr),.cntrl(cntrl));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    $monitor("clk=%0b,clr=%0b,cntrl=%b,right_in=%b,left_in=%b,q=%b",clk,clr,cntrl,right_in,left_in,q);
		clr=1;cntrl=0;right_in=1;#10;
    	clr=0;cntrl=0;right_in=1;#10;
    	clr=0;cntrl=1;left_in=1;#10;
    $finish;
  end
endmodule