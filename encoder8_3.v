`timescale 1ns / 1ps
module encoder8_3(
    input [7:0] in_data,
    output reg [2:0] out_data
);

  always @*
     begin
        if (in_data == 8'b00000001)
            out_data = 3'b000; // Input bit 0
        else if (in_data == 8'b00000010)
            out_data = 3'b001; // Input bit 1
        else if (in_data == 8'b00000100)
            out_data = 3'b010; // Input bit 2
        else if (in_data == 8'b00001000)
            out_data = 3'b011; // Input bit 3
        else if (in_data == 8'b00010000)
            out_data = 3'b100; // Input bit 4
        else if (in_data == 8'b00100000)
            out_data = 3'b101; // Input bit 5
        else if (in_data == 8'b01000000)
            out_data = 3'b110; // Input bit 6
        else if (in_data == 8'b10000000)
            out_data = 3'b111; // Input bit 7
        else
            out_data = 3'b000; // Default case
  end

endmodule

