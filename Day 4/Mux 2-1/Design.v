// 4:1 MUX 
module mux(s,a,f);
  input [3:0]a;
  input [1:0]s;
  output reg f;
  always @(s or a)
    begin 
      case(s)
        2'b00: f=a[0];
        2'b01: f=a[1];
        2'b10: f=a[2];
        2'b11: f=a[3];
        default: f=1'bx;
      endcase
    end
endmodule 