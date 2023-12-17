`timescale 1ns / 1ps
module bcd_7seg(bcd, seg);
    input [3:0] bcd;
    output reg [6:0] seg;

    always @(bcd)
        case (bcd)
            4'b0000: seg = 7'b0000001; // common anode type
            4'b0001: seg = 7'b1001111;
            4'b0010: seg = 7'b0010010;
            4'b0011: seg = 7'b0000110;
            4'b0100: seg = 7'b1001100;
            4'b0101: seg = 7'b0100100;
            4'b0110: seg = 7'b0100000;
            4'b0111: seg = 7'b0001111;
            4'b1000: seg = 7'b0000000;
            4'b1001: seg = 7'b0000101;
            default: seg = 7'b1111111;
        endcase
endmodule

