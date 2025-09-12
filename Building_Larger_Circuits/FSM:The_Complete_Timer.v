module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

     parameter [3:0] S=4'b0000,S1=4'b0001,S11=4'b0010,S110=4'b0011,B0=4'b0100,B1=4'b0101,B2=4'b0110,B3=4'b0111,Count=4'b1000,
                     Wait=4'b1001;
    
    reg [3:0] state,nx_state;
    reg [9:0]count_1000;
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
            4'b1000:nx_state=((count==0)&(count_1000==999))?Wait:Count;
            4'b1001:nx_state=ack?S:Wait;
        endcase
    end
    
    always@(posedge clk)begin
        case(state)
            4'b0100:count[3]<=data;
            4'b0101:count[2]<=data;
            4'b0110:count[1]<=data;
            4'b0111:count[0]<=data;
            4'b1000:begin
                if(count>=0)begin
                    if(count_1000<999)
                       count_1000<=count_1000+1;
                    else begin
                        count<=count-1;
                        count_1000<=0;
                    end
                end
            end
            default:count_1000<=0;
        endcase
    end
    assign counting=(state==Count);
    assign done=(state==Wait);
endmodule
