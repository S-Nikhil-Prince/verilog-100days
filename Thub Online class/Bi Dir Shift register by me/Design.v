// Code your design here
module usr(
  input clr,clk,right_in,left_in,
  input cntrl,
  output reg [3:0]q
);
  always@(posedge clk)
    if(clr)begin
      q<=4'b0000;
    end
  else
    begin
      case(cntrl)
        1'b0: q<={right_in,q[3:1]};
        1'b1: q<={q[2:0],left_in};
        endcase
    end 
endmodule