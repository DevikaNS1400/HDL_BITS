module top_module (
    input clk,
    input in, 
    output out);
reg q1;
wire w;
assign w=q1^in;   
    always@(posedge clk)
        q1<=w;
assign out=q1;
endmodule
