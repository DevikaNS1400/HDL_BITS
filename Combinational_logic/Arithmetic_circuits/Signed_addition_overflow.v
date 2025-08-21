module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    reg [7:0]sum;
    wire [8:0] cout;
    assign cout[0]=0;
    integer i;
    always@(*)begin
        for(i=0;i<8;i=i+1)begin
            sum[i]=a[i]^b[i]^cout[i];
            cout[i+1]=a[i]&b[i]|b[i]&cout[i]|cout[i]&a[i];
        end
    end
    assign s=sum;
    assign overflow=cout[8]^cout[7];

endmodule
