// Code your design here
module srff(clk,rst,j,k,q,qb ) ;
  input clk,rst,j,k ;
  output reg q,qb ;
  always@(posedge clk )
    if ( ! rst ) begin
      q<=0;
      qb<=-q ;
    end
  else
    begin
      case ( { s,r } )
        2'b00 : q<=q;
        2'b01 : q<=0;
        2'b10 : q<=1;
        2'b11 : q<=qb;
      endcase
    end
endmodule