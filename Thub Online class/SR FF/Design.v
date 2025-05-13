// Code your design here
module srff(clk,rst,s,r,q,qb ) ;
  input clk,rst,s,r ;
  output reg q,qb ;
  always@(posedge clk )
    if ( ! rst ) begin
      q<=0;
      // qb<=-q ;
    end
  else
    begin
      case ( { s,r } )
        2'b00 : q<=q ;
        2'b01 : q<=0;
        2'b10 : q<=1;
        2'b11 : q<=1 ;
      endcase
    end
endmodule