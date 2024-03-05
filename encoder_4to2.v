`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2024 15:53:21
// Design Name: 
// Module Name: encoder_4to2
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
module encoder_4to2(
    input Y3, Y2, Y1, Y0,
    output reg A1, A0
);

always @(*) begin
    case ({Y3, Y2, Y1, Y0})
        4'b0001: begin
            A1 = 1'b0;
            A0 = 1'b0;
        end
        4'b0010: begin
            A1 = 1'b0;
            A0 = 1'b1;
        end
        4'b0100: begin
            A1 = 1'b1;
            A0 = 1'b0;
        end
        4'b1000: begin
            A1 = 1'b1;
            A0 = 1'b1;
        end
        default: begin
            A1 = 1'bx;
            A0 = 1'bx;
        end
    endcase
end

endmodule