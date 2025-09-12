module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
parameter [2:0] s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
    reg [2:0]state,nx_state;
    always@(posedge clk)begin
            state<=nx_state;
    end
    
    always@(*)begin
        case(state)
            3'b000:nx_state=reset?s1:s0;
            3'b001:nx_state=s2;
            3'b010:nx_state=s3;
            3'b011:nx_state=s4;
            3'b100:nx_state=s0;
        endcase
    end
    assign shift_ena=((state==3'b001)|(state==3'b010)|(state==3'b011)|(state==3'b100));
endmodule
