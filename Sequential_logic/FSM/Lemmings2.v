module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter [1:0] LEFT_w=2'b00, RIGHT_w=2'b01,LEFT_f=2'b10,RIGHT_f=2'b11; //...
    reg [1:0] state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            LEFT_w:begin
                if(ground)
                   next_state=  bump_left?RIGHT_w:LEFT_w;
                else
                   next_state=LEFT_f;
            end
            
            RIGHT_w:begin
                if(ground)
                   next_state=bump_right?LEFT_w:RIGHT_w;
                else
                   next_state=RIGHT_f;
            end
            LEFT_f:next_state=ground?LEFT_w:LEFT_f;
            RIGHT_f:next_state=ground?RIGHT_w:RIGHT_f;           
            default:next_state=LEFT_w;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)begin
            state<=LEFT_w;
        end
        else
            state<=next_state;
    end

    // Output logic
            assign walk_left = (state ==LEFT_w);
            assign walk_right = (state == RIGHT_w);
            assign aaah=((state==LEFT_f)||(state==RIGHT_f));
endmodule
