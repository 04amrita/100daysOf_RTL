`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2024 15:43:15
// Design Name: 
// Module Name: test_sequence
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


module test_sequence();
    reg clk, x, reset;   wire z; 
    seq_detector SEQ (x, clk, reset, z); 
  initial 
    begin 
      $dumpfile ("sequence.vcd");  $dumpvars (0, test_sequence); 
      clk = 1'b0;  reset = 1'b1; 
      #15 reset = 1'b0; 
    end 
  always  #5 clk = ~clk; 
  initial 
    begin 
      #12 x = 0; #10 x = 0; #10 x = 1; #10 x = 1; 
      #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0; 
      #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0; 
      #10 $finish; 
    end 
endmodule 
