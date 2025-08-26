module top_module (
    input clk,
    input a,
    output q );
    reg out;
    always@(posedge clk)begin
       out<=~a;
    end
assign q=out;
endmodule
