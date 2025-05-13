// 2-1 demux Testbench code
module demux_tb;
reg i,s;
wire [1:0]y;
demux d1(i,s,y);
initial begin
    $monitor("i=%b s=%b y=%b",i,s,y);
    i=1'b1;
    s=1'b0; #10;
    s=1'b1; #10;
    $finish;
end
endmodule