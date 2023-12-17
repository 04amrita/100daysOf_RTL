`timescale 1ns / 1ps

module bcd_7seg_tb();
    parameter CLOCK_PERIOD = 10; // Time units for clock period
    parameter SIM_TIME = 100; // Simulation time
    reg [3:0] bcd;
    wire [6:0] seg;
    
    bcd_7seg dut (
        .bcd(bcd),
        .seg(seg)
    );
    reg clk = 0;
    always @((CLOCK_PERIOD)/2) clk = ~clk;
    
    initial begin
    bcd = 4'b0000;
        repeat (SIM_TIME) begin
            #CLOCK_PERIOD bcd = bcd + 1; // Increment bcd on each clock cycle
        end
        $finish;
     end
endmodule

