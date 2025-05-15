// Code your design here
module fa(
  input a,b,c,
  output sum,carry
);
  assign sum=a^b^c;
  assign carry=(((a^b)&c)|(a&b));
endmodule