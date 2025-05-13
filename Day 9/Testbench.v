//testbench 1-8
module testbench;
  reg in;
  reg [2:0]sel;
  wire o1,o2,o3,o4,o5,o6,o7,o8;
  demux u1(.in(in),.sel(sel),.o1(o1),.o2(o2),.o3(o3),.o4(o4),.o5(o5),.o6(o6),.o7(o7),.o8(o8));
  initial 
    begin
      $monitor("in=%0b,sel=%b,output=%0b%0b%0b%0b%0b%0b%0b%0b",in,sel,o1,o2,o3,o4,o5,o6,o7,o8);
      in=1'b1;sel=3'b000;#10;
      in=1'b1;sel=3'b001;#10;
      in=1'b1;sel=3'b010;#10;
      in=1'b1;sel=3'b011;#10;
      in=1'b1;sel=3'b100;#10;
      in=1'b1;sel=3'b101;#10;
      in=1'b1;sel=3'b110;#10;
      in=1'b1;sel=3'b111;#10;
    end
endmodule