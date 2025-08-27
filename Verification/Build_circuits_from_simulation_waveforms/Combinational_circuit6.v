module top_module (
    input [2:0] a,
    output [15:0] q ); 
    reg [15:0]qr;
    always@(*)begin
        case(a)
            0:qr=16'h1232;
            1:qr=16'haee0;
            2:qr=16'h27d4;
            3:qr=16'h5a0e;
            4:qr=16'h2066;
            5:qr=16'h64ce;
            6:qr=16'hc526;
            7:qr=16'h2f19;
            default:qr=16'h1232;
        endcase
    end
    assign q=qr;
endmodule
