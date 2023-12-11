`timescale 1ns / 1ps
module MooreDetector(input_bit, output_detected);
  input input_bit;
  output reg output_detected;
  reg [3:0] state;

  // Define state parameters
  parameter S0 = 4'b0000;
  parameter S1 = 4'b0001;
  parameter S2 = 4'b0010;
  parameter S3 = 4'b0011;
  parameter S4 = 4'b0100;

  // State transition and output logic
  always @(posedge input_bit) begin
    case(state)
      S0: begin
        state <= (input_bit == 1) ? S1 : S0;
        output_detected <= 0;
      end
      S1: begin
        state <= (input_bit == 1) ? S2 : S0;
        output_detected <= 0;
      end
      S2: begin
        state <= (input_bit == 1) ? S3 : S0;
        output_detected <= 0;
      end
      S3: begin
        state <= (input_bit == 1) ? S4 : S2;
        output_detected <= (input_bit == 0) ? 1 : 0;
      end
      S4: begin
        state <= (input_bit == 1) ? S1 : S0;
        output_detected <= 0;
      end
      default: begin
        state <= S0;
        output_detected <= 0;
      end
    endcase
  end

endmodule

