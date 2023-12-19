`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2023 12:50:49
// Design Name: 
// Module Name: D_ff_tb
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


module D_ff_tb;
    parameter CLOCK_PERIOD = 10; // Clock period in time units
    parameter SIM_TIME     = 100; // Simulation time in time units

    reg D;
    reg Clock;
    wire Q, Qbar;

  
        D_ff_negedge dut (
            .D(D),
            .Clock(Clock),
            .Q(Q),
            .Qbar(Qbar)
        );

  // Clock generation
        initial 
            begin
                Clock = 0;
                #CLOCK_PERIOD;
            forever 
                begin
                    #CLOCK_PERIOD;
                    Clock = ~Clock;
                end
            end
   initial 
    begin
    D = 0;
    Clock = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    
    #SIM_TIME $finish;
  end

 
  always @(negedge Clock)
    $display("Time: %0t, D: %b, Q: %b, Qbar: %b", $time, D, Q, Qbar);

endmodule


