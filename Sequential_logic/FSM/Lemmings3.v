module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter [2:0] LEFT_w=3'b000, RIGHT_w=3'b001,LEFT_f=3'b010,RIGHT_f=3'b011,LEFT_d=3'b100,RIGHT_d=3'b101; //...
    reg [2:0] state, next_state;

    always @(*) begin
        case(state)
            LEFT_w:begin
                if(ground)begin
                    if(dig)
                        next_state=LEFT_d;
                    else
                    next_state=  bump_left?RIGHT_w:LEFT_w;
                end
                else
                   next_state=LEFT_f;
            end
            
            RIGHT_w:begin
                if(ground)begin
                    if(dig)
                        next_state=RIGHT_d;
                    else
                   next_state=bump_right?LEFT_w:RIGHT_w;
                end
                else
                   next_state=RIGHT_f;
            end
            LEFT_f:next_state=ground?LEFT_w:LEFT_f;
            RIGHT_f:next_state=ground?RIGHT_w:RIGHT_f;  
            LEFT_d:next_state=ground?LEFT_d:LEFT_f;
            RIGHT_d:next_state=ground?RIGHT_d:RIGHT_f;
            default:next_state=LEFT_w;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset)begin
            state<=LEFT_w;
        end
        else
            state<=next_state;
    end
    
            assign walk_left = (state ==LEFT_w);
            assign walk_right = (state == RIGHT_w);
            assign aaah=((state==LEFT_f)||(state==RIGHT_f));
            assign digging=((state==LEFT_d)||(state==RIGHT_d));
endmodule

