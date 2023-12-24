`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 20:36:12
// Design Name: 
// Module Name: testbench
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



module testbench();
  reg clk, rst, serial_in;
  wire serial_out;
siso_shift_register dut ( 
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .serial_out(serial_out)
  );                            // Instantiate the SISO Shift Register
  
    initial 
        begin
            clk = 0;
            forever #5 clk = ~clk;
        end
    initial 
        begin
             rst = 1;
            serial_in = 0;
            #10 rst = 0;
            
            #5 serial_in = 1;
            #5 serial_in = 0;
            #5 serial_in = 1;
            #5 serial_in = 0;
            
            #50 $finish;
  end
endmodule
