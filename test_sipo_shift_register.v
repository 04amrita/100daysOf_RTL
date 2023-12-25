`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 22:59:17
// Design Name: 
// Module Name: test_sipo_shift_register
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


module test_sipo_shift_register();
     reg clk;
     reg reset;
     reg serial_in;
     wire [3:0] parallel_out;
    
    sipo_shift_register dut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
  );
    
    initial 
        begin
            clk = 0;
            forever #5 clk = ~clk;
        end
    initial 
        begin
            reset = 1;
            serial_in = 0;
            #10 reset = 0;
            #10 serial_in = 1; #10 serial_in = 0;
            #10 serial_in = 1; #10 serial_in = 0;
            #10 serial_in = 1; #10 serial_in = 1;
            #10 serial_in = 0; #10 serial_in = 0;
            #10 $finish;
       end
endmodule

