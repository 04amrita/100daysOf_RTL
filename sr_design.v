`timescale 1ns / 1ps
module sr_design(Q,Qbar,S,R);
    input S;
    input R;
    output Q;
    output Qbar;
    
    assign Q = ~(R&Qbar);
    assign Qbar = ~(S & Q);
    
endmodule
