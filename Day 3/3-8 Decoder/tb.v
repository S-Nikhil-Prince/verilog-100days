// 3 to 8 line decoder test bench 
module tb;
  reg[2:0]a;
  wire[7:0]y;
  integer i;
  decoder u1(.y(y),.a(a));
  initial 
    begin 
      $monitor("a=%d,y=%b",a,y);
      for (i=0;i<8;i=i+1)
        begin
          a=i;
          #10;
        end
    end
endmodule
         
