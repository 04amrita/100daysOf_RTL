`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 22:59:02
// Design Name: 
// Module Name: MooreFSM_tb
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



module MooreFSM_tb();
    
    parameter PERIOD = 10; 
    reg clk;
    reg rst;
    wire [1:0] state_out;
    wire out;
    
    MooreFSM dut (
    .clk(clk),
    .rst(rst),
    .state_out(state_out),
    .out(out)
  );
    
    always #((PERIOD / 2)) clk = ~clk;
        initial begin
             clk = 0;
             rst = 0;
            #10 rst = 1;
            #20;
            rst = 0;
            #100 $finish;
        end
        
        always @(posedge clk) begin
        $display("Time=%0t state=%b out=%b", $time, state_out, out);
  end
endmodule
