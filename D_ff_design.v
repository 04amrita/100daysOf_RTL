`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2023 12:46:19
// Design Name: 
// Module Name: D_ff_design
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


module D_ff_negedge(D,Clock,Q,Qbar);
    input D,Clock;
    output reg Q,Qbar;
    
    always @(negedge Clock)
        begin
            Q=D;
            Qbar=~D;
        end
        
endmodule
