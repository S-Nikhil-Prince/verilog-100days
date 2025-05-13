module single_port_ram(clk,we,write_addr,read_addr,data,q,y);
    input clk;
    input we;
    input [6:0] write_addr;
    input [6:0] read_addr;
    input [7:0] data;
    output reg [7:0] q;
    output reg [7:0] y;
    reg [7:0] ram[127:0];
    always @(posedge clk) begin
        if (we)
            ram[write_addr] <= data;
            y <= ram[write_addr];
            q <= ram[read_addr];
    end
endmodule