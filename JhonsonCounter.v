`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2023 19:11:49
// Design Name: 
// Module Name: JhonsonCounter
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



module JohnsonCounter (
  input wire clk,
  input wire rst,
  output reg [3:0] q
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      q <= 4'b0001;  // Initialize to 0001 on reset
    end else begin
      q <= {q[2:0], q[3]};  // Shift right
    end
  end

endmodule

