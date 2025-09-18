module top_module ( input [1:0] A, input [1:0] B, output z ); 
wire w1,w2,w3;
    xnor g1(w1,A[1],B[1]);
    xnor g2(w2,A[0],B[0]);
    and (w3,w1,w2);
    assign z=w3;
endmodule
