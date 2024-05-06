`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2024 12:45:23
// Design Name: 
// Module Name: fifo_32x8_tb
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
module fifo_32x8_tb();

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [31:0] data_in;
wire [31:0] data_out;
wire empty;
wire full;

fifo_32x8 dut (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .empty(empty),
    .full(full)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 32'd0;
    #10 rst = 0;

    // Test writing data to FIFO
    wr_en = 1;
    data_in = 32'd5;
    #10;
    data_in = 32'd10;
    #10;
    data_in = 32'd15;
    #10;
    wr_en = 0;

    // Test reading data from FIFO
    rd_en = 1;
    #10;
    rd_en = 0;
    #10;
    rd_en = 1;
    #10;
    rd_en = 0;
    #10;
    rd_en = 1;
    #10;
    rd_en = 0;
    #10;
    $finish;
end

endmodule
