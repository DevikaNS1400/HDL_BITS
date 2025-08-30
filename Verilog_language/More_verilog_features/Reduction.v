module top_module (
    input [7:0] in,
    output parity); 
wire w1,w2,w3,w4,w5,w6;
    xor g1(w1,in[0],in[1]);
    xor g2(w2,in[2],in[3]);
    xor g3(w3,in[4],in[5]);
    xor g4(w4,in[6],in[7]);
    xor g5(w5,w1,w2);
    xor g6(w6,w3,w4);
    xor g7(parity,w6,w5);
endmodule
