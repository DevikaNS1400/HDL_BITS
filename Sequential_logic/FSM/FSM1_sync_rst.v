module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    parameter B=1,A=0;
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            present_state=B;
        end else begin
            case (present_state)
                A:next_state=(in==1)?A:B;
                B:next_state=(in==1)?B:A;
            endcase
            present_state = next_state; 
        end
        out=(present_state==B);
    end

endmodule
