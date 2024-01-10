`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2024 15:39:53
// Design Name: 
// Module Name: seq_detector
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



// Sequence detector for pattern "0110" 
module  seq_detector  (x, clk, reset, z); 
  input  x, clk, reset; 
  output reg z;  
  parameter  S0=0, S1=1, S2=2, S3=3; 
  reg [0:1] PS, NS; 
  always  @(posedge clk or posedge reset) 
    if (reset)  PS <= S0; 
    else        PS <= NS; 
  always @(PS,x) 
      case (PS) 
        S0: begin 
              z = x ? 0 : 0; 
              NS = x ? S0 : S1;  
            end 
        S1: begin 
           z = x ? 0 : 0; 
           NS = x ? S2 : S1;  
            end 
        S2: begin 
           z = x ? 0 : 0; 
           NS = x ? S3 : S1;  
            end 
        S3: begin 
           z = x ? 0 : 1; 
           NS = x ? S0 : S1;  
            end 
     endcase 
endmodule 