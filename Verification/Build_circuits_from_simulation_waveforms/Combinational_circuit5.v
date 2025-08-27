module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );
    reg [3:0] q1;
    always@(*)begin
        case(c)
            0:q1=b;
            1:q1=e;
            2:q1=a;
            3:q1=d;
            default:q1=4'hf;
        endcase
    end
    assign q=q1;
endmodule
