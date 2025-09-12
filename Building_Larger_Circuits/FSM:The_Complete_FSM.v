module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    parameter [3:0] S=4'b0000,S1=4'b0001,S11=4'b0010,S110=4'b0011,B0=4'b0100,B1=4'b0101,B2=4'b0110,B3=4'b0111,Count=4'b1000,
                     Wait=4'b1001;
    
    reg [3:0] state,nx_state;
    
    always@(posedge clk)begin
        if(reset)
            state<=S;
        else
            state<=nx_state;
    end
    
    always@(*)begin
        case(state)
            4'b0000:nx_state=data?S1:S;
            4'b0001:nx_state=data?S11:S;
            4'b0010:nx_state=data?S11:S110;
            4'b0011:nx_state=data?B0:S;
            4'b0100:nx_state=B1;
            4'b0101:nx_state=B2;
            4'b0110:nx_state=B3;
            4'b0111:nx_state=Count;
            4'b1000:nx_state=done_counting?Wait:Count;
            4'b1001:nx_state=ack?S:Wait;
        endcase
    end
    assign shift_ena=(state==B0)|(state==B1)|(state==B2)|(state==B3);
    assign counting=(state==Count);
    assign done=(state==Wait);
endmodule
