`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2024 12:43:41
// Design Name: 
// Module Name: fifo_32x8
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
module fifo_32x8 (
    input wire clk,           // Clock input
    input wire rst,           // Reset input
    input wire wr_en,         // Write enable input
    input wire rd_en,         // Read enable input
    input wire [31:0] data_in, // Data input
    output reg [31:0] data_out, // Data output
    output reg empty,         // Empty flag
    output reg full           // Full flag
);

parameter DEPTH = 8;          // Depth of the FIFO

reg [31:0] mem [0:DEPTH-1];
reg [2:0] wr_ptr, rd_ptr;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        empty <= 1;
        full <= 0;
    end else begin
        if (wr_en && ~full) begin
            mem[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1;
            if (wr_ptr == DEPTH - 1)
                wr_ptr <= 0;
            if (wr_ptr == rd_ptr)
                full <= 1;
        end
        if (rd_en && ~empty) begin
            data_out <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            if (rd_ptr == DEPTH - 1)
                rd_ptr <= 0;
            if (rd_ptr == wr_ptr)
                empty <= 1;
        end
    end
end

endmodule
