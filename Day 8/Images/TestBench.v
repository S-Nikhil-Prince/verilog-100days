module demux_1_to_2_tb;
    reg s, d;
    wire y0, y1;

    demux_1_to_2 uut(.s(s), .d(d), .y0(y0), .y1(y1));

    initial begin
        $monitor("s=%b d=%b | y0=%b y1=%b", s, d, y0, y1);
        d = 0; s = 0;
        #10 d = 1; s = 0;
        #10 d = 1; s = 1;
        #10 d = 0; s = 1;
        #10 $finish;
    end
endmodule
