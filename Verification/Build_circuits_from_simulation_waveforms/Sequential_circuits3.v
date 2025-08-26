module top_module (
    input clk,
    input a,
    output [3:0] q );
    reg [3:0]c;
    always@(posedge clk)begin
        if(!a)begin
            if(c<6)
            c<=c+1;
            else
            c<=4'b0;
        end
        else
            c<=4'b0100;
    end
assign q=c;
endmodule
