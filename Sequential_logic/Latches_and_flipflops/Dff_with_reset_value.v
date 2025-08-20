module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    reg [7:0]q1;
    always@(negedge clk)begin
        if(reset)
            q1<=8'b00110100;
        else 
            q1<=d;
    end
assign q=q1;            
endmodule
