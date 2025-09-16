module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter [3:0] A=4'd0,f1=4'd1,x1=4'd2,x2=4'd3,x3=4'd4,g_st=4'd5,y_st=4'd6,g_1=4'd7,g_0=4'd8;
    reg [3:0]state,nx_state;
    
    always@(posedge clk)begin
        if(!resetn)
            state<=A;
        else
            state<=nx_state;
    end
    
    always@(*)begin
        case(state)
            A:nx_state=(resetn)?f1:A;
            f1:nx_state=x1;
            x1:begin
                if(x)
                    nx_state=x2;
                else
                    nx_state=x1;
            end
            x2:begin
                if(!x)
                    nx_state=x3;
                else
                    nx_state=x2;
            end
            x3:begin
                if(x)
                    nx_state=g_st;
                else
                    nx_state=x1;
            end
            g_st:begin
                if(y)
                    nx_state=g_1;
                else
                    nx_state=y_st;
            end
            y_st:begin
                if(y)
                    nx_state=g_1;
                else
                    nx_state=g_0;
            end
            g_1:nx_state=(!resetn)?A:g_1;
            g_0:nx_state=(!resetn)?A:g_0;
        endcase
    end
    always@(posedge clk)begin
        case(nx_state)
            f1:f<=1'b1;
            y_st:g<=1'b1;
            g_st:g<=1;
            g_1:g<=1;
            g_0:g<=1'b0;
            default:begin
                f<=1'b0;
                g<=1'b0;
            end
        endcase
    end
            
endmodule
