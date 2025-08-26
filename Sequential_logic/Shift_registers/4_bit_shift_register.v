module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    integer i;
    always@(posedge clk or posedge areset)begin
        if(areset)
            q<=4'b0;
        else if(load)
            q<=data;
        else if(ena)begin
            q[3]<=0;
            for(i=2;i>=0;i=i-1)begin
                  q[i]<=q[i+1];
                  end  
        end       
    end
endmodule
