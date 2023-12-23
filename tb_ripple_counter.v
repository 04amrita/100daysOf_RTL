`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2023 22:11:46
// Design Name: 
// Module Name: tb_ripple_counter
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



module tb_ripple_counter;
    reg clk, rst;
    wire [3:0] count;
ripple_counter dut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );
always #5 clk = ~clk;
    initial 
        begin
            clk = 0;
            rst = 0;
            #10 rst = 1;
            #10 rst = 0;
            $monitor("Time=%0t, Count=%b", $time, count);
            #50 
            $finish;
  end
endmodule
