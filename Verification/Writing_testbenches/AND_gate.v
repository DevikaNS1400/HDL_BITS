module top_module();
wire out;
reg [1:0]in;
andgate u1(.out(out),.in(in));
initial begin
    in[1]=1'b0;in[0]=1'b0;#10;
    in[0]=1'b1;#10;
    in[1]=1'b1;in[0]=1'b0;#10;
    in[1]=1'b1;in[0]=1'b1;#10;
end
endmodule
