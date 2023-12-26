`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2023 20:54:37
// Design Name: 
// Module Name: Tb_PISO
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


module Tb_PISO();
    reg clk;
    reg rst;
    reg [3:0] parallel_in;
    wire serial_out;
    
    PISO_Design dut (
    .clk(clk),
    .rst(rst),
    .parallel_in(parallel_in),
    .serial_out(serial_out)
  );
    
    initial begin
    clk = 0;
    forever #5 clk = ~clk;  
  end
    
    initial begin
    rst = 1;  
    parallel_in = 4'b1010; 
    #10 rst = 0;
    #10 parallel_in = 4'b1101;
    #10 parallel_in = 4'b0011;
    #10 parallel_in = 4'b1111;
    #100 $stop; 
  end
    
    always @(posedge clk) begin
    $display("Time=%t, Parallel Input=%b, Serial Output=%b", $time, parallel_in, serial_out);
  end
endmodule

