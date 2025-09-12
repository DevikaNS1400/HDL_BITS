module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    
    reg [3:0] shift_out;
    initial shift_out=4'b0;
    always@(posedge clk)begin
        if(shift_ena)
            shift_out<= {shift_out[2:0],data};
        else if(count_ena)
             shift_out<=shift_out-1'b1;
    end
    assign q=shift_out;
endmodule
