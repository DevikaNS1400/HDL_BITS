module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0]counter;
    always@(posedge clk)begin
        if(load)begin
            counter<=data;
            tc<=(data==10'b0)?1'b1:1'b0;
        end
        else begin
            if(counter>10'd1)begin
               counter<=counter-1;
               tc<=1'b0;
        end
            else begin
                counter<=10'b0;
                tc<=1'b1;
            end
        end            
    end
           
endmodule
