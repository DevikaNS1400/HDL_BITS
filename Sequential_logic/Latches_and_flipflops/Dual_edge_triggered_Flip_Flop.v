module top_module (
    input clk,
    input d,
    output q
);
 reg m,n;
    always@(posedge clk)
        m<=n^d;
    always@(negedge clk)
        n<=m^d;
 assign q=m^n;
endmodule
