module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    //reg out;
    parameter [1:0] s0=2'b00,s1=2'b01,s2=2'b10;
    reg [1:0]state,nx_state;
    
    always@(posedge clk or negedge aresetn)begin
        if(!aresetn)
            state<=s0;
        else
            state<=nx_state;
    end
    
    always @(*)begin
        z=0;
        case(state)  
            s0:nx_state=x?s1:s0;
            s1:nx_state=x?s1:s2;
            s2:begin
                if(x)begin
                    nx_state=s1;
                    z=1'b1;
                end
                else
                    nx_state=s0;
            end
            default:nx_state=s0;
        endcase
    end        
endmodule
