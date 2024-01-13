`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2024 21:05:05
// Design Name: 
// Module Name: parity_gen
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



module parity_gen (x, clk, z); 
  input  x, clk;   output reg z;        
  reg  even_odd;      // The machine state 
  parameter  EVEN=0, ODD=1; 
  always @(posedge  clk) 
    case (even_odd) 
      EVEN: even_odd <= x ? ODD : EVEN; 
      ODD:  even_odd <= x ? EVEN : ODD; 
      default : even_odd <= EVEN; 
    endcase 
  always @(even_odd) 
    case (even_odd) 
      EVEN: z = 0; 
      ODD:  z = 1; 
    endcase 
endmodule 