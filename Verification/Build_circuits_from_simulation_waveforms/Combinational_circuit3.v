module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//
    wire [3:0] w;
    reg out;
    assign w={a,b,c,d};
    always@(*)begin
        case(w)
            4'b0101:out<=1'b1;
            4'b0110:out<=1'b1;
            4'b0111:out<=1'b1;
            4'b1001:out<=1'b1;
            4'b1010:out<=1'b1;
            4'b1011:out<=1'b1;
            4'b1101:out<=1'b1;
            4'b1110:out<=1'b1;
            4'b1111:out<=1'b1;
            default:out=1'b0;
        endcase
    end
    assign q = out; // Fix me

endmodule
