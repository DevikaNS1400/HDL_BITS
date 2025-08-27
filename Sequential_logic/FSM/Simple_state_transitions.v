module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //
    reg [1:0] nx_st;
    parameter A=0, B=1, C=2, D=3;
    always@(*)begin
        case(state)
            A:nx_st=(in)?B:A;
            B:nx_st=(in)?B:C;
            C:nx_st=(in)?D:A;
            D:nx_st=(in)?B:C;
            default:nx_st=A;
        endcase
    end
     assign out = (state==D); //for a Moore state machine
     assign next_state=nx_st;
endmodule

