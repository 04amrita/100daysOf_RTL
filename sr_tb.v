`timescale 1ns / 1ps
module sr_tb();
    reg S,R;
    wire Q,Qbar;
    
    sr_design LAT(Q , Qbar , S , R);
        initial
            begin
                $monitor($time, "$=%b,R=%b,Q=%b,Qbar=%b",S,R,Q,Qbar);
                
                #5 S=1'b0; R=1'b1;
                #5 S=1'b1; R=1'b1;
                #5 S=1'b1; R=1'b0;
                #5 S=1'b1; R=1'b1;
                #5 S=1'b0; R=1'b0; //simulator hangs right after this step
                #5 S=1'b1; R=1'b1;
            end
endmodule
