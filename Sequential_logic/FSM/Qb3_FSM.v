module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter [2:0] s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
    reg [2:0]state,nx_state;
    
    always@(posedge clk)begin
        if(reset)
            state<=s0;
        else
            state<=nx_state;
    end
    
    always@(*)begin
        case(state)
            3'b000:nx_state=x?s1:s0;
            3'b001:nx_state=x?s4:s1;
            3'b010:nx_state=x?s1:s2;
            3'b011:nx_state=x?s2:s1;
            3'b100:nx_state=x?s4:s3;
            default:nx_state=s0;
        endcase
    end
    assign z=((state==s3)||(state==s4));
endmodule
