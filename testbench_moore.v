`timescale 1ns/1ns
module testbench;
  reg input_bit;
  wire output_detected;

  // Instantiate the MooreDetector module
  MooreDetector dut (
    .input_bit(input_bit),
    .output_detected(output_detected)
  );

  // Stimulus generation
  initial begin
    // Initialize inputs
    input_bit = 0;

    // Apply stimulus
    #5 input_bit = 1;
    #5 input_bit = 1;
    #5 input_bit = 0;
    #5 input_bit = 1;
    #5 input_bit = 0;
    #5 input_bit = 1;
    #5 input_bit = 0;
    #5 input_bit = 1;

    // Add additional simulation time for observation
    #10 $finish;
  end

  // Display output and state changes
  always @(posedge input_bit) begin
    $display("Time=%0t, Input=%b, Output Detected=%b, State=%b", $time, input_bit, output_detected, dut.state);
  end

endmodule

