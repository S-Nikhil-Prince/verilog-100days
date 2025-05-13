module single_port_ram_tb;
    reg clk;
    reg we;
    reg [6:0] write_addr;
    reg [6:0] read_addr;
    reg [7:0] data;
    wire [7:0] q;
    wire [7:0] y;

    single_port_ram uut (.clk(clk),.we(we),.write_addr(write_addr),.read_addr(read_addr),.data(data),.q(q),.y(y));;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    initial begin
      $monitor("we=%0b,write_addr=%0d,read_addr=%d,data=%0h,q=%0h,y=%0h,clk=%0b",we,write_addr,read_addr,data,q,y,clk);
        we=0;write_addr=7'd10;read_addr=7'd10;data=8'hab;
        #10;
        we=1;write_addr=7'd10;read_addr=7'd10;data=8'hab;   
        $finish;
        end
endmodule