module smart_parking_system (
    input wire clk, reset,
    input wire entry_sensor, exit_sensor,
    output reg entry_gate, exit_gate,
    output reg [4:0] available_spaces,
    output wire parking_full, parking_empty
);

    // Gate timer (reduced for simulation)
    parameter GATE_TIME = 25000;
    reg [15:0] timer;
    reg gate_active;
    
    assign parking_full = (available_spaces == 0);
    assign parking_empty = (available_spaces == 20);
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            available_spaces <= 2;  // Start with 2 spaces
            {entry_gate, exit_gate, gate_active} <= 0;
            timer <= 0;
        end
        else begin
            // Timer logic
            if (gate_active) begin
                if (timer > 0) timer <= timer - 1;
                else {entry_gate, exit_gate, gate_active} <= 0;
            end
            
            // Entry logic
            if (entry_sensor && !parking_full && !gate_active) begin
                entry_gate <= 1;
                gate_active <= 1;
                timer <= GATE_TIME;
                available_spaces <= available_spaces - 1;
            end
            
            // Exit logic  
            if (exit_sensor && !parking_empty && !gate_active) begin
                exit_gate <= 1;
                gate_active <= 1;
                timer <= GATE_TIME;
                available_spaces <= available_spaces + 1;
            end
        end
    end

endmodule