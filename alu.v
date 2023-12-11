`timescale 1ns / 1ps

module alu(X,Y,Z,sign,zero,carry,parity,overflow);
    input[15:0]X,Y;
    output[15:0]Z;
    output sign , zero , carry , parity , overflow;
    
    assign {carry , Z}= X+Y; //16bit add
    assign sign= Z[15];
    assign zero= ~|Z;
    assign parity= ~^Z;
    assign overflow= (X[15] & Y[15] & ~Z[15] | ~X[15] & ~Y[15] & ~Z[15]);
    
endmodule
