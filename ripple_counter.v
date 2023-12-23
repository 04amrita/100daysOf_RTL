`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2023 22:10:41
// Design Name: 
// Module Name: ripple_counter
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



module ripple_counter (
  input wire clk,
  input wire rst,
  output reg [3:0] count
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 4'b0000;
    end else begin
      count <= count + 1;
    end
  end

endmodule
