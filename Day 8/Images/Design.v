module demux_1_to_2(
    input s,
    input d,
    output reg y0,
    output reg y1
);
    always @(*) begin
        case(s)
            1'b0: begin
                y0 = d;
                y1 = 0;
            end
            1'b1: begin
                y0 = 0;
                y1 = d;
            end
        endcase
    end
endmodule
