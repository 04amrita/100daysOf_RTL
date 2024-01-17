`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2024 15:49:35
// Design Name: 
// Module Name: regfile_test
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



module regfile_test();
    reg [4:0] sr1, sr2, dr;
    reg[31:0] wrData;
    reg write, reset, clk;
    wire [31:0] rdData1, rdData2;
    integer k;
regbank_v4 REG (rdData1, rdData2, wrData, sr1, sr2, dr, write, reset, clk);
    initial clk = 0;
    always #5 clk = !clk;
        initial
            begin
            $dumpfile ("regfile.vcd"); $dumpvars (0, regfile_test);
            #1 reset = 1; write = 0;
            #5 reset = 0;
            end
        initial
            begin
            #7
            for (k=0; k<32; k=k+1)
            begin
            dr = k; wrData = 10* k; write = 1;
            #10 write = 0;
            end
            #20
            for (k=0; k<32; k=k+2)
            begin
            sr1 = k; sr2 = k+1;
            #5;
            $display ("reg[%2d] = %d, reg[%2d] = %d", sr1, rdData1, sr2, rdData2);
            end
            #2000 
            $finish;
         end
endmodule
