// Twin Registers
module registers(clk,d1,d2,q1,q2,rst,st);
  input [7:0] d1,d2;
  input clk,rst,st;
  output reg [7:0] q1,q2;
  always@(posedge clk or posedge rst or posedge st)
    if(rst)
      begin
      q1<=8'b00000000;
      q2<=8'b00000000;
      end
  	else if(st)
      begin
      q1<=8'b11111111;
      q2<=8'b11111111;
      end
    else if(clk)
      begin
      q1<=d1;
  	  q2<=d2;
      end
endmodule