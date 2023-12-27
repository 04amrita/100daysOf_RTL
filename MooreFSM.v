`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 22:33:14
// Design Name: 
// Module Name: MooreFSM
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




module MooreFSM (
  input wire clk,
  input wire rst,
  output reg [1:0] state_out,
  output reg out
);

  // Parameter for state encoding
  parameter [1:0] S0 = 2'b00;
  parameter [1:0] S1 = 2'b01;
  parameter [1:0] S2 = 2'b10;
  parameter [1:0] S3 = 2'b11;

  // State and output registers
  reg [1:0] state_reg;
  reg out_reg;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state_out <= S0;
            out <= 1'b0;
        end else begin
            case (state_reg)
            S0: begin
            state_out <= S1;
            out <= 1'b0;
            end
            S1: begin
            state_out <= S2;
            out <= 1'b1;
        end
            S2: begin
            state_out <= S3;
            out <= 1'b0;
        end
            S3: begin
            state_out <= S0;
            out <= 1'b1;
        end
            default: state_out <= S0;
        endcase
        end
      end
endmodule
