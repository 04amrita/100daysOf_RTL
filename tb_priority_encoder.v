`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2023 14:33:53
// Design Name: 
// Module Name: tb_priority_encoder
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




module tb_priority_encoder();
    parameter SIM_TIME = 50; // Simulation time
    reg [7:0] in_data;
    wire [2:0] code;
    
    priority_encoder dut (
    .in(in_data),
    .code(code)
  );
    initial 
        begin
            in_data = 8'b00000001;
            #10;
            in_data = 8'b00000100;
            #10;
            in_data = 8'b00100000;
            #10;
            in_data = 8'b10000000;
            #10;
            in_data = 8'b01010101;
            #10;
            // Add more test cases as needed...
            $finish;
         end
         
         always @(posedge code) 
            begin
                $display("Input: %b, Code: %b", in_data, code);
            end
endmodule
