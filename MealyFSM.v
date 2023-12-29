`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 09:00:39
// Design Name: 
// Module Name: MealyFSM
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



module MealyFSM (
  input wire clk,
  input wire reset,
  input wire in,
  output reg out
);
    reg [1:0] state, next_state;
    
    always @(posedge clk or posedge reset) begin
    if (reset)
      state <= 2'b00;
    else
      state <= next_state;
  end
    
    always @(posedge clk) begin
    case (state)
      2'b00: begin
        if (in)
          next_state = 2'b01;
        else
          next_state = 2'b00;
        out = 1'b0;  // Output for s0
      end

      2'b01: begin
        if (in)
          next_state = 2'b10;
        else
          next_state = 2'b01;
        out = 1'b1;  // Output for s1
      end

      2'b10: begin
        if (in)
          next_state = 2'b00;
        else
          next_state = 2'b10;
        out = 1'b1;  // Output for s2
      end
    endcase
  end

endmodule