//8:3 encoder test bench
module tb;
  reg [7:0]d;
  wire[2:0]y;
  encoder u1(.y(y),.d(d));
  initial
    begin
      $monitor("d=%0b,y=%0b",d,y);
      d=8'b00000001;
   #10d=8'b00000010;
   #10d=8'b00000100;
   #10d=8'b00001000;
   #10d=8'b00010000;
   #10d=8'b00100000;
   #10d=8'b01000000;
   #10d=8'b10000000;
    end
endmodule
