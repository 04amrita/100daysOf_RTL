`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 09:43:38
// Design Name: 
// Module Name: ram_1
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



//asynchronous read and write operation
module RAM_RDWR(addr,data_in,data_out,clk,rd,wr,cs);
    input[7:0]data_in;
    output [7:0]data_out;
    input[9:0]addr; 
    input clk,rd,wr,cs;
    reg[7:0]mem[1023:0]; 
    reg [7:0]d_out;

assign data_out=(cs&&rd)?d_out:8'bz;

    always@(posedge clk)
        if(cs&&wr&&!rd) mem[addr]=data_in;
    always@(posedge clk)
        if(cs&&rd&&!wr)
    d_out=mem[addr];
endmodule


