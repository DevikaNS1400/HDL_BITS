module top_module (
    input in1,
    input in2,
    output out);
wire w;
    assign w=~in2;
    assign out=in1&w;
endmodule
