`timescale 1ns / 1ps

module halfadd_dataflow(
    input inputA,
    input inputB,
    output sum,
    output carry
    );
    
    assign carry = inputA & inputB;
    assign sum = inputA ^ inputB;
endmodule
