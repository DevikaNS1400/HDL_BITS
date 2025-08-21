module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire c;
    wire [3:0]w;
    assign c=1'b0;
    fa u1(x[0],y[0],c,sum[0],w[0]);
    fa u2(x[1],y[1],w[0],sum[1],w[1]);
    fa u3(x[2],y[2],w[1],sum[2],w[2]);
    fa u4(x[3],y[3],w[2],sum[3],w[3]);
    assign sum[4]=w[3];
endmodule

module fa(
    input a,b,cin,
    output s,co);
    assign s=a^b^cin;
    assign co=(a&b)|(b&cin)|(cin&a);
endmodule
