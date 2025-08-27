module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    reg [511:0]d;
    always@(posedge clk)begin
        if(load)
        d<=data;
        else
            d <=(~({1'd0,d[511:1]})&d[511:0])|(d[511:0]^({d[510:0],1'd0}));
    end
    assign q=d;
endmodule
