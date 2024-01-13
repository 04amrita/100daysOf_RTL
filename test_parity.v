`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2024 21:06:46
// Design Name: 
// Module Name: test_parity
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



module test_parity(); 
  reg clk, x;   wire z; 
  parity_gen PAR (x, clk, z); 
  initial 
    begin 
      $dumpfile ("parity.vcd");  $dumpvars (0, test_parity); 
      clk = 1'b0; 
    end 
  always  #5 clk = ~clk; 
  initial 
    begin 
       #2 x = 0; #10 x = 1; #10 x = 1; #10 x = 1; 
      #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0; 
      #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0; 
      #10 $finish; 
    end 
endmodule 