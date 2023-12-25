`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 22:43:22
// Design Name: 
// Module Name: sipo_shift_register
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



module sipo_shift_register (
  input wire clk,      
  input wire reset,     
  input wire serial_in, 
  output reg [3:0] parallel_out 
);
     reg [3:0] shift_register;
    always @(posedge clk or posedge reset) begin
    if (reset) 
        begin
            shift_register <= 4'b0000;
        end 
    else 
        begin
            shift_register <= {shift_register[2:0], serial_in};
        end
    end
   // Assign parallel output inside the always block
    always @(posedge clk or posedge reset) begin
    if (reset) 
        begin
            parallel_out <= 4'b0000;
        end 
    else 
        begin
            parallel_out <= shift_register;
        end
    end
 
endmodule
