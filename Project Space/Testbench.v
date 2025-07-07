module apb_testbench;

    parameter CLK_PERIOD = 10;

    // APB Master Signals
    reg         PCLK;
    reg         PRESETn;
    reg  [31:0] PADDR;
    reg         PSEL;
    reg         PENABLE;
    reg         PWRITE;
    reg  [31:0] PWDATA;

    // APB Slave Outputs
    wire [31:0] PRDATA;
    wire        PREADY;
    wire        PSLVERR;

    // Instantiate the 3-register APB Slave
    apb_slave_3reg UUT (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .PADDR(PADDR),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PREADY(PREADY),
        .PSLVERR(PSLVERR)
    );

    // Clock generation
    initial begin
        PCLK = 0;
        forever #(CLK_PERIOD/2) PCLK = ~PCLK;
    end

    // APB Write Task (with slave number display)
    task apb_write(input [31:0] addr, input [31:0] data);
        integer slave_id;
        begin
            // Identify slave based on address
            case (addr)
                32'h00000000: slave_id = 1;
                32'h00000004: slave_id = 2;
                32'h00000008: slave_id = 3;
                default:      slave_id = -1;
            endcase

            @(posedge PCLK);
            PADDR   = addr;
            PWDATA  = data;
            PWRITE  = 1;
            PSEL    = 1;
            PENABLE = 0;

            @(posedge PCLK);
            PENABLE = 1;

            @(posedge PCLK);
            PSEL    = 0;
            PENABLE = 0;
            PWRITE  = 0;

            $display("--------------------------------------------------");
            if (slave_id != -1) begin
                $display(" Writing into Slave %0d", slave_id);
                $display("Write: Addr = 0x%h, Data = 0x%h", addr, data);
            end else begin
                $display(" Writing to UNKNOWN Slave (Addr = 0x%h)", addr);
            end
            $display("--------------------------------------------------");
        end
    endtask

    // APB Read Task (with slave number display and mismatch check)
    task apb_read(input [31:0] addr, input [31:0] expected);
        integer slave_id;
        begin
            // Identify slave based on address
            case (addr)
                32'h00000000: slave_id = 1;
                32'h00000004: slave_id = 2;
                32'h00000008: slave_id = 3;
                default:      slave_id = -1;
            endcase

            $display("--------------------------------------------------");
            if (slave_id != -1)
                $display(" Reading from Slave %0d", slave_id);
            else
                $display(" Reading from UNKNOWN address (0x%h)", addr);

            @(posedge PCLK);
            PADDR   = addr;
            PWRITE  = 0;
            PWDATA  = 32'h0;
            PSEL    = 1;
            PENABLE = 0;

            @(posedge PCLK);
            PENABLE = 1;

            @(posedge PCLK);
            PSEL    = 0;
            PENABLE = 0;

            if (PRDATA === expected)
                $display(" Read Match: Addr = 0x%h, Data = 0x%h", addr, PRDATA);
            else
                $display(" Read MISMATCH: Addr = 0x%h, Got = 0x%h, Expected = 0x%h", addr, PRDATA, expected);

            $display("--------------------------------------------------");
        end
    endtask

    // Main Test Sequence
    initial begin
        // Initialize signals
        PSEL    = 0;
        PENABLE = 0;
        PWRITE  = 0;
        PADDR   = 0;
        PWDATA  = 0;

        $display(" Starting APB Testbench...");
        PRESETn = 0;
        #(CLK_PERIOD * 2);
        PRESETn = 1;
        #(CLK_PERIOD);

        //  Write to all 3 slave registers
        apb_write(32'h00000000, 32'h11112222); // Slave 1
        apb_write(32'h00000004, 32'h33334444); // Slave 2
        apb_write(32'h00000008, 32'h55556666); // Slave 3

        //  Correct readback from all 3 slaves
        apb_read(32'h00000000, 32'h11112222);
        apb_read(32'h00000004, 32'h33334444);
        apb_read(32'h00000008, 32'h55556666);

        //  Intentional mismatches
        apb_read(32'h00000000, 32'h22221111);  // Wrong expectation
        apb_read(32'h00000004, 32'h44443333);  // Wrong expectation
        apb_read(32'h00000008, 32'h66665555);  // Wrong expectation

        //  Invalid address read
        apb_read(32'h0000000C, 32'hDEADBEEF);  // Unknown register

        $display(" Testbench completed.");
        $finish;
    end

endmodule