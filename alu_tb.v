`timescale 1ns / 1ps

module alu_tb();
    reg[15:0] X,Y;
    wire[15:0]Z;
    wire S , ZR, CY , P , V;
    
    alu dut(X, Y , Z , S ,ZR , CY , P, V);
    
    initial 
        begin
            $dumpfile("alu.vcd");
            $dumpvars(0,alu_tb);
            $monitor($time,"X=%h , Y=%h,Z=%h,S=%b, ZR=%b, CY=%b,P=%b,V=%b", X,Y,Z,ZR, S,CY,P,V);
            
            #5 X=16'h8fff; Y=16'h8000;
            #5 X=16'hfffe; Y=16'h00002;
            #5 X=16'hAAAA; Y=16'h5555;
            
            $finish;
         end
endmodule
