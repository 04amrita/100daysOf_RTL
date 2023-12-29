`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 09:03:33
// Design Name: 
// Module Name: MealyFSM_tb
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



module MealyFSM_tb();
  reg clk, reset, in;
  wire out;
    
    MealyFSM dut (
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out)
  );
    
    always #5 clk = ~clk;
    
    initial begin
    clk = 0;
    reset = 1;
    in = 0;

    // Apply reset
    #10 reset = 0;

    // Test case 1
    #10 in = 1;
    #10 in = 0;

    // Test case 2
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;

    // Test case 3
    #10 in = 1;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;

    // Add more test cases as needed

    #10 $finish;  // Finish simulation
  end

endmodule
