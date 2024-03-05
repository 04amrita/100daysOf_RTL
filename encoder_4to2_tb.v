`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2024 15:58:28
// Design Name: 
// Module Name: encoder_4to2_tb
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




module encoder_4to2_tb();

// Inputs
reg Y3, Y2, Y1, Y0;

// Outputs
wire A1, A0;

// Instantiate the Unit Under Test (UUT)
encoder_4to2 uut (
    .Y3(Y3),
    .Y2(Y2),
    .Y1(Y1),
    .Y0(Y0),
    .A1(A1),
    .A0(A0)
);

initial begin
    // Initialize Inputs
    Y3 = 0;
    Y2 = 0;
    Y1 = 0;
    Y0 = 1;
    
    // Wait for some time
    #10;
    
    // Display output
    $display("Y3=%b Y2=%b Y1=%b Y0=%b A1=%b A0=%b", Y3, Y2, Y1, Y0, A1, A0);
    
    // Change Inputs
    Y3 = 0;
    Y2 = 0;
    Y1 = 1;
    Y0 = 0;
    
    // Wait for some time
    #10;
    
    // Display output
    $display("Y3=%b Y2=%b Y1=%b Y0=%b A1=%b A0=%b", Y3, Y2, Y1, Y0, A1, A0);
    
    // Repeat for other input combinations
    
    // End simulation
    $finish;
end

endmodule