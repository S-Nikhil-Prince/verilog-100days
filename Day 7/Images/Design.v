//2:1 Demux Design code
module demux(input i,input s,output reg [1:0]y);
always@(s or i) begin
    case(s)
    1'b0: y[0]=i;
    1'b1: y[1]=i;
    default: y=2'bxx;
    endcase
    end
endmodule