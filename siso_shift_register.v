`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 20:35:40
// Design Name: 
// Module Name: siso_shift_register
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




module siso_shift_register (
  input wire clk,
  input wire rst,
  input wire serial_in,
  output wire serial_out
);
  reg [7:0] shift_register;

  always @(posedge clk or posedge rst) begin
    if (rst) 
        begin
        shift_register <= 8'b0;// Reset the shift register
        end 
    else 
        begin
        shift_register <= {shift_register[6:0], serial_in};// Shift the data in
        end
    end
    assign serial_out = shift_register[7];
endmodule
