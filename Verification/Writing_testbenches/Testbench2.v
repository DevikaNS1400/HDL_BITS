module top_module();
wire out;
reg clk,in;
reg [2:0]s;
q7 u1(.out(out),.clk(clk),.in(in),.s(s));
always #5 clk=~clk;
initial begin
 clk=1'b0;
 in=1'b0;
 s=3'b010;#10;
 s=3'b110;#10;
 in=1'b1;
 s=3'b010;#10;
 in=1'b0;
 s=3'b111;#10;
 in=1'b1;
 s=3'b000;#30;
 in=1'b0;#10;
end
endmodule
