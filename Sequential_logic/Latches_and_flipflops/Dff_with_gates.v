module top_module (
    input clk,
    input x,
    output z
); 
reg q1,q2,q3;
wire q2n,q3n;
wire w1,w2,w3;
assign w1=q1^x;
assign w2=q2n&x;
assign w3=q3n|x;
    always@(posedge clk)begin
    q1<=w1;
    q2=w2;
    q3=w3;
    end
assign q2n=~q2;
assign q3n=~q3;
assign z=~(q1|q2|q3);
endmodule
