module top_module (
    input clk,
    input reset,
    output [3:0] q);
    always@(posedge clk)begin
        if(reset)
            q<=3'b001;
        else if(q<10)
            q<=q+1;
        else
            q<=3'b001;
    end            
endmodule
