module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    reg [511:0]d;
    //integer i;
    always@(posedge clk)begin
        if(load)
            d<=data;
        else
            d<={1'b0,d[511:1]}^{d[510:0],1'b0};
    end
    assign q=d;
endmodule
