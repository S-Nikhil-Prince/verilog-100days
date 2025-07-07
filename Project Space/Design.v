module apb_slave_3reg (
    input         PCLK,
    input         PRESETn,
    input  [31:0] PADDR,
    input         PSEL,
    input         PENABLE,
    input         PWRITE,
    input  [31:0] PWDATA,
    output [31:0] PRDATA,
    output        PREADY,
    output        PSLVERR
);

    // 3 internal registers
    reg [31:0] slave_reg0;
    reg [31:0] slave_reg1;
    reg [31:0] slave_reg2;

    // Internal PREADY signal
    reg pready_int;
    always @(posedge PCLK or negedge PRESETn) begin
        if (!PRESETn)
            pready_int <= 1'b0;
        else if (PSEL && PENABLE)
            pready_int <= 1'b1;
        else
            pready_int <= 1'b0;
    end
    assign PREADY = pready_int;

    assign PSLVERR = 1'b0; // No error handling for simplicity

    // Write operation
    always @(posedge PCLK or negedge PRESETn) begin
        if (!PRESETn) begin
            slave_reg0 <= 32'h00000000;
            slave_reg1 <= 32'h00000000;
            slave_reg2 <= 32'h00000000;
        end else if (PSEL && PENABLE && PWRITE) begin
            case (PADDR)
                32'h00000000: slave_reg0 <= PWDATA;
                32'h00000004: slave_reg1 <= PWDATA;
                32'h00000008: slave_reg2 <= PWDATA;
                default: ; // Do nothing for unknown address
            endcase
        end
    end

    // Read operation
    reg [31:0] read_data;
    always @(*) begin
        case (PADDR)
            32'h00000000: read_data = slave_reg0;
            32'h00000004: read_data = slave_reg1;
            32'h00000008: read_data = slave_reg2;
            default:      read_data = 32'hDEADBEEF; // Indicate invalid address
        endcase
    end
    assign PRDATA = (PSEL && !PWRITE) ? read_data : 32'h0;
endmodule