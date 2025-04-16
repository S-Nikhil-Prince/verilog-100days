//Testbench 8-1 Mux
module tb_mux;
reg [7:0]a;
reg [3:0]s;
wire y;
mux u1(.y(y),.s(s),.a(a));
initial begin
  $monitor("s=%0b,y=%0b",s,y);
  a=8'b10101010;
  s=3'b000;#10;
  s=3'b001;#10;
  s=3'b010;#10;
  s=3'b011;#10;
  s=3'b100;#10;
  s=3'b101;#10;
  s=3'b110;#10;
  s=3'b111;#10;
end
endmodule