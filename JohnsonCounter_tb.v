`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.12.2023 19:14:07
// Design Name: 
// Module Name: JohnsonCounter_tb
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




module JohnsonCounter_tb();
    reg clk;
    reg rst;
    wire [3:0] q;

        JohnsonCounter dut (
        .clk(clk),
        .rst(rst),
        .q(q)
       );
           always 
            begin
                #5 clk = ~clk;
            end
           initial 
            begin
                clk = 0;
                rst = 1;  // Reset initially
                #10 rst = 0;  // Release reset after 10 time units
            repeat (20) 
             begin
                    #10;  // Wait for 10 time units
             end

            $stop;  // Stop simulation
           end
    always @(posedge clk) begin
        $display("Time = %0t, q = %b", $time, q);
    end
endmodule
