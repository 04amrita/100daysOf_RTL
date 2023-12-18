`timescale 1ns / 1ps


module encoder8to3_tb();

    reg [7:0] in_data;
    wire [2:0] out_data;
        
        encoder8_3 dut (
            .in_data(in_data),
            .out_data(out_data)
        );
    reg clk;
    always #5 clk = ~clk;
        initial begin
            clk = 0;
            $monitor("Time=%t in_data=%b out_data=%b", $time, in_data, out_data);//This is a format specifier. %0t is used to print the current simulation time in the format "h:m:s" (hours:minutes:seconds). It's a way to display the simulation time in a human-readable format.
            in_data = 8'b00000001;
            #10;
            in_data = 8'b00100000;
            #10;
            $finish;
  end

endmodule
