`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 09:34:15
// Design Name: 
// Module Name: NonOverlap_Mealy_FSM_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module NonOverlap_Mealy_FSM_tb();
    
  reg clk, reset, in;
  wire out;

  // Instantiate the NonOverlap_MealyFsm module
  NonOverlap_MealyFsm dut (
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    // Repeat loop for clock generation with a period of 5 time units
    repeat (10) begin
      #5 clk = ~clk;
    end
  end

  // Initial stimulus
  initial begin
    reset = 1;
    in = 0;

    // Apply reset
    #10 reset = 0;

    // Test case 1 - No sequence
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 0;

    // Test case 2 - Sequence detected
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;

    // Test case 3 - No sequence
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 0;

    // Add more test cases as needed

    #10 $finish;  // Finish simulation
  end

endmodule

 
