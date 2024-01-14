`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 09:52:43
// Design Name: 
// Module Name: tb_ram_1
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
module RAM_RDWR_TB();

  reg [9:0] addr_tb;


  reg [7:0] data_tb;
  reg clk_tb, rd_tb, wr_tb, cs_tb;
  wire [7:0] d_out_tb;

  // Instantiate the ram_1 module
  RAM_RDWR uut (
    .addr(addr_tb),
    .data_in(data_tb),
.data_out(d_out_tb),
    .clk(clk_tb),
    .rd(rd_tb),
    .wr(wr_tb),
    .cs(cs_tb));

  // Clock generation
  always #5 clk_tb = ~clk_tb;

  // Initial stimulus
  initial 
begin
    clk_tb = 0;
    rd_tb = 0;
    wr_tb = 0;
    cs_tb = 0; end
always
     begin

    // Write to memory at address 5
   #1 addr_tb = 5;
    data_tb = 8'h43;
    wr_tb = 1;
    cs_tb = 1;
    

    // Read from memory at address 5
    #10 addr_tb = 5;
     rd_tb = 1;
     cs_tb=1;
      wr_tb = 0;
    

    // Additional test cases can be added here

     #200 $finish;
  end
endmodule

