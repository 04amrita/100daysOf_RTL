`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 09:57:35
// Design Name: 
// Module Name: MealyFSM_NonOverlap
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



module NonOverlap_MealyFsm(
    input wire clk,
    input wire reset,
    input wire in,
    output reg out
);
    
    reg [1:0] state, next_state;

  // Defining outputs for each state
  always @(posedge clk or posedge reset) begin
    if (reset)
      state <= 2'b00;
    else
      state <= next_state;
  end

  // Defining next state logic and output logic
  always @(posedge clk) begin
    case (state)
      2'b00: begin
        if (in)
          next_state = 2'b01;
        else
          next_state = 2'b00;
        out = 1'b0;
      end

      2'b01: begin
        if (in)
          next_state = 2'b10;
        else
          next_state = 2'b00;
        out = 1'b0;
      end

      2'b10: begin
        if (in)
          next_state = 2'b11;
        else
          next_state = 2'b00;
        out = 1'b0;
      end

      2'b11: begin
        if (in)
          next_state = 2'b01;
        else
          next_state = 2'b00;
        out = 1'b1;  // Output "101" detected
      end
    endcase
  end

endmodule
