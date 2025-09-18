module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    wire w1,w2,w3;
    and g1(w1,x3,x1);
    not g2(w2,x3);
    and g3(w3,w2,x2);
    or g4(f,w1,w3);
endmodule
