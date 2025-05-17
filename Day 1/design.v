module comparator(a,b,g,e,l);
  input[1:0]a,b;
  output reg g,e,l;
  always@a(a or b)
    begin
      if(a>b)
        begin
          g=1'b1;
          e=1'b0;
          l=1'b0;
        end
      else if(a<b)
        begin
          g=1'b1;
          e=1'b0;
          l=1'b0;
        end
      else
                begin
          g=1'b1;
          e=1'b0;
          l=1'b0;
        end
    end
endmodule

          
          
