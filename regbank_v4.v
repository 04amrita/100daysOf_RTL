`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2024 22:25:46
// Design Name: 
// Module Name: regbank_v4
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



module regbank_v4 (rdData1, rdData2, wrData, sr1, sr2, dr, write, reset, clk);
    input clk, write, reset;
    input [4:0] sr1, sr2, dr;    // Source and destination registers
    input [31:0] wrData;
    output [31:0] rdData1, rdData2;
    integer k;
    reg [31:0] regfile[0:31];
assign rdData1 = regfile [sr1];
assign rdData2 = regfile [sr2];
    always @(posedge clk)
        begin
            if (reset) begin
            for (k=0; k<32; k=k+1) begin
            regfile[k] <= 0;
            end
        end
        else begin
            if (write)
            regfile[dr] <= wrData;
        end
end
endmodule