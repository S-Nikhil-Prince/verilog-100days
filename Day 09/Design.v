//1-8 demux design code
module demux(
  input in,
  input [2:0]sel,
  output reg o1,o2,o3,o4,o5,o6,o7,o8
);
  always@(*)
    begin
      o1=1'b0;o2=1'b0;o3=1'b0;o4=1'b0;o5=1'b0;o6=1'b0;o7=1'b0;o8=1'b0;
      case(sel)
        3'b000: o1=in;
        3'b001: o2=in;
        3'b010: o3=in;
        3'b011: o4=in;
        3'b100: o5=in;
        3'b101: o6=in;
        3'b110: o7=in;
        3'b111: o8=in;
        default: {o1,o2,o3,o4,o5,o6,o7,o8}=8'b00000000;
      endcase
    end
endmodule