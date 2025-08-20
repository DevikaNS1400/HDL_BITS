module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    reg [15:0]q1;
    always@(posedge clk)begin
        if(!resetn)
            q1<=16'b0;
        else begin
            if(byteena==2'b10)
                q1[15:8]<=d[15:8];
            else if(byteena==2'b01)
                 q1[7:0]<=d[7:0];
            else if(byteena==2'b11)
                q1<=d;
        end
    end          
    assign q=q1;
endmodule
