`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2023 13:14:20
// Design Name: 
// Module Name: ring_counter_tb
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


module ring_counter_tb();
  reg clk;
  reg init;
  wire [7:0] count;
  ring_counter dut (
    .clk(clk),
    .init(init),
    .count(count)
  );
    initial 
        begin
            clk = 0;
            forever #5 clk = ~clk;
        end
    initial 
        begin
            init = 1;
            #10 init = 0;
            #50 $finish; 
        end
    always @(posedge clk) begin
    $display("count = %b", count);
  end
endmodule

