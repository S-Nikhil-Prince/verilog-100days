module mealyfsm
(
    input wire clk,
    input wire reset,
    input wire x,
    output reg y
);
    // State encoding
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;

    // State register
    reg [1:0]state, next_state;

    // Output logic
    always @(state or x) begin
        case (state)
            S0: 
            begin
                y = 0;
                if (x) next_state = S1;
                else next_state = S0;
            end
            S1: 
            begin
                y = 1;
                if (x) next_state = S2;
                else next_state = S0;
            end
            S2: 
            begin
                y = 0;
                if (x) next_state = S1;
                else next_state = S0;
            end
            default: 
            begin
                y = 0;
                next_state = S0;
            end
        endcase
    end

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0; // Reset to initial state
        else
            state <= next_state; // Update state on clock edge
    end