`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2023 20:46:49
// Design Name: 
// Module Name: PISO_Design
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


module PISO_Design(
     input wire clk,       
     input wire rst,       
     input wire [3:0] parallel_in, 
     output wire serial_out  
);

  reg [3:0] shift_reg;   

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      shift_reg <= 4'b0000;  // Reset the shift register to all zeros
    end else begin
      // Shift the data in parallel_in into the shift register
      shift_reg <= {shift_reg[2:0], parallel_in};
    end
  end

  assign serial_out = shift_reg[3];  // Output the MSB as serial data

endmodule

