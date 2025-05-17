//Design code
module mux(input [1:0]a,input s,output reg y);
  always@(s or a) begin
    case(s)
      1'b0: y=a[0];
      1'b1: y=a[1];
      default: y=1'bx;
    endcase
  end
endmodule
      
    