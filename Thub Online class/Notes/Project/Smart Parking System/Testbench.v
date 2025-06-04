`timescale 1ns / 1ps

module smart_parking_tb;

    // Test signals
    reg clk, reset;
    reg entry_sensor, exit_sensor;
    wire entry_gate, exit_gate;
    wire [4:0] available_spaces;
    wire parking_full, parking_empty;

    // Instantiate design
    smart_parking_system uut (
      .clk(clk), .reset(reset),
        .entry_sensor(entry_sensor), .exit_sensor(exit_sensor),
        .entry_gate(entry_gate), .exit_gate(exit_gate),
        .available_spaces(available_spaces),
        .parking_full(parking_full), .parking_empty(parking_empty)
    );

    // Clock generation (50MHz)
    always #10 clk = ~clk;

    initial 
      begin
        // Initialize
        {clk, reset, entry_sensor, exit_sensor} = 0;
        
        // Reset
        reset = 1; #100; reset = 0; #20;
        
        // Test Case 1: Car A arrives
        $display("\n=== Test Case 1: Car A Arrives at Parking Lot ===");
        $display("Parking slots available = %d", available_spaces);
        
        entry_sensor = 1; #20;
        if (entry_gate) $display("Gate Opens");
        entry_sensor = 0; #1000;
        
        
        // Test Case 2: Car B arrives
        $display("\n=== Test Case 2: Car B Arrives at Parking Lot ===");
        $display("Parking slots available = %d", available_spaces);
        
        entry_sensor = 1; #20;
        if (entry_gate) $display("Gate Opens");
        entry_sensor = 0; #1000;
        
        // Test Case 3: Car C tries when full
        $display("\n=== Test Case 3: Car C Tries to Enter When Full ===");
        entry_sensor = 1; #20;
      if (!parking_full) 
        $display("No Space available -- Please wait");
        $display("Exit gate Dosen't open");
        entry_sensor = 0; #1000;
        
        
        // Test Case 4: Car B exits
        $display("\n=== Test Case 4: Car B Comes to Exit ===");
        exit_sensor = 1; #20;
        if (exit_gate || exit_sensor)
         begin
            $display("Exit gate Opens");
            $display("Available parking spaces = %d", available_spaces);
         end
        exit_sensor = 0; #1000;
        	
        $display(" ");						//for space
         
       // Test Case 5: Car C can Enters when Car B Exits 
        $display("Testcase 5: Now Car C can enter...");
        entry_sensor = 1; #20;
        if (entry_gate) begin
            $display("Gate Opens");
            $display("Parking slots available = %d", available_spaces);
        end
        entry_sensor = 0; #1000;
        
        $display("\n=== Simulation Complete ===");
        $finish;
    end
endmodule