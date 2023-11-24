`timescale 1ns / 1ps

module halfadd_dataflow_tb();
    reg inputA , inputB;
    wire sum , carry;
    
    halfadd_dataflow dut(inputA , inputB,sum,carry);
    initial
        begin
            inputA = 0;
            inputB = 0;
            #100
            
            #100
            inputA = 0;
            inputB = 1;
            #100
            inputA = 1;
            inputB = 0;
            #100
            inputA = 1;
            inputB = 1;
            #100
            inputA = 0;
            inputB = 0;
         end
     
endmodule
