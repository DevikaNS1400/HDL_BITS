module top_module (input x, input y, output z);
wire a,b,w1,w2;
    assign a=(x^y)&x;
    assign b=~(x^y);
    or g1(w1,a,b);
    and g2(w2,a,b);
    xor g3(z,w1,w2);
endmodule
