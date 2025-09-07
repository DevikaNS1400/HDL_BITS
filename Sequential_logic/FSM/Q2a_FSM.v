module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
    parameter [2:0]A=3'b000,B=3'b001,C=3'b010,D	=3'b011,E=3'b100,F=3'b101;
    reg [2:0]state,nx_state;
      
    always@(posedge clk)begin
        if(reset)
            state<=A;
        else
            state<=nx_state;
    end
    always@(*)begin
        case(state)
            3'b000:nx_state=w?B:A;
            3'b001:nx_state=w?C:D;
            3'b010:nx_state=w?E:D;
            3'b011:nx_state=w?F:A;
            3'b100:nx_state=w?E:D;
            3'b101:nx_state=w?C:D;
            default:nx_state=A;
        endcase
    end
    assign z=((state==E)||(state==F));  
endmodule
