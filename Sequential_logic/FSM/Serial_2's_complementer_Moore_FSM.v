module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
   // reg out;
    parameter [1:0] A=2'b00,B=2'b01,C=2'b10;
    reg [1:0]state,next_state;
    always@(posedge clk or posedge areset)begin
        if(areset)
            state<=A;
        else
            state<=next_state;
    end
   
    always@(*)begin
        case(state)
            2'b00:next_state=x?B:A;
            2'b01:begin
                next_state=x?C:B;
            end
            2'b10:next_state=x?C:B;
            default:next_state=A;
        endcase
    end
    assign z=(state==B);
endmodule
